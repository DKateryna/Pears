class Pair < ApplicationRecord
  belongs_to :user
  after_initialize :set_instance_vars
  scope :get_student, -> { where(user_id: @student) }


  def set_instance_vars
    @students
    @student
    @matches
    @possibilities
    @pairs
  end

  def self.select_student
    check_odd
    @student = @students.shift
  end

  def self.previous_matches_student(student)
    @matches = Pair.get_student.pluck(:matched_id) #go back for half the length of the students max 5 days (use sql)
    @matches.uniq
  end

  def self.possible_matches
    @possibilities = @students - @matches
  end

  def self.add_pairs
    @pairs = []
    match = @possibilities.sample
    @students.delete(match)

    @student = User.find(@student)
    match = User.find(match)

    match = [match]
    match << @student

    @pairs << match
  end

  def self.check_odd
    return unless @students.length == 1

    @student = @students.shift
    @student = User.find(@student)
    if @pairs.length < 1
      @pairs << @student
    else
      @pairs.sample << @student
    end
  end

  def self.create_pairs
    @students = User.all_students.ordered.pluck(:id)

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

  def self.save_pairs
    @pairtosave
     @pairs.each { |pair|
       if pair.length == 2
         @pairtosave = Pair.new(user: pair[0], matched_id: pair[1].id)
         @pairtosave.save
       else
         @pairtosave = Pair.new(user: pair[0], matched_id: pair[1].id)
         @pairtosave.save
         @pairtosave = Pair.new(user: pair[0], matched_id: pair[2].id)
         @pairtosave.save
         @pairtosave = Pair.new(user: pair[1], matched_id: pair[2].id)
         @pairtosave.save
       end
     }
  end
end
