require 'minitest/autorun'

require_relative 'person'

class PersonTest < Minitest::Test
    def test_go_home_zero_rubies
        test_rubyist = Person.new(1)
        assert_output(/After 0 days, Rubyist 1 found:\n\t0 rubies.\n\t0 fake rubies.\nGoing home empty-handed./) {test_rubyist.go_home}
    end

    def test_go_home_between_one_and_nine_rubies
        test_rubyist = Person.new(1)
        test_rubyist.num_real_rubies = 7
        test_rubyist.num_fake_rubies = 6
        assert_output(/After 0 days, Rubyist 1 found:\n\t7 rubies.\n\t6 fake rubies.\nGoing home sad./) {test_rubyist.go_home}
    end

    def test_go_home_ten_rubies
        test_rubyist = Person.new(1)
        test_rubyist.num_real_rubies = 10
        test_rubyist.num_fake_rubies = 5
        assert_output(/After 0 days, Rubyist 1 found:\n\t10 rubies.\n\t5 fake rubies.\nGoing home victorious!/) {test_rubyist.go_home}
    end

    def test_go_home_more_than_ten_rubies
        test_rubyist = Person.new(1)
        test_rubyist.num_real_rubies = 11
        test_rubyist.num_fake_rubies = 0
        assert_output(/After 0 days, Rubyist 1 found:\n\t11 rubies.\n\t0 fake rubies.\nGoing home victorious!/) {test_rubyist.go_home}
    end

    def test_store_the_days_winnings_int_args
        test_rubyist = Person.new(1)
        test_rubyist.store_the_days_winnings(7, 6)
        assert_equal(test_rubyist.num_real_rubies, 7)
        assert_equal(test_rubyist.num_fake_rubies, 6)
        assert_equal(test_rubyist.days, 1)
    end

end