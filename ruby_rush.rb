require_relative 'args.rb'

args = Args.new ARGV
srand(args.seed)
