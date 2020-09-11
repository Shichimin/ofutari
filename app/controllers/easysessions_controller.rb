class EasysessionsController < ApplicationController
  def create
    user = User.find_by(email: "test@example.com")
    sign_in(user)
    redirect_to root_path
  end
end
