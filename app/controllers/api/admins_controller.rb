class Api::AdminsController < ApplicationController

  def index
    render status: 200, json: {
      students: User.all_students,
      admins: User.all_admins
    }.to_json
  end

  def update
    user = User.find(params[:id])
    user.admin = params[:admin]

    user.save!
    render status: 204, json: {
    }.to_json
  end
end
