module HamlCoffeeTemplate
  class Processor
    def initialize(filename, &block)
      @filename = filename
      @source = block.call
    end

    def render(context, _empty_hash_wtf)
      self.class.run(@filename, @source, context)
    end

    def self.run(filename, source, context)
      compiler.template(context.logical_path, source)
    rescue StandardError => e
      STDOUT.puts("(#{name}) Failed to compile: #{filename}")
      raise e
    end

    def self.call(input)
      filename = input[:filename]
      source = input[:data]
      context = input[:environment].context_class.new(input)
      result = run(filename, source, context)
      context.metadata.merge(data: result)
    end

    def self.compiler
      @compiler ||= Compiler.new
    end
  end
end
