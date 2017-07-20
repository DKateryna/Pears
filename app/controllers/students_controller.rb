class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def create_pairs
    @pairs = Pair.create_pairs
  end



  private



  def save
    @pairs.save_pairs
  end

end
