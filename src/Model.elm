module Model exposing (..)

import Msg exposing (Flags)


type alias Model =
    { title : String
    , repoLink : String
    , secondsElapsed : Int
    }


initialState : Flags -> ( Model, Cmd msg )
initialState flags =
    ( Model flags.title flags.repoLink 0, Cmd.none )
