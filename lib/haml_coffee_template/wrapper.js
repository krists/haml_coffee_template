var HamlCoffeeTemplate = (function() {
    var Compiler = require('./haml-coffee');

    return {
        template: function (src, name, namespace, hamlCoffeeCompilerOptions, coffeeScriptCompilerOptions){
            var compiler = new Compiler(hamlCoffeeCompilerOptions);
            compiler.parse(src);
            return CoffeeScript.compile(compiler.render(name, namespace), coffeeScriptCompilerOptions);
        },
        compile: function (src, hamlCoffeeCompilerOptions, coffeeScriptCompilerOptions){
            var compiler = new Compiler(hamlCoffeeCompilerOptions);
            compiler.parse(src);
            return CoffeeScript.compile(compiler.precompile(), coffeeScriptCompilerOptions);
        }
    }
})();