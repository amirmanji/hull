module Hull
  class Command

    BASH_COLORS = {
      :reset  => "0",
      :red    => "31",
      :green  => "32",
      :yellow => "33",
      :purple => "34",
      :pink   => "35",
      :cyan   => "36",
      :white  => "37",
    }

    def write(text, color)
      if BASH_COLORS.keys.include?(color)
        "\033[#{BASH_COLORS[color]}m#{text}\033[#{BASH_COLORS[:reset]}m"
      else
        text
      end
    end

    def error(text); puts "#{write('error', :red)     }: #{text}"; end
    def warn(text);  puts "#{write('warning', :purple)}: #{text}"; end
    def note(text);  puts "#{write('note', :green)    }: #{text}"; end

    def column_size
      [ `stty size`.scan(/\d+/).last.to_i, 80 ].max
    end

    def pad_left(str, length)
      "% #{length}s" % str[0, length]
    end

    def pad_right(str, length)
      if str.length > length
        "#{str[0, length - 3]}..."
      elsif str.length < length
        "#{str}#{' ' * (length - str.length)}"
      else
        str
      end
    end

    def username
      @username ||= repo.config['github.user']
    end

    def api_token
      @api_token ||= repo.config['github.token']
    end

    def github_url
      @github_url ||=
        begin
          puts repo.config['remote.origin.url']
          _, owner, project = repo.config['remote.origin.url'].match(/^git@github.com:([^\/]*)\/(.*)\.git/).to_a
          puts owner
          puts project
          "https://github.com/api/v2/json/pulls/#{owner}/#{project}"
        end
    end

    def repo
      @repo ||= Grit::Repo.new(".")
      unless valid_repository?(@repo)
        raise InvalidRepository.new('Origin must be a GitHub repository')
      end
      @repo
    end

    def get_json(url)
      options = {
        :http_basic_authentication => [
          "#{username}/token",
          api_token
        ]
      }
      JSON.load(open(url, options))
    end

    def valid_repository?(repository)
      repository.remote_list.include?('origin') &&
        repository.config['remote.origin.url'].match(/^git@github.com:/)
    end
  end

  class InvalidRepository < RuntimeError; end
end
