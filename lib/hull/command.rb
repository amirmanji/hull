module Hull
  class Command
    attr_accessor :command, :number

    def initialize(*argv)
      parse_args(argv.clone)
    end

    def run
      case command
      when 'list'
        List.new
      when 'show'
        Show.new(number)
      when 'pull', 'checkout', 'co'
        Pull.new(number)
      when 'rm', 'remove', 'delete'
        Remove.new(number)
      else # help
      end
    end

    private

    def parse_args(args)
      self.command = args.shift.strip rescue 'help'
      case command
      when /^list$/
      when /^(show|checkout|co|pull|rm|remove|delete)$/
        self.number  = args.shift.strip rescue ''
        self.command = 'help' unless valid_number?
      else
        self.command = 'help'
      end
    end

    def valid_number?
      number.to_s.match(/\d+/)
    end

  end
end
