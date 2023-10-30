
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "API_payload_builder"
  spec.version       = "0.1.0"
  spec.authors       = ["Srinivasa Manoj Sangadi"]
  spec.email         = "sangadi.manoj@gmail.com"

  spec.summary       = %q{My API_payload_builder Gem will construct a response structure with the pre-defined format.}
  spec.homepage      = "https://github.com/sangadi-manoj/API-Payload-Builder"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/sangadi-manoj/API-Payload-Builder"
    spec.metadata["changelog_uri"] = "https://github.com/sangadi-manoj/API-Payload-Builder/changelog"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
