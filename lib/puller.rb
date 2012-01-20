require 'net/http'
require 'time'
require 'json'

class Puller
  attr_accessor :command, :number

  def initialize(*argv)
    parse_args(argv.clone)
    puts [command, number]
  end

  def parse_args(args)
    self.command = args.shift.strip rescue 'help'
    case command
    when 'list'
    when *%w(show get rm)
      self.number  = args.shift.strip rescue ''
    else
      self.command = 'help'
    end
  end
end
