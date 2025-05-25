module Counter exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    Int


type Msg
    = Increment


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1


view : Model -> Html Msg
view model =
    button [ class "btn btn-soft", onClick Increment ] [ text <| "count is " ++ String.fromInt model ]
