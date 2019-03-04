require_relative 'location'
require_relative 'person'

# This class represents the gameplay parameters and progression for a Ruby Rush game.
class Game
  def play(locations, num_prospectors, num_turns, random_object)
    (1..num_prospectors).each do |i|
      person = Person.new i
      location = locations[0]
      (1..num_turns).each do |j|
        loop do
          real_rubies, fake_rubies = location.search(random_object)
          person.update_rubies(real_rubies)
          person.update_fake_rubies(fake_rubies)
          person.update_days
          break if real_rubies.zero? && fake_rubies.zero?
        end
        location = location.next(random_object) unless j == num_turns
      end
      person.go_home
    end
  end
end
