Gem::Specification.new do |s|
  s.name = "hull"
  s.version = "0.0.2"
  s.date = "2012-01-20"

  s.authors = ["hc5duke"]
  s.email = "hc5duke@gmail.com"

  s.summary = "Code Review helper using GitHub's Pull Requests"
  s.homepage = "https://github.com/hc5duke/hull"
  s.description = "Code Review helper using GitHub's Pull Requests"

  s.require_path = "lib"
  s.files = Dir["lib/**/*.rb"]
  s.add_dependency ["json", "grit"]
  s.executables = ['hull']
end
