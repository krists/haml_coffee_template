require_relative "haml_coffee_template/version"
require_relative "haml_coffee_template/processor"
require_relative "haml_coffee_template/configuration"
require_relative "haml_coffee_template/compiler"
require_relative "haml_coffee_template/railtie" if defined?(::Rails) && !ENV["HAML_COFFEE_TEMPLATE_DISABLE_AUTOCONFIGURE"]

module HamlCoffeeTemplate
  def self.configuration
    @configuration
  end

  def self.configuration=(obj)
    @configuration = obj
  end

  self.configuration = Configuration.new
end
