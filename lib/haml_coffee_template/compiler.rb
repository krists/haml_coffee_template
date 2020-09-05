require "coffee_script"

module HamlCoffeeTemplate
  class Compiler
    attr_reader :runtime

    def initialize
      @runtime = ExecJS.compile(runtime_source)
    end

    def template(name, source)
      haml_coffee_compiler_options = HamlCoffeeTemplate.configuration.haml_coffee_compiler_options.dup
      haml_coffee_compiler_options[:name] = name
      haml_coffee_compiler_options[:namespace] = HamlCoffeeTemplate.configuration.namespace
      runtime.call(
        "HamlCoffeeTemplate.template",
        source,
        haml_coffee_compiler_options,
        HamlCoffeeTemplate.configuration.coffee_script_compiler_options,
      )
    end

    def compile(source)
      runtime.call(
        "HamlCoffeeTemplate.compile",
        source,
        HamlCoffeeTemplate.configuration.haml_coffee_compiler_options,
        HamlCoffeeTemplate.configuration.coffee_script_compiler_options
      )
    end

    def runtime_source
      [coffeescript_source, haml_coffee_source, wrapper_source].join(";")
    end

    def coffeescript_source
      File.read(CoffeeScript::Source.path)
    end

    def haml_coffee_source
      File.read(HamlCoffeeTemplate.configuration.haml_coffee_path)
    end

    def wrapper_source
      File.read(wrapper_script_path)
    end

    def wrapper_script_path
      File.expand_path("wrapper.js", __dir__)
    end
  end
end
