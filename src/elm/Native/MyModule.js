// make is a function that takes an instance of the
// elm runtime
// returns an object where:
//      keys are names to be accessed in pure Elm
//      values are either functions or values
var make = function make(elm) {
    // If Native isn't already bound on elm, bind it!
    elm.Native = elm.Native || {};
    // then the same for our module
    elm.Native.MyModule = elm.Native.MyModule || {}; 

    // `values` is where the object returned by make ends up internally
    // return if it's already set, since you only want one definition of
    // values for speed reasons
    if (elm.Native.MyModule.values) return elm.Native.MyModule.values;

    // return the object of your module's stuff!
    return elm.Native.MyModule.values = {};
};

// setup code for MyModule
// Elm.Native.MyModule should be an object with
// a property `make` which is specified above
Elm.Native.MyModule = {};
Elm.Native.MyModule.make = make;