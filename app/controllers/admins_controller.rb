class AdminsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :user

  def index
    @students = User.all_students
    @admins = User.all_admins
   end

  def update
    user = User.find(params[:id])
    user.admin = params[:admin]
    user.save!
    redirect_to admins_root_path
  end
end
