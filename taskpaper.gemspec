# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "taskpaper"
  spec.version       = "0.1.2.1"
  spec.authors       = ["Matt Petty"]
  spec.email         = ["matt@kizmeta.com"]
  spec.licenses         = ['MIT']
  spec.summary       = %q{library for interacting with Taskpaper files}
  spec.description   = %q{I suppose I should write a longer description someday.}
  spec.homepage      = "https://github.com/lodestone/taskpaper"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
