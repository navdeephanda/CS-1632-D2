require 'minitest/autorun'

require_relative 'args'

class ArgsTest < Minitest::Test

    def test_normal_args
        test_args = [1, 2, 3]
        args = Args.new test_args

        assert_equal(test_args[0], args.seed)
        assert_equal(test_args[1], args.num_prospectors)
        assert_equal(test_args[2], args.num_turns)
    end

    # def test_too_few_args
    # end

    # def test_negative_num_prospectors
    # end

    # def test_negative_num_turns
    # end

    # def test_invalid_arg_type
    # end

end