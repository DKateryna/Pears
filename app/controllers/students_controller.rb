class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin == false
      @pairs = Pair.find_user(current_user)
    else
      @pairs = Pair.find_all_users
    end
  end
end
