# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "campact_user_service"
  spec.version = File.read(File.expand_path("VERSION", __dir__)).strip
  spec.authors = ["ControlShift"]
  spec.email = ["talk@controlshiftlabs.com"]

  spec.summary = "Ruby wrapper for Campact User Service"
  spec.description = "Ruby wrapper for Campact User Service"
  spec.homepage = "https://github.com/controlshift/campact_user_service"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ spec/ .git .github .idea coverage/])
    end
  end
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "faraday", "~> 2.14"
  spec.add_dependency "json", "~> 2.1"
  spec.add_dependency "rotp", "~> 6"

  # Development dependencies
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "faraday-detailed_logger", "~> 2.1"
  spec.add_development_dependency "pry-byebug", "~> 3.6"
  spec.add_development_dependency "rdoc", "~> 6.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "shoulda"
  spec.add_development_dependency "simplecov", "= 0.16.1"
  spec.add_development_dependency "webmock"
end

