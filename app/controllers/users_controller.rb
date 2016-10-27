class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.select(:id, :fullname, :email).page params[:page]
  end

  def destroy
    user = User.find_by id: params[:id]
    if user.present?
      if user.destroy
        redirect_to :back, notice: (t ".candestroy")
      else
        redirect_to :back, notice: (t ".cantdestroy")
      end
    else
      redirect_to :back, notice: (t ".usernotfound")
    end
  end
end
