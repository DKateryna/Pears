require 'rails_helper'
require 'spec_helper'

describe Api::AdminsController, type: :controller do
  describe "GET 'index' " do
    let!(:user1) { create :user, first_name: "one", email: "1@t.com", password: "a@w.com", admin: false}
    let!(:user2) { create :user, first_name: "two", email: "2@w.com", password: "s@w.com", admin: false}
    let!(:user3) { create :user, first_name: "admin", email: "3@w.com", password: "d@w.com", admin: true}

    it "returns a successful 200 response" do
       get :index, format: :json
      expect(response).to be_success
    end

    it "returns all the students and admins" do

      get :index, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['students']).to eq(JSON.parse([user1, user2].to_json))
      expect(parsed_response['admins']).to eq(JSON.parse([user3].to_json))
    end
  end
end
