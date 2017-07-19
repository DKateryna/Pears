class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    pairing = Pairing.new
    @pairs = pairing.create_pairs
  end

  private

end
