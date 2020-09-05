require "coffee_script"

module HamlCoffeeTemplate
  class Compiler
    attr_reader :runtime

    def initialize
      @runtime = ExecJS.compile(runtime_source)
    end

    def template(name, source)
      runtime.call(
        'HamlCoffeeTemplate.template',
        source,
        name,
        HamlCoffeeTemplate.configuration.namespace,
        HamlCoffeeTemplate.configuration.compiler_options
      )
    end

    def compile(source)
      runtime.call(
        'HamlCoffeeTemplate.compile',
        source,
        HamlCoffeeTemplate.configuration.compiler_options
      )
    end

    def runtime_source
      [coffeescript_source, hamlcoffee_source, wrapper_source].join(";")
    end

    def coffeescript_source
      File.read(CoffeeScript::Source.path)
    end

    def hamlcoffee_source
      File.read(HamlCoffeeTemplate.configuration.hamlcoffee_path)
    end

    def wrapper_source
      File.read(wrapper_script_path)
    end

    def wrapper_script_path
      File.expand_path("../wrapper.js", __FILE__)
    end
  end
end