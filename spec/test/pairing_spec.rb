require 'rails_helper'

describe "Should pair two students" do
  let!(:user1) { create :user, first_name: "Doe", email: "a@t.com", password: "b@w.com", admin: false}
  let!(:user2) { create :user, first_name: "Joe", email: "b@w.com", password: "b@w.com", admin: false}

  it "works for 2 students" do

    result = Pairing.new.create_pairs
    expect(result.length).to be(1)
  end
end

describe "Should pair three students" do
  let!(:user1) { create :user, first_name: "Doe", email: "a@t.com", password: "a@w.com", admin: false}
  let!(:user2) { create :user, first_name: "Joe", email: "b@w.com", password: "s@w.com", admin: false}
  let!(:user3) { create :user, first_name: "Joe", email: "c@w.com", password: "d@w.com", admin: false}

  it "works for 3 students" do
    result = Pairing.new.create_pairs

    expect(result.length).to be(1)
  end
end
