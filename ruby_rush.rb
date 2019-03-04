require_relative 'args.rb'; require_relative 'location.rb'; require_relative 'person.rb'
args = Args.new ARGV
args.validate_args
srand(args.seed)
enumerable_canyon = Location.new('Enumerable Canyon', 1, 1)
duck_type_beach = Location.new('Duck Type Beach', 2, 2)
monkey_patch_city = Location.new('Monkey Patch City', 1, 1)
nil_town = Location.new('Nil Town', 0, 3)
matzburg = Location.new('Matzburg', 3, 0)
hash_crossing = Location.new('Hash Crossing', 2, 2)
dynamic_palisades = Location.new('Dynamic Palisades', 2, 2)
enumerable_canyon.add_neighbors [duck_type_beach, monkey_patch_city]
duck_type_beach.add_neighbors [enumerable_canyon, matzburg]
monkey_patch_city.add_neighbors [nil_town, enumerable_canyon, matzburg]
nil_town.add_neighbors [monkey_patch_city, hash_crossing]
matzburg.add_neighbors [monkey_patch_city, duck_type_beach, hash_crossing, dynamic_palisades]
hash_crossing.add_neighbors [matzburg, nil_town, dynamic_palisades]
dynamic_palisades.add_neighbors [matzburg, hash_crossing]
(1..args.num_prospectors).each do |i|
  person = Person.new i
  location = enumerable_canyon
  (1..args.num_turns).each do |j|
    loop do
      real_rubies, fake_rubies = location.search
      person.store_the_days_winnings(real_rubies, fake_rubies)
      break if real_rubies.zero? && fake_rubies.zero?
    end
    location = location.next unless j == args.num_turns
  end
  person.go_home
end
