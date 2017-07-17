require 'rails_helper'
describe 'admins/index.html.erb' do
  describe "Student shouln't have an access to admin routes" do
    context 'when user is logged in' do
      before { sign_in user }
      let(:user) { create :user, admin: false }

      it 'gives 404 , access denied' do
        render
        expect(rendered).to respond_with(404)
      end
    end
  end
end
