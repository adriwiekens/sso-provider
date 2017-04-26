class HomeController < ApplicationController
  def show
    unless current_user
      redirect_to new_user_session_path
    end
  end
end
