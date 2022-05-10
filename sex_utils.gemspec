# frozen_string_literal: true

require_relative "lib/sex_utils/version"

Gem::Specification.new do |spec|
  spec.name = "sex_utils"
  spec.version = SexUtils::VERSION
  spec.authors = ["NNB"]
  spec.email = ["nnbnh@protonmail.com"]

  spec.summary = "Shell Explorer: convenient files management utilities."
  spec.homepage = "https://github.com/NNBnh/sex_utils"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/NNBnh/sex_utils"
  spec.metadata["changelog_uri"] = "https://github.com/NNBnh/sex_utils/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "tty-reader", "~> 0.9.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
