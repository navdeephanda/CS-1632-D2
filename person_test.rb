require 'minitest/autorun'
require_relative 'person'

class PersonTest < Minitest::Test

  # UNIT TESTS FOR METHOD go_home
  # Equivalence classes (assuming "zero" days have passed and person is Rubyist 1):
  # User has x=0 rubies and y=0..infinity fake rubies -> output: 
  # After 0 days, Rubyist 1 found:
  #   x rubies.
  #   y fake rubies.
  # Going home empty-handed.
  #
  # User has x = 1..9 (inclusive) rubies and y=0..infinity fake rubies -> output:
  # After 0 days, Rubyist 1 found:
  #   x rubies.
  #   y fake rubies.
  # Going home sad.
  #
  # User has x>=10 or more rubies and y=0..infinity fake rubies -> output:
  # After 0 days, Rubyist 1 found:
  #   x rubies.
  #   y fake rubies.
  # Going home victorious!

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

  # The following tests were written after a bug was discovered wherein the user was not referred to by the appropriate ID;
  # instead, they were referred to as Rubyist 1 no matter what.
  def test_go_home_matches_user_id
    test_rubyist = Person.new(7)
    assert_output(/After 0 days, Rubyist 7 found:\n\t0 rubies.\n\t0 fake rubies.\nGoing home empty-handed./) {test_rubyist.go_home}
  end

  def test_go_home_matches_num_days
    test_rubyist = Person.new(1)
    assert_output(/After 0 days, Rubyist 1 found:\n\t0 rubies.\n\t0 fake rubies.\nGoing home empty-handed./) {test_rubyist.go_home}
  end


  # UNIT TESTS FOR METHOD store_the_days_winnings(real_rubies, fake_rubies)
  # Equivalence classes:
  # real_rubies = -INFINITY..-1 OR fake_rubies = -INFINITY..-1 -> returns -x
  # real_rubies = 0..INFINITY AND fake_rubies = 0..INFINITY -> returns x
  # real_rubies = (not a number) OR fake_rubies = (not a number) -> returns nil

  def test_store_the_days_winnings_positive_int_args
    test_rubyist = Person.new(1)
    test_rubyist.store_the_days_winnings(7, 6)
    assert_equal(test_rubyist.num_real_rubies, 7)
    assert_equal(test_rubyist.num_fake_rubies, 6)
    assert_equal(test_rubyist.days, 1)
  end

  def test_store_the_days_winnings_negative_int_args
    test_rubyist = Person.new(1)
    test_rubyist.store_the_days_winnings(7, 6)

  end

  def test_store_the_days_winnings_invalid_arg_type
  end

end