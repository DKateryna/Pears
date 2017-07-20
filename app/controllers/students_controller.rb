class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pairs = Pair.where("user = '?' OR matched_id = '?'", current_user.id, current_user.id)
  end
end
