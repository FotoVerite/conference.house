class ApplicationController < ActionController::Base
  serialization_scope :view_context


  include SessionMethods
  protect_from_forgery with: :exception
  before_action :logged_in?

  def confirm_staff_login
    unless logged_in?
      session[:desired_url] = url_for(santize_parameters)
      flash[:notice] = 'Please log in.'
      redirect_to(new_access_path)
    end
    true
  end

  def confirm_user_logged_in
    unless session[:id].to_i > 0

      respond_to do |format|
          format.html do
            session[:desired_url] = url_for(params.permit(:controller, :action, :user_ids, :listing_id))
            flash[:notice] = "Please log in."
            redirect_to(login_path) and return false
          end
          format.js do
            render :json => {
                :message => "You must be logged in",
                :success => false
              }
          end
      end
    end
    return true
  end

  private

    def render_404
      render(file: 'application/error_page_404', status: 404)
      true  # so we can do "render_404 and return"
    end

    def render_500
      render(file: 'application/error_page_500', status: 500)
      true  # so we can do "render_500 and return"
    end

end
