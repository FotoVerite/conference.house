class ConversationsController < ApplicationController
  helper_method :mailbox, :conversation
  before_action :confirm_user_logged_in

  def new
    @listing = Listing.find(params[:listing_id])
    @users = User.find(params[:user_ids])
  end

  def create
    recipients = User.find(params[:message][:recipients])
    if params[:message][:body].present? && params[:message][:subject].present?
      conversation = current_user.send_message(recipients, params[:message][:body],  params[:message][:subject]).conversation
      redirect_to conversation_path(conversation)
    else
      @listing = Listing.find(params[:listing_id])
      @users = User.find(params[:message][:recipients])
      render :new
    end
  end

  def show
    conversation.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(conversation, params[:message][:body],  params[:message][:subject])
    redirect_to conversation_path(conversation)
  end

  def archive
    conversation.move_to_trash(current_user)
    redirect_to :conversations
  end

  def trash
    current_user.mark_as_deleted conversation
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to :conversations
  end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

end