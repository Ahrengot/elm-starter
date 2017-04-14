port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Time


-- Model & initial state


type alias Flags =
    { title : String
    , repoLink : String
    }


type alias Model =
    { title : String
    , repoLink : String
    , secondsElapsed : Int
    }


initialState : Flags -> ( Model, Cmd msg )
initialState flags =
    ( Model flags.title flags.repoLink 0, Cmd.none )



-- Update logic


port alert : String -> Cmd msg


type Msg
    = Alert
    | Tick
    | Log String


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


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every Time.second <| always Tick
        ]



-- App bootstrap


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = initialState
        , view = viewApp
        , update = update
        , subscriptions = subscriptions
        }



-- Views


viewHeader : Model -> Html Msg
viewHeader model =
    header [ class "header" ]
        [ h1 [] [ text model.title ]
        , a [ href model.repoLink ] [ text "View project on GitHub" ]
        , span [] [ text " | " ]
        , button
            [ class "btn-link"
            , type_ "button"
            , onClick Alert
            , style
                [ ( "cursor", "pointer" )
                , ( "padding", "0" )
                ]
            ]
            [ text "Hello" ]
        ]


viewApp : Model -> Html Msg
viewApp model =
    div [ class "app-container" ]
        [ div []
            [ viewHeader model
            , p
                [ class "app-desc"
                , style
                    [ ( "font-size", "80%" )
                    , ( "font-style", "italic" )
                    , ( "margin-top", "3rem" )
                    ]
                ]
                [ text ("This app has been running for " ++ (toString model.secondsElapsed) ++ " seconds.")
                ]
            ]
        ]
