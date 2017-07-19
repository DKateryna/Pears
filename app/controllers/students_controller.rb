class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @students = User.all_students.to_a
    @pairs = initial_matches

  end

  private


  # def opportunities
  #   self.select { |studentid| Pair.previous_matches.each {|matched| return false if matched.matched_id == studentid} }
  #   @opportunities = @students.select { |studentid| Pair.previous_matches.each {|matched| return false if matched.matched_id == studentid} }
  # end
  # @student = @students.shift
end
