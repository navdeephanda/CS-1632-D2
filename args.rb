# This class represents command-line arguments for the Ruby Rush game.
class Args
  attr_reader :seed
  attr_reader :num_prospectors
  attr_reader :num_turns

  def initialize(argv)
    @seed, @num_prospectors, @num_turns = check_args(argv)
  end

  def check_args(argv)
    if argv.count != 3
      raise "\nUsage:\nruby ruby_rush.rb *seed* *num_prospectors* *num_turns*\n*seed* should be an integer\n"\
      "*num_prospectors* should be a non-negative integer\n*num_turns* should be a non-negative integer"
    end

    begin
      seed = Integer(argv[0])
      num_prospectors = Integer(argv[1])
      num_turns = Integer(argv[2])
    rescue ArgumentError
      raise "\nUsage:\nruby ruby_rush.rb *seed* *num_prospectors* *num_turns*\n*seed* should be an integer\n"\
      "*num_prospectors* should be a non-negative integer\n*num_turns* should be a non-negative integer"
    end

    if num_prospectors < 0 || num_turns < 0
      raise "\nUsage:\nruby ruby_rush.rb *seed* *num_prospectors* *num_turns\n*seed* should be an integer\n"\
      "*num_prospectors* should be a non-negative integer\n*num_turns* should be a non-negative integer"
    end
    ret = [seed, num_prospectors, num_turns]
    ret
  end
end
