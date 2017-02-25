port module Update exposing (..)

import Msg exposing (..)
import Model exposing (..)


port alert : String -> Cmd msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Alert ->
            ( model, alert "Hello from Elm" )

        Tick ->
            ( { model
                | secondsElapsed = model.secondsElapsed + 1
              }
            , Cmd.none
            )

        _ ->
            ( model, Cmd.none )
