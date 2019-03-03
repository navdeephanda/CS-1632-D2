require 'minitest/autorun'

require_relative 'location'

class LocationTest < Minitest::Test
    
    def test_search_bounds
        test_loc = Location.new("Ru-bae", 3, 2)
        real_rubies, fake_rubies = test_loc.search
        assert_includes(0..3, real_rubies)
        assert_includes(0..2, fake_rubies)
    end

    def test_next_bounds
        test_loc = Location.new("Hey I'm a location", 3, 2)

        test_loc.add_neighbors([Location.new("Hey I'm another location", 1, 2), Location.new("Me too", 2, 0)])

        next_loc = test_loc.next
        puts next_loc.name
        assert_includes(test_loc.neighbors, next_loc)
    end
end