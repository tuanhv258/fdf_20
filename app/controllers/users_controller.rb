class UsersController < ApplicationController
  def index
    @users = User.select(:id, :fullname, :email).page params[:page]
  end

  def destroy
    user = User.find_by id: params[:id]
    if user.present?
      user.destroy
      redirect_to users_path, notice: (t ".candestroy")
    else
      redirect_to users_path, notice: (t ".cantdestroy")
    end
  end
end
