
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rank_poker/version"

Gem::Specification.new do |spec|
  spec.name          = "rank_poker"
  spec.version       = RankPoker::VERSION
  spec.authors       = ["yar"]
  spec.email         = ["yar@boost.co.nz"]

  spec.summary       = %q{ Write a short summary, because RubyGems requires one.}
  spec.description   = %q{ Write a longer description or delete this line.}
  spec.homepage      = "http://yarhtut.github.io"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0"
end
