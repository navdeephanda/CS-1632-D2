# This class represents a rubyist who plays the Ruby Rush game.
class Person
  attr_accessor :num_real_rubies
  attr_accessor :num_fake_rubies
  attr_accessor :days

  def initialize(id)
    @id = id
    @num_real_rubies = 0
    @num_fake_rubies = 0
    @days = 0

    puts "Rubyist #{@id} starting in Enumerable Canyon."
  end

  def update_rubies(num_real_rubies)
    throw ArgumentError unless num_real_rubies.is_a? Integer
    throw ArgumentError unless num_real_rubies >= 0
    @num_real_rubies += num_real_rubies
    @num_real_rubies
  end

  def update_fake_rubies(num_fake_rubies)
    throw ArgumentError unless num_fake_rubies.is_a? Integer
    throw ArgumentError unless num_fake_rubies >= 0
    @num_fake_rubies += num_fake_rubies
    @num_fake_rubies
  end

  def update_days
    @days += 1
    @days
  end

  def go_home
    puts "After #{@days} #{@days == 1 ? 'day' : 'days'}, Rubyist #{@id} found:\n\t"\
    "#{@num_real_rubies} #{@num_real_rubies == 1 ? 'ruby' : 'rubies'}.\n\t"\
    "#{@num_fake_rubies} fake #{@num_fake_rubies == 1 ? 'ruby' : 'rubies'}."

    if @num_real_rubies >= 10
      puts 'Going home victorious!'
    elsif @num_real_rubies > 0
      puts 'Going home sad.'
    else
      puts 'Going home empty-handed.'
    end
  end
end
