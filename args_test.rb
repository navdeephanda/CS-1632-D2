require 'minitest/autorun'
require_relative 'args'

class ArgsTest < Minitest::Test

  # Check, in a quasi-functional manner, that if a valid
  # set of arguments is passed into the constructor and
  # validated, that the members of the Args object are
  # initialized to what is specified on the command line.
  def test_normal_usage
    test_args = [1, 2, 3]
    args = Args.new test_args
    args.validate_args

    assert_equal(test_args[0], args.seed)
    assert_equal(test_args[1], args.num_prospectors)
    assert_equal(test_args[2], args.num_turns)
  end

  # UNIT TESTS FOR METHOD check_arg_count(argv)
  # Equivalence classes:
  # argv has 3 elements -> returns true
  # argv has less than or more than 3 elements -> throws ArgumentError
  # NOTE: there are two separate tests for the latter equivalence class
  # because it is feasible to expect a programmer to implement this
  # such that it throws an error if there are too few args but does not
  # if there are too many.

  # If the number of arguments is 3, true is returned.
  def test_just_right_args
    test_args = [1, 2, 3]
    args = Args.new test_args
    assert_equal(true, args.check_arg_count(test_args))
  end

  # If the number of arguments is less than 3, an ArgumentError is raised.
  def test_too_few_args
    test_args = [1, 2]
    args = Args.new test_args
    assert_raises(ArgumentError) {args.check_arg_count(test_args)}
  end

  # If the number of arguments is greater than 3, an ArgumentError is raised.
  def test_too_many_args
    test_args = [1, 2, 3, 4]
    args = Args.new test_args
    assert_raises(ArgumentError) {args.check_arg_count(test_args)}
  end

  # UNIT TESTS FOR METHOD check_seed(seed)
  # Equivalence classes:
  # seed can be converted to an integer from -INFINITY..INFINITY -> returns seed as an Integer
  # seed cannot be converted to an integer from -INFINITY..INFINITY -> throws ArgumentError

  # If the seed is a string that can be interpreted as a positive integer, the Integer representation
  # of that string is returned.
  def test_check_seed_valid_int_positive
    test_args = [1, 2, 3]
    args = Args.new test_args
    assert_equal(1, args.check_seed(test_args[0]))
  end

  # If the seed is a string that can be interpreted as a negative integer, the Integer representation
  # of that string is returned.
  def test_check_seed_valid_int_negative
    test_args = [-1, 2, 3]
    args = Args.new test_args
    assert_equal(-1, args.check_seed(test_args[0]))
  end

  # If the seed is a string that cannot be interpreted as an integer, an ArgumentError is raised.
  # EDGE CASE
  def test_check_seed_invalid_string
    test_args = ["foo", 2, 3]
    args = Args.new test_args
    assert_raises(ArgumentError) {args.check_seed(test_args[0])}
  end

  # def test_check_seed_invalid_double
  #   test_args = [1.2, 2, 3]
  #   args = Args.new test_args
  #   assert_raises(ArgumentError) {args.check_seed(test_args[0])}
  # end

  # UNIT TESTS FOR METHOD check_num_prospectors(num_prospectors)
  # Equivalence classes:
  # num_prospectors can be converted to an integer from 0..INFINITY -> returns num_prospectors as Integer
  # num_prospectors can be converted to an integer from -INFINITY..-1 -> throws ArgumentError
  # num_prospectors cannot be converted to an integer from -INFINITY..INFINITY -> throws ArgumentError

  # If the seed is a string that can be interpreted as a positive integer, the Integer representation
  # of that string is returned.
  def test_check_num_prospectors_valid_int_positive
    test_args = [1, 2, 3]
    args = Args.new test_args
    assert_equal(2, args.check_num_prospectors(test_args[1]))
  end

  # If the seed is a string that can be interpreted as a negative integer, an ArgumentError is raised.
  def test_check_num_prospectors_valid_int_negative
    test_args = [1, -2, 3]
    args = Args.new test_args
    assert_raises(ArgumentError) {args.check_num_prospectors(test_args[1])}
  end

  # If the seed is a string that cannot be interpreted as an integer, an ArgumentError is raised.
  # EDGE CASE
  def test_check_num_prospectors_invalid_string
    test_args = [1, "bar", 3]
    args = Args.new test_args
    assert_raises(ArgumentError) {args.check_num_prospectors(test_args[1])}
  end

  # def test_check_num_prospectors_invalid_double
  # end

  # UNIT TESTS FOR METHOD check_num_turns_type(num_turns)
  # Equivalence classes:
  # num_turns can be converted to an integer from 0..INFINITY -> returns num_turns as Integer
  # num_turns can be converted to an integer from -INFINITY..-1 -> throws ArgumentError
  # num_turns cannot be converted to an integer from -INFINITY..INFINITY -> throws ArgumentError

  # If the seed is a string that can be interpreted as a positive integer, the Integer representation
  # of that string is returned.
  def test_check_num_turns_valid_int_positive
    test_args = [1, 2, 3]
    args = Args.new test_args
    assert_equal(3, args.check_num_turns(test_args[2]))
  end

  # If the seed is a string that can be interpreted as a negative integer, an ArgumentError is raised.
  def test_check_num_turns_valid_int_negative
    test_args = [1, 2, -3]
    args = Args.new test_args
    assert_raises(ArgumentError) {args.check_num_prospectors(test_args[2])}
  end
  
  # If the seed is a string that cannot be interpreted as an integer, an ArgumentError is raised.
  # EDGE CASE
  def test_check_num_turns_invalid_string
    test_args = [1, 2, "baz"]
    args = Args.new test_args
    assert_raises(ArgumentError) {args.check_num_prospectors(test_args[2])}
  end

  # def test_check_num_turns_invalid_double
  # end

  # UNIT TESTS FOR METHOD kill_program
  # This method has no equivalence classes. It has no input parameters,
  # and its contents are entirely deterministic: it simply displays a static
  # message and exits the program with an error code of 1. Any failure of
  # this method would seem to indicate a grave error with the Ruby language!
  def test_kill_program
    test_args = [1, -2, -1]
    args = Args.new test_args
    args.stub(:exit, 1) do
      assert_output("Usage:\nruby ruby_rush.rb *seed* *num_prospectors* *num_turns\n*seed* should be an integer\n*num_prospectors* should be a non-negative integer\n*num_turns* should be a non-negative integer\n"){args.kill_program}
      assert_equal(1, args.kill_program)
    end
  end

end
