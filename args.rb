# This class represents command-line arguments for the Ruby Rush game.
class Args
  attr_reader :seed
  attr_reader :num_prospectors
  attr_reader :num_turns

  def initialize(argv)
    @argv = argv
  end

  def validate_args
    check_arg_count(@argv)
    @seed = check_seed(@argv[0])
    @num_prospectors = check_num_prospectors(@argv[1])
    @num_turns = check_num_turns(@argv[2])
  rescue ArgumentError
    kill_program
  end

  def check_arg_count(argv)
    throw ArgumentError unless argv.count == 3
    true
  end

  def check_seed(arg_seed)
    seed = Integer(arg_seed)
    seed
  end

  def check_num_prospectors(arg_prospectors)
    num_prospectors = Integer(arg_prospectors)
    throw ArgumentError unless num_prospectors >= 0
    num_prospectors
  end

  def check_num_turns(arg_turns)
    num_turns = Integer(arg_turns)
    throw ArgumentError unless num_turns >= 0
    num_turns
  end

  def kill_program
    puts("Usage:\nruby ruby_rush.rb *seed* *num_prospectors* *num_turns\n*seed* should be an integer\n"\
    "*num_prospectors* should be a non-negative integer\n*num_turns* should be a non-negative integer")
    exit(1)
  end
end
