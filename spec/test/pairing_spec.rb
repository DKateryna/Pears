require 'rails_helper'

describe "Should pair one students" do
  let!(:user) { create :user, first_name: "Doe", email: "a@t.com", password: "b@w.com", admin: false}

  it "works for 1 students" do

    result = Pair.create_pairs
    expect(result).to eq([[user]])
  end
end

describe "Should pair two students" do
  let!(:user1) { create :user, first_name: "Doe", email: "a@t.com", password: "b@w.com", admin: false}
  let!(:user2) { create :user, first_name: "Joe", email: "b@w.com", password: "b@w.com", admin: false}

  it "works for 2 students" do

    result = Pair.create_pairs
    expect(result).to eq([[user1, user2]])
  end
end

describe "Should pair three students" do
  let!(:user1) { create :user, first_name: "Doe", email: "a@t.com", password: "a@w.com", admin: false}
  let!(:user2) { create :user, first_name: "Joe", email: "b@w.com", password: "s@w.com", admin: false}
  let!(:user3) { create :user, first_name: "Joe", email: "c@w.com", password: "d@w.com", admin: false}

  it "works for 3 students" do
    result = Pair.create_pairs

    expect(result).to match_array([[user1, user2, user3]])
  end
end

describe "Should pair four students" do
  let!(:user1) { create :user, first_name: "Doe", email: "1@t.com", password: "a@w.com", admin: false}
  let!(:user2) { create :user, first_name: "Joe", email: "2@w.com", password: "s@w.com", admin: false}
  let!(:user3) { create :user, first_name: "Joe", email: "3@w.com", password: "d@w.com", admin: false}
  let!(:user4) { create :user, first_name: "Joe", email: "4@w.com", password: "d@w.com", admin: false}

  it "works for 4 students" do
    result = Pair.create_pairs
    expect(result).to match_array([[user1, user3], [user2, user4]])
  end
end
