# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: campact_user_service 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "campact_user_service".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ControlShift".freeze]
  s.date = "2019-08-12"
  s.description = "Ruby wrapper for Campact User Service".freeze
  s.email = "hello@controlshiftlabs.com".freeze
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    ".ruby-gemset",
    ".ruby-version",
    "Gemfile",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "campact_user_service.gemspec",
    "example.rb",
    "lib/campact_user_service.rb",
    "lib/campact_user_service/account.rb",
    "lib/campact_user_service/client.rb",
    "lib/campact_user_service/response_error.rb",
    "lib/campact_user_service/session.rb",
    "spec/account_spec.rb",
    "spec/campact_user_service_spec.rb",
    "spec/client_spec.rb",
    "spec/session_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/controlshift/campact_user_service".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Ruby wrapper for Campact User Service".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<base32>.freeze, ["~> 0.3.2"])
      s.add_runtime_dependency(%q<rotp>.freeze, ["~> 3.3", ">= 3.3.1"])
      s.add_runtime_dependency(%q<faraday>.freeze, [">= 0.12.2", "< 1.0"])
      s.add_runtime_dependency(%q<json>.freeze, ["~> 2.1"])
      s.add_development_dependency(%q<byebug>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 6.0", ">= 6.0.4"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.16", ">= 1.16.2"])
      s.add_development_dependency(%q<juwelier>.freeze, ["~> 2.4", ">= 2.4.9"])
      s.add_development_dependency(%q<simplecov>.freeze, ["= 0.16.1"])
      s.add_development_dependency(%q<pry-byebug>.freeze, ["~> 3.6"])
      s.add_development_dependency(%q<faraday-detailed_logger>.freeze, ["~> 2.1", ">= 2.1.2"])
    else
      s.add_dependency(%q<base32>.freeze, ["~> 0.3.2"])
      s.add_dependency(%q<rotp>.freeze, ["~> 3.3", ">= 3.3.1"])
      s.add_dependency(%q<faraday>.freeze, [">= 0.12.2", "< 1.0"])
      s.add_dependency(%q<json>.freeze, ["~> 2.1"])
      s.add_dependency(%q<byebug>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 6.0", ">= 6.0.4"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.16", ">= 1.16.2"])
      s.add_dependency(%q<juwelier>.freeze, ["~> 2.4", ">= 2.4.9"])
      s.add_dependency(%q<simplecov>.freeze, ["= 0.16.1"])
      s.add_dependency(%q<pry-byebug>.freeze, ["~> 3.6"])
      s.add_dependency(%q<faraday-detailed_logger>.freeze, ["~> 2.1", ">= 2.1.2"])
    end
  else
    s.add_dependency(%q<base32>.freeze, ["~> 0.3.2"])
    s.add_dependency(%q<rotp>.freeze, ["~> 3.3", ">= 3.3.1"])
    s.add_dependency(%q<faraday>.freeze, [">= 0.12.2", "< 1.0"])
    s.add_dependency(%q<json>.freeze, ["~> 2.1"])
    s.add_dependency(%q<byebug>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 6.0", ">= 6.0.4"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.16", ">= 1.16.2"])
    s.add_dependency(%q<juwelier>.freeze, ["~> 2.4", ">= 2.4.9"])
    s.add_dependency(%q<simplecov>.freeze, ["= 0.16.1"])
    s.add_dependency(%q<pry-byebug>.freeze, ["~> 3.6"])
    s.add_dependency(%q<faraday-detailed_logger>.freeze, ["~> 2.1", ">= 2.1.2"])
  end
end

