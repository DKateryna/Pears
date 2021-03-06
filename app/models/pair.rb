class Pair < ApplicationRecord
  belongs_to :user
  after_initialize :set_instance_vars

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

  def self.how_far_back
    if @students.length > 2
      @students.count.even? ? (day = @students.length - 1) : (day = @students.length - 2)
    else
      day = 2
    end
  end

  def self.previous_matches_student
    day = how_far_back
    @matches = Pair.where(user_id:@student).or(Pair.where(user1:@student)).or(Pair.where(user2: @student)).limit(day).pluck(:user_id, :user1, :user2)
    @matches = @matches.flatten
    @matches.select! { |x| !x.nil? }
    @matches = @matches.uniq.sort
    @students.delete(@student)
  end

  def self.possible_matches
    @possibilities = @students - @matches
    if @possibilities.empty?
      @possibilities = []
      @possibilities << @students.sample
    end
  end

  def self.add_pairs

    if  @possibilities.length == 1
      match = @possibilities[0]
    else
      match = @possibilities.sample
    end

    @students.delete(match)

    @student = User.find(@student)
    match = User.find(match)

    @pairs << [@student, match]
  end

  def self.check_odd
    return unless @students.length == 1

    @student = @students.shift
    @student = User.find(@student)

    if @pairs == []

      @pairs << [@student]
    else
      @pairs.sample << @student
    end
  end

  def self.create_pairs
    @pairs = []
    @students = User.all_students.ordered.pluck(:id)

    while !@students.empty?
      @student = select_student
      if @students.length == 0
        break;
      end
      previous_matches_student
      possible_matches
      add_pairs
    end
    return @pairs
  end

  def self.save_pairs(pairs)
    pairs.each { |pair|
       if pair.length == 2
         person1 = User.find(pair[0]["id"])
         person2 = User.find(pair[1]["id"])
         @pairtosave = Pair.new(user: person1, user1: person2.id)
         @pairtosave.save
       else
         person1 = User.find(pair[0]["id"])
         person2 = User.find(pair[1]["id"])
         person3 = User.find(pair[2]["id"])

         @pairtosave = Pair.new(user: person1, user1: person2.id, user2: person3.id)
         @pairtosave.save
       end
     }
  end

  def self.find_user(current_user)
    @pairs = Pair.where(user: current_user.id.to_s)
    @pairs += Pair.where(user1: current_user.id.to_s)
    @pairs += Pair.where(user2: current_user.id.to_s)
    @pairsarray = []

    @pairs.each { |pair|
      pear = []
      pear << pair.created_at
      pear << pair.user
      pear << User.find(pair.user1)
      unless pair.user2 == nil
        pear << User.find(pair.user2)
      end
      @pairsarray << pear
    }
    return @pairsarray
  end

  def self.find_all_users
    @pairs = Pair.all
    @pairsarray = []

    @pairs.each { |pair|
      pear = []
      pear << pair.created_at
      pear << pair.user
      pear << User.find(pair.user1)
      unless pair.user2 == nil
        pear << User.find(pair.user2)
      end
      @pairsarray << pear
    }
    return @pairsarray
  end
end
