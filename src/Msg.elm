module Msg exposing (..)


type Msg
    = Alert
    | Tick
    | Log String


type alias Flags =
    { title : String
    , repoLink : String
    }
