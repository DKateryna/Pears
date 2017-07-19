class Pairing

  def initialize
    @students = User.all_students.order(id: :asc).pluck(:id)
    @student
    @matches
    @possibilities
    @pairs = []
  end

  def select_student
    if @students.length == 1
      check_odd
    end
    @student = @students.shift
  end

  def previous_matches_student(student)
    @matches = Pair.where(user_id:student).pluck(:matched_id) #go back for half the length of the students max 5 days (use sql)
    @matches.uniq
  end

  def possible_matches
    @possibilities = @students - @matches
  end

  def add_pairs
    match = @possibilities.sample
    @students.delete(match)

    @student = User.find(@student)
    match = User.find(match)

    match = [match]
    match << @student

    @pairs << match
  end

  def check_odd
    @student = @students.shift
    @student = User.find(@student)
    @pairs.sample << @student
  end

  def create_pairs
    while !@students.empty?
      @student = select_student
      if @students.length == 0
        break;
      end
      previous_matches_student(@student)
      possible_matches
      add_pairs
    end
    return @pairs
  end

  def save_pairs
    @pairstosave = []
     @pairs.each { |pair|
      @pairstosave << Pair.new(user: pair[0], matched_id: pair[1].id)
     }
     return @pairstosave
  end
end
