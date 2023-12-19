# frozen_string_literal: true

require_relative "lib/yabeda/rabbit_messaging/version"

Gem::Specification.new do |spec|
  spec.name = "yabeda-rabbit_messaging"
  spec.version = Yabeda::RabbitMessaging::VERSION
  spec.authors = ["Stepan Kirushkin"]
  spec.email = ["stepan.kirushkin@gmail.com"]

  spec.summary = "Yabeda plugin for rabbit_messaging gem."
  spec.description = "Easy collect your TableSync metrics."
  spec.homepage = "https://github.com/umbrellio/yabeda-rabbit_messaging"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] =
    "https://github.com/umbrellio/yabeda-rabbit_messaging/blob/master/CHANGELOG.md"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.include?("spec") }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.5.0"

  spec.add_dependency "rabbit_messaging"
  spec.add_dependency "yabeda", "~> 0.8"
end
