class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pairs = Pair.find_users(current_user)
  end
end
