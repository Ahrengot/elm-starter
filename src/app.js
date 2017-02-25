import "./css/main.css"

import Elm from "./Main.elm"

var elm = Elm.Main.fullscreen({
  title: "Elm Starter",
  repoLink: "https://github.com/Ahrengot/elm-starter"
});

//interop
elm.ports.alert.subscribe(function(message) {
  alert(message);
});
