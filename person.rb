# This class represents a rubyist who plays the Ruby Rush game.
class Person
  attr_accessor :num_real_rubies
  attr_accessor :num_fake_rubies
  attr_reader :days

  def initialize(id)
    @id = id
    @num_real_rubies = 0
    @num_fake_rubies = 0
    @days = 0

    puts "Rubyist #{@id} starting in Enumerable Canyon."
  end

  def store_the_days_winnings(num_real_rubies, num_fake_rubies)
    @num_real_rubies += num_real_rubies
    @num_fake_rubies += num_fake_rubies
    @days += 1
  end

  def go_home
    puts "After #{@days} #{@days == 1 ? 'day' : 'days'}, Rubyist 1 found:\n\t"\
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
