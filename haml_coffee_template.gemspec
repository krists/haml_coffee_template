require_relative "./lib/haml_coffee_template/version"

Gem::Specification.new do |spec|
  spec.name = "haml_coffee_template"
  spec.version = HamlCoffeeTemplate::VERSION
  spec.authors = ["Krists Ozols"]
  spec.summary = "Haml + CoffeeScript template adapter for the Rails asset pipeline"
  spec.homepage = "https://github.com/krists/haml_coffee_template"
  spec.license = "MIT"
  spec.files = Dir["{lib}/**/*", "README.md"]
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3")
  spec.add_dependency "coffee-script", ">= 2.0"
  spec.add_dependency "sprockets", ">= 2.0"
end
