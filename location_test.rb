require 'minitest/autorun'
require_relative 'location'

class LocationTest < Minitest::Test

  # UNIT TESTS FOR METHOD search(random_object)
  # Equivalence classes:
  # random_object = A valid Random object -> returns a number of rubies and a number of fake rubies between 
  # 0 and the maximum specified at a location upon object creation.
  # random_object = (not a valid Random object) -> throws ArgumentError

  # If a valid Random object is passed in, returns a number of rubies and a number of fake rubies between 
  # 0 and the maximum specified at a location upon object creation.
  def test_search
    test_loc = Location.new("Ru-bae", 3, 2)
    random = Random.new(1)
    random.stub(:rand, 1) do
      real_rubies, fake_rubies = test_loc.search(random)
      assert_equal(1, real_rubies)
      assert_equal(1, fake_rubies)
    end
  end

  # If anything other than a valid Random object is passed in, an Argument Error is raised.
  def test_search_invalid_random_object
    test_loc = Location.new("Ru-bae", 3, 2)
    assert_raises(ArgumentError) {test_loc.search("foo")}
  end

  # UNIT TESTS FOR METHOD next(random_object)
  # Equivalence classes:
  # random_object = A valid Random object -> returns a randomly selected neighbor of the location
  # object under test
  # random_object = (not a valid Random object) -> throws ArgumentError

  # If a valid Random object is passed in, returns a randomly selected neighbor of the location
  # object under test
  def test_next
    test_loc = Location.new("Hey I'm a Location", 3, 2)
    test_loc.add_neighbors([Location.new("Hey I'm another location", 1, 2), Location.new("Me too", 2, 0)])
    
    random = Random.new(1)
    random.stub(:rand, 1) do
      next_loc = test_loc.next(random)
      assert_equal("Me too", next_loc.name)
    end
  end
  
  # If anything other than a valid Random object is passed in, an Argument Error is raised.
  def test_next_invalid_random_object
    test_loc = Location.new("Ru-bae", 3, 2)
    assert_raises(ArgumentError) {test_loc.search("foo")}
  end

end