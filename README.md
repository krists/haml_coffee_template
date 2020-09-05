# Haml Coffee Template

Add [haml-coffee](https://github.com/netzpirat/haml-coffee) template support to your Rails asset pipeline.

This project is very similar to [Haml Coffee Assets](https://github.com/emilioforrer/haml_coffee_assets) but it does not monkey-patch Rails core classes.

## Installation

Include in project's `Gemfile`:

```ruby
gem 'haml_coffee_template'
```

## Usage

* Create template files with extension `.hamlc`
  ```haml
  %div
    Hello #{@who}
  ```
* Require template in javascript or coffeescript files that are processed via Sprockets
  ```coffeescript
  #= require hello
  document.write JST['hello']({who: "world"})
  ```

## Advanced usage
Compiler can be configured using HamlCoffeeTemplate::Configuration class.