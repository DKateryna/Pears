class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pairing = Pairing.new
  end

  private

end
