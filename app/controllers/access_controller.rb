class AccessController < ApplicationController

  def new
    @hide_navigation = true
    # Don't remember referrer for staff area, only in member areas
    session[:referrer_url] = nil
    # display login form
  end

  def create
    logout_keeping_session!
    user = User.authenticate(params['auth_param'], params['password'])
    if user && user.enabled?
      self.current_user = user
      handle_remember_cookie!(user, params[:remember_me] == '1')
      flash[:notice] = 'You are now logged in.'
      redirect_to desired_url(root_path)
    elsif user && !user.enabled?
      flash[:error] = 'Your account has been disabled.'
      render('new')
    else
      msg = 'Username/password combination not found. Please try again.'
      flash[:error] = msg
      render('new')
    end
  end

  def destroy
    logout_keeping_session!
    flash[:notice] = 'You are now logged out.'
    redirect_to(root_path)
  end

  def forgot_password
    # display form
  end

  private

    def desired_url(fallback_url=nil, options={})
      fallback_url ||= { action: 'index' }
      key = options[:key] || :desired_url
      if session[key]
        url = session[key]
        session[key] = nil
      elsif session[:referrer_url]
        url = session[:referrer_url]
        session[:referrer_url] = nil
      else
        url = fallback_url
      end
      url
    end
end
