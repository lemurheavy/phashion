# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{phashion}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Perham"]
  s.date = %q{2010-06-04}
  s.description = %q{Simple wrapper around the pHash library}
  s.email = %q{mperham@gmail.com}
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "CHANGES.md",
     "LICENSE",
     "README.md",
     "Rakefile",
     "TODO.md",
     "ext/extconf.rb",
     "ext/pHash-0.9.0.tar.gz",
     "ext/phashion_ext.c",
     "lib/phashion.rb",
     "test/86x86-0a1e.jpeg",
     "test/86x86-83d6.jpeg",
     "test/86x86-a855.jpeg",
     "test/avatar.jpg",
     "test/b32aade8c590e2d776c24f35868f0c7a588f51e1.jpeg",
     "test/df9cc82f5b32d7463f36620c61854fde9d939f7f.jpeg",
     "test/e7397898a7e395c2524978a5e64de0efabf08290.jpeg",
     "test/helper.rb",
     "test/test_phashion.rb"
  ]
  s.homepage = %q{http://github.com/mperham/phashion}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Simple wrapper around the pHash library}
  s.test_files = [
    "test/helper.rb",
     "test/test_phashion.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake-compiler>, [">= 0.7.0"])
    else
      s.add_dependency(%q<rake-compiler>, [">= 0.7.0"])
    end
  else
    s.add_dependency(%q<rake-compiler>, [">= 0.7.0"])
  end
end

