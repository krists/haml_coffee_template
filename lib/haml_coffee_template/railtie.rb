module HamlCoffeeTemplate
  class Railtie < Rails::Railtie
    initializer "haml_coffee_template.setup" do |app|
      app.config.assets.configure do |env|
        if env.respond_to?(:register_transformer)
          env.register_mime_type 'text/hamlc', extensions: ['.hamlc']
          env.register_transformer 'text/hamlc', 'application/javascript', HamlCoffeeTemplate::Processor
        end

        if env.respond_to?(:register_engine)
          args = ['.hamlc', HamlCoffeeTemplate::Processor]
          args << { mime_type: 'text/hamlc', silence_deprecation: true } if Sprockets::VERSION.start_with?("3")
          env.register_engine(*args)
        end
      end
    end
  end
end
