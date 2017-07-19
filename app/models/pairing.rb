class Pairing

  def initialize
    @students = User.all_students.pluck(:id)
  end

  def selected_student
    @students.shift
  end

  def previous_matches_student
    @matches = Pair.where(user_id:selected_student).pluck(:matched_id)
    @matches.uniq
  end

  def possible_matches
    @possibilities = @students - @matches
  end

  def add_pairs
    match = @possibilities.sample
    @students.delete(match)

    match = [match]
    match << student

    @pairs = []
    @pairs << match
  end

end













students = User.all_students.pluck(:id)
student = students.shift
matches = Pair.where(user_id:student).pluck(:matched_id)
possibilities = students - matches
