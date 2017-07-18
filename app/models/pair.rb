class Pair < ApplicationRecord
  belongs_to :user

  def previous_matches_student(id)
    Pair.where(user_id:id)
  end
end
