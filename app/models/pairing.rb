class Pairing

  def initialize
    @students = User.all_students.pluck(:id)
    @student
    @matches
    @possibilities
    @pairs = []
  end

  def select_student
    @student = @students.shift
  end

  def previous_matches_student(student)
    @matches = Pair.where(user_id:student).pluck(:matched_id)
    @matches.uniq
  end

  def possible_matches
    @possibilities = @students - @matches
  end

  def add_pairs
    match = @possibilities.sample
    @students.delete(match)

    Pair.new(user: User.find(@student), matched_id: match)

    @student = User.find(@student)
    match = User.find(match)

    match = [match]
    match << @student

    @pairs << match
  end

  def create_pairs
    while !@students.empty?
      @student = select_student
      previous_matches_student(@student)
      possible_matches
      add_pairs
    end
    return @pairs
  end
end
