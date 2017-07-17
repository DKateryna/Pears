class AdminsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :user

  def index
    @students = User.all_students
   end
end
