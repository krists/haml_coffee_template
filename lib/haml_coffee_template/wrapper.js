var HamlCoffeeTemplate = (function() {
    var Compiler = require('./haml-coffee');

    return {
        template: function (src, hamlCoffeeCompilerOptions, coffeeScriptCompilerOptions){
            var compiler = new Compiler(hamlCoffeeCompilerOptions);
            compiler.parse(src);
            return CoffeeScript.compile(compiler.render(), coffeeScriptCompilerOptions);
        },
        compile: function (src, hamlCoffeeCompilerOptions, coffeeScriptCompilerOptions){
            var compiler = new Compiler(hamlCoffeeCompilerOptions);
            compiler.parse(src);
            return CoffeeScript.compile(compiler.precompile(), coffeeScriptCompilerOptions);
        }
    }
})();