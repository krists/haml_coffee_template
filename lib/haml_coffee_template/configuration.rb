module HamlCoffeeTemplate
  class Configuration
    attr_accessor :namespace, :haml_coffee_compiler_options, :coffee_script_compiler_options, :haml_coffee_path

    def initialize
      self.namespace = "window.JST"
      self.haml_coffee_compiler_options = {}
      self.coffee_script_compiler_options = {}
      self.haml_coffee_path = File.expand_path("haml-coffee.js", __dir__)
    end
  end
end
