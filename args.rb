class Args

    def initialize(argv)
        @seed, @num_prospectors, @num_turns = check_args(argv)
    end

    def seed
        @seed
    end

    def num_prospectors
        @num_prospectors
    end

    def num_turns
        @num_turns
    end

    def check_args argv
        kill_program unless argv.count == 3
    
        seed = Integer(argv[0]) rescue false
        num_prospectors = Integer(argv[1]) rescue false
        num_turns = Integer(argv[2]) rescue false
    
        kill_program unless seed && num_prospectors && num_turns
    
        if(num_prospectors < 0 || num_turns < 0)
            kill_program
        end
        ret = [seed, num_prospectors, num_turns]
        ret
    end

    def kill_program
        STDERR.puts("\nUsage:\nruby ruby_rush.rb *seed* *num_prospectors* *num_turns\n*seed* should be an integer\n*num_prospectors* should be a non-negative integer\n*num_turns* should be a non-negative integer")
        exit(1)
    end
end