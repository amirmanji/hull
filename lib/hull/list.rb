module Hull
  class List < Command
    def initialize
      json = get_json(github_url)
      if json['error'].to_s != ''
        return error("Pull request ##{request_number} might not exist.")
      end

      pulls = json['pulls']
      puts "Number of pull requests: #{pulls.length}"
      return if pulls.length == 0

      branch_names = pulls.map { |pull| pull['head']['label'].split(/:/) }
      repo_len   = [ branch_names.map(&:first).map(&:length).max, 15 ].min
      branch_len = [ branch_names.map(&:last).map(&:length).max,  30 ].min

      pulls.each do |pull|
        puts pull_info(pull)
      end
    end

    def pull_info(pull)
      number      = pull['number'].to_s
      mergeable   = pull['mergeable']
      title       = pull['title']
      created_at  = Time.parse(pull['issue_created_at'])
      repo_name, branch_name = pull['head']['label'].split(/:/)

      if repo_name == username
        color = :yellow
      else
        if mergeable
          is_old = repo.branches.map(&:name).any? { |branch| branch =~ /^. *cr\/#{number}/}
          color = is_old ? :purple : :white
        else
          color = :red
        end
      end

      number      = pad_left(number, 6)
      title       = pad_right(title, column_size - repo_len - branch_len - 10)
      repo_name   = pad_left(repo_name, repo_len)
      branch_name = pad_right(branch_name, branch_len)

      [
        write(number, color),
        [
          write(repo_name,   :yellow),
          branch_name.split(/\//).map do |branch|
            write(branch, :green)
          end.join('/'),
        ].join('/'),
        title,
      ].join(' ')
    end
  end
end
