class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index

  end



  private

  def create_pairs
    @pairs = Pair.create_pairs
  end

  def save
    @pairs.save_pairs
  end

end
