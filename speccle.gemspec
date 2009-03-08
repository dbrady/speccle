spec = Gem::Specification.new do |s|
  s.name = 'speccle'
  s.version = '0.0.1'
  s.date = '2009-03-07'
  s.summary = 'wrapper for spec that colorizes iTerm window background to reflect spec pass/pend/fail (Mac OSX only)'
  s.email = "github@shinybit.com"
  s.homepage = "http://github.com/dbrady/speccle"
  s.description = "Speccle - wrapper for spec that colorizes iTerm window background to reflect spec pass/pend/fail (Mac OSX only)"
  s.has_rdoc = false
  s.executables = ["speccle"]
  s.extra_rdoc_files = ["README.txt"]
  s.authors = ["David Brady"]

  s.files = ["bin/speccle",
             "lib/iterm_color_progress_formatter.rb",
             "lib/speccle.rb",
             "README.txt"]

end
