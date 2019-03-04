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

  # If the Person possesses zero rubies, go_home prints the Person's real and fake
  # ruby count, and prints "Going home empty-handed."
  def test_go_home_zero_rubies
    test_rubyist = Person.new(1)
    assert_output(/After 0 days, Rubyist 1 found:\n\t0 rubies.\n\t0 fake rubies.\nGoing home empty-handed./) {test_rubyist.go_home}
  end
  
  # If the Person possesses between 1 and 9 (inclusive) rubies, go_home prints the Person's real and fake
  # ruby count, and prints "Going home sad."
  def test_go_home_between_one_and_nine_rubies
    test_rubyist = Person.new(1)
    test_rubyist.num_real_rubies = 7
    test_rubyist.num_fake_rubies = 6
    assert_output(/After 0 days, Rubyist 1 found:\n\t7 rubies.\n\t6 fake rubies.\nGoing home sad./) {test_rubyist.go_home}
  end

  # If the Person possesses 10 rubies, go_home prints the Person's real and fake
  # ruby count, and prints "Going home victorious!"
  def test_go_home_ten_rubies
    test_rubyist = Person.new(1)
    test_rubyist.num_real_rubies = 10
    test_rubyist.num_fake_rubies = 5
    assert_output(/After 0 days, Rubyist 1 found:\n\t10 rubies.\n\t5 fake rubies.\nGoing home victorious!/) {test_rubyist.go_home}
  end

  # If the Person possesses more than 10 rubies, go_home prints the Person's real and fake
  # ruby count, and prints "Going home victorious!"
  def test_go_home_more_than_ten_rubies
    test_rubyist = Person.new(1)
    test_rubyist.num_real_rubies = 11
    test_rubyist.num_fake_rubies = 0
    assert_output(/After 0 days, Rubyist 1 found:\n\t11 rubies.\n\t0 fake rubies.\nGoing home victorious!/) {test_rubyist.go_home}
  end

  # The following tests were written after a bug was discovered wherein the Person was not referred to by the appropriate ID;
  # instead, they were referred to as Rubyist 1 no matter what.

  # Tests that go_home refers to the Person by the appropriate user ID.
  def test_go_home_matches_user_id
    test_rubyist = Person.new(7)
    assert_output(/After 0 days, Rubyist 7 found:\n\t0 rubies.\n\t0 fake rubies.\nGoing home empty-handed./) {test_rubyist.go_home}
  end

  # Tests that go_home accurately represents the number of days the Person has spent searching
  def test_go_home_matches_num_days
    test_rubyist = Person.new(1)
    test_rubyist.days = 7
    assert_output(/After 7 days, Rubyist 1 found:\n\t0 rubies.\n\t0 fake rubies.\nGoing home empty-handed./) {test_rubyist.go_home}
  end

  # UNIT TESTS FOR METHOD update_rubies(real_rubies)
  # Equivalence classes:
  # real_rubies = -INFINITY..-1 -> throws ArgumentError
  # real_rubies = 0..INFINITY -> returns person.num_real_rubies + real_rubies and updates person.num_real_rubies
  # to this value
  # real_rubies = (not a number) -> throws ArgumentError

  # If real_rubies is a positive integer, then person.num_real_rubies + real_rubies is returned and person.num_real_rubies
  # is updated to this value
  def test_update_rubies_valid_int_positive
    test_rubyist = Person.new(1)
    assert_equal(test_rubyist.update_rubies(7), 7)
  end

  # If real_rubies is a negative integer, then an ArgumentError is thrown.
  def test_update_rubies_invalid_int_negative
    test_rubyist = Person.new(1)
    assert_raises(ArgumentError) {test_rubyist.update_rubies(-7)}
  end

  # If real_rubies is a string, then an ArgumentError is thrown.
  def test_update_rubies_invalid_string
    test_rubyist = Person.new(1)
    assert_raises(ArgumentError) {test_rubyist.update_rubies("baz")}
  end

  # If real_rubies is a decimal value such as a double, then an ArgumentError is thrown.
  def test_update_rubies_invalid_double
    test_rubyist = Person.new(1)
    assert_raises(ArgumentError) {test_rubyist.update_rubies(2.5)}
  end

  # UNIT TESTS FOR METHOD update_fake_rubies(fake_rubies)
  # Equivalence classes:
  # fake_rubies = -INFINITY..-1 -> throws ArgumentError
  # fake_rubies = 0..INFINITY -> returns player.num_fake_rubies + fake_rubies and updates player.num_fake_rubies
  # to this value
  # fake_rubies = (not a number) -> throws ArgumentError

  # If fake_rubies is a positive integer, then person.num_fake_rubies + fake_rubies is returned and person.num_fake_rubies
  # is updated to this value
  def test_update_fake_rubies_valid_int_positive
    test_rubyist = Person.new(1)
    assert_equal(test_rubyist.update_fake_rubies(7), 7)
  end

  # If fake_rubies is a negative integer, then an ArgumentError is thrown.
  def test_update_fake_rubies_invalid_int_negative
    test_rubyist = Person.new(1)
    assert_raises(ArgumentError) {test_rubyist.update_fake_rubies(-7)}
  end

  # If fake_rubies is a string, then an ArgumentError is thrown.
  def test_update_fake_rubies_invalid_string
    test_rubyist = Person.new(1)
    assert_raises(ArgumentError) {test_rubyist.update_fake_rubies("baz")}
  end

  # If fake_rubies is a decimal value such as a double, then an ArgumentError is thrown.
  def test_update_fake_rubies_invalid_double
    test_rubyist = Person.new(1)
    assert_raises(ArgumentError) {test_rubyist.update_fake_rubies(2.5)}
  end

  # UNIT TESTS FOR METHOD update_days
  # This method has no equivalence classes, as it has no input and merely 
  # increments the number of days in the person's "days" member by 1. I am
  # not worried about an Integer overflow because, practically, nobody will 
  # play the game enough times to cause one and because Ruby automatically
  # converts integers to large integer classes when they overflow.
  
  def test_update_days
    test_rubyist = Person.new(1)
    assert_equal(test_rubyist.update_days, 1)
  end

end