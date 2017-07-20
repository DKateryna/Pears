class Api::AdminsController < ApplicationController

  def index
    render status: 200, json: {
      students: User.all_students,
      admins: User.all_admins
    }.to_json
  end

end
