require 'net/http'
require 'time'
require 'json'

class Puller
  attr_accessor :command, :number

  def initialize(*argv)
    parse_args(argv.clone)
  end

  private

  def parse_args(args)
    self.command = args.shift.strip rescue 'help'
    case command
    when 'list'
    when *%w(show get rm)
      self.number  = args.shift.strip rescue ''
      if valid_number?
        self.number = number.to_i
      else
        self.command = 'help'
      end
    else
      self.command = 'help'
    end
  end

  def valid_number?
    number.to_s.match(/\d+/)
  end
end
