require_relative 'args.rb'; require_relative 'location.rb'; require_relative 'person.rb'; require_relative 'game.rb'
args = Args.new ARGV; args.validate_args
random_object = Random.new(args.seed)
enum_canyon = Location.new('Enumerable Canyon', 1, 1)
duck_type_beach = Location.new('Duck Type Beach', 2, 2)
monkey_patch_city = Location.new('Monkey Patch City', 1, 1)
nil_town = Location.new('Nil Town', 0, 3)
matzburg = Location.new('Matzburg', 3, 0)
hash_crossing = Location.new('Hash Crossing', 2, 2)
dynamic_palisades = Location.new('Dynamic Palisades', 2, 2)
enum_canyon.add_neighbors [duck_type_beach, monkey_patch_city]
duck_type_beach.add_neighbors [enum_canyon, matzburg]
monkey_patch_city.add_neighbors [nil_town, enum_canyon, matzburg]
nil_town.add_neighbors [monkey_patch_city, hash_crossing]
matzburg.add_neighbors [monkey_patch_city, duck_type_beach, hash_crossing, dynamic_palisades]
hash_crossing.add_neighbors [matzburg, nil_town, dynamic_palisades]
dynamic_palisades.add_neighbors [matzburg, hash_crossing]
locations = [enum_canyon, duck_type_beach, monkey_patch_city, nil_town, matzburg, hash_crossing, dynamic_palisades]
game = Game.new
game.play(locations, args.num_prospectors, args.num_turns, random_object)
