class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @students = User.all_students
  end
end
