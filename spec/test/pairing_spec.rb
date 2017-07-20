require 'rails_helper'

describe "Should pair one students" do
  let!(:user) { create :user, first_name: "Doe", email: "a@t.com", password: "b@w.com", admin: false}

  it "works for 1 students" do

    result = Pair.create_pairs
    expect(result.length).to be(1)
  end
end

describe "Should pair two students" do
  let!(:user1) { create :user, first_name: "Doe", email: "a@t.com", password: "b@w.com", admin: false}
  let!(:user2) { create :user, first_name: "Joe", email: "b@w.com", password: "b@w.com", admin: false}

  it "works for 2 students" do

    result = Pair.create_pairs
    expect(result.length).to be(1)
  end
end

describe "Should pair three students" do
  let!(:user1) { create :user, first_name: "Doe", email: "a@t.com", password: "a@w.com", admin: false}
  let!(:user2) { create :user, first_name: "Joe", email: "b@w.com", password: "s@w.com", admin: false}
  let!(:user3) { create :user, first_name: "Joe", email: "c@w.com", password: "d@w.com", admin: false}

  it "works for 3 students" do
    result = Pair.create_pairs

    expect(result.length).to be(1)
  end
end

describe "Should pair four students" do
  let!(:user1) { create :user, first_name: "Doe", email: "a@t.com", password: "a@w.com", admin: false}
  let!(:user2) { create :user, first_name: "Joe", email: "b@w.com", password: "s@w.com", admin: false}
  let!(:user3) { create :user, first_name: "Joe", email: "c@w.com", password: "d@w.com", admin: false}
  let!(:user4) { create :user, first_name: "Joe", email: "d@w.com", password: "d@w.com", admin: false}

  let! (:match1) {create :pair, user: user1, matched_id: user2.id}
  let! (:match2) {create :pair, user: user3, matched_id: user4.id}

  it "works for 4 students" do
    result = Pair.create_pairs
    expect(result).not_to contain_exactly(match1, match2)
  end
end
