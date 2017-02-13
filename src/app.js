// elm-css
import './css/main.css';

// inject elm
var Elm = require('./Main.elm');
Elm.Main.embed( document.getElementById('app') );
