class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!

  def new
    @user = User.new
    render :layout => false
  end

  def create
    user = login(params[:email], params[:password])
    unless user.blank?
      redirect_to root_url, :notice => "succesvol aangemeld"
    else
      redirect_to root_url, :notice => "Email of wachtwoord is verkeerd of u heeft uw account nog niet geactiveerd."
    end
  end

  def destroy
    reset_session
    current_user = nil
    redirect_to new_user_session_path
  end
end
