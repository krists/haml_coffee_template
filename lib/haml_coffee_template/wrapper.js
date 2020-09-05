var HamlCoffeeTemplate = (function() {
    var Compiler = require('./haml-coffee');

    return {
        template: function (src, name, namespace, compilerOptions){
            var compiler = new Compiler(compilerOptions);
            compiler.parse(src);
            return CoffeeScript.compile(compiler.render(name, namespace));
        },
        compile: function (src, compilerOptions){
            var compiler = new Compiler(compilerOptions);
            compiler.parse(src);
            return CoffeeScript.compile(compiler.precompile(), {bare: true});
        }
    }
})();