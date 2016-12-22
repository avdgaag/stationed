$:.push File.expand_path('../lib', __FILE__)

require 'stationed/version'

Gem::Specification.new do |s|
  s.name        = 'stationed'
  s.version     = Stationed::VERSION
  s.authors     = ['Arjan van der Gaag']
  s.email       = ['arjan@arjanvandergaag.nl']
  s.homepage    = 'http://avdgaag.github.io/stationed'
  s.summary     = 'Rails application and scaffold generator.'
  s.description = <<-EOS
Stationed is an extensive Rails application generator, providing you with a
starter app full standard goodies such as testing, authentication,
authorization, decorators, tasks and styles. But as an engine it also provides
you with customized scaffold generators including proper tests. Finally, it
provides some basic view helpers that every project tends to need. All in all,
stationed is pretty sweet.
EOS

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'HISTORY.md', 'README.md']
  s.test_files = Dir['spec/**/*']
  s.executables = %w[stationed]

  s.add_dependency 'rails', '>= 4.1'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
end
