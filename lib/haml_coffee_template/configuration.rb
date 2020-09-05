module HamlCoffeeTemplate
  class Configuration
    attr_accessor :namespace, :compiler_options, :hamlcoffee_path

    def initialize
      self.namespace = "window.JST"
      self.compiler_options = {}
      self.hamlcoffee_path = File.expand_path("../hamlcoffee.js", __FILE__)
    end
  end
end