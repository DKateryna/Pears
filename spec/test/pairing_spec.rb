require 'rails_helper'

describe "How pairing?" do
  let!(:user1) { create :user, first_name: "Doe", email: "a@t.com", password: "b@w.com", admin: false}
  let!(:user2) { create :user, first_name: "Joe", email: "b@w.com", password: "b@w.com", admin: false}

  it "works for 2 students" do
    result = Pairing.new.create_pairs

    expect(result.length).to be(1)
  end
end
