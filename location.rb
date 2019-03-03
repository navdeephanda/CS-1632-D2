# This class represents information stored at a given location in the Ruby Rush game.
class Location
  attr_reader :neighbors
  attr_reader :name

  def initialize(name, num_real_rubies, num_fake_rubies)
    @name = name
    @num_real_rubies = num_real_rubies
    @num_fake_rubies = num_fake_rubies
    @neighbors = []
  end

  def add_neighbors(neighbor)
    @neighbors.concat neighbor
  end

  def search
    rand_real = rand(@num_real_rubies + 1)
    rand_fake = rand(@num_fake_rubies + 1)

    rubies = 'rubies'
    ruby = 'ruby'
    puts("\tFound #{rand_real} real #{rand_real == 1 ? ruby : rubies} and #{rand_fake}"\
    " fake #{rand_fake == 1 ? ruby : rubies} in #{@name}")

    ret = [rand_real, rand_fake]
    ret
  end

  def next
    next_loc = neighbors.sample
    puts("Heading from #{@name} to #{next_loc.name}")
    next_loc
  end
end
