class Args
    def initialize(argv)
        @args = check_args(argv)
    end

    def check_args argv
        raise "Too few arguments" unless argv.count == 3
    
        seed = Integer(argv[0]) rescue false
        num_prospectors = Integer(argv[1]) rescue false
        num_turns = Integer(argv[2]) rescue false
    
        raise "Invalid arg type" unless seed && num_prospectors && num_turns
    
        if(num_prospectors < 0 || num_turns < 0)
            raise "*\nseed* should be an integer\n*num_prospectors* should be a non-negative integer\n*num_turns* should be a non-negative integer"
        end
        argv
    end
end