module View exposing (..)

import Model exposing (..)
import Msg exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


app : Model -> Html Msg
app model =
    div [ class "app-container" ]
        [ div []
            [ header [ class "header" ]
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
            , p
                [ class "app-desc"
                , style
                    [ ( "font-size", "80%" )
                    , ( "font-style", "italic" )
                    , ( "margin-top", "3rem" )
                    ]
                ]
                [ text ("This app has been running for " ++ toString model.secondsElapsed ++ " seconds.")
                ]
            ]
        ]
