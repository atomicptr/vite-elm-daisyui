port module Main exposing (main)

import Browser exposing (Document)
import Counter
import Html exposing (..)
import Html.Attributes exposing (..)
import VitePluginHelper exposing (asset)


port updateCounter : Int -> Cmd msg


type alias Flags =
    { initialCount : Int }


type alias Model =
    { counter : Counter.Model }


type Msg
    = CounterMsg Counter.Msg


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { counter = flags.initialCount }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CounterMsg counter_message ->
            let
                counter =
                    Counter.update counter_message model.counter
            in
            ( { model | counter = counter }, updateCounter counter )


view : Model -> Document Msg
view model =
    { title = "Vite + Elm + Daisy UI"
    , body =
        [ div [ class "flex flex-row items-center justify-center h-screen" ]
            [ div [ class "card bg-base-200 p-12" ]
                [ div [ class "card-body flex flex-col gap-2 justify-center" ]
                    [ div [ class "flex flex-row gap-4 justify-center items-center" ]
                        [ a [ href "https://vite.dev/", target "_blank", class "logo logo-vite" ] [ img [ src <| asset "/vite.svg?inline", class "w-24" ] [] ]
                        , div [ class "font-bold text-4xl" ] [ text "+" ]
                        , a [ href "https://elm-lang.org/", target "_blank", class "logo logo-elm" ] [ img [ src <| asset "/elm.svg?inline", class "w-24 p-1", style "background-color" "#1293D8" ] [] ]
                        , div [ class "font-bold text-4xl" ] [ text "+" ]
                        , a [ href "https://daisyui.com/", target "_blank", class "logo logo-daisy" ] [ img [ src <| asset "/daisy.svg?inline", class "w-24" ] [] ]
                        ]
                    , h1
                        [ class "card-title text-3xl my-8" ]
                        [ text "Hello Vite + Elm + Daisy UI" ]
                    , div [ class "flex flex-row justify-center" ] [ Html.map CounterMsg <| Counter.view model.counter ]
                    , small [ class "text-center mt-8 opacity-50" ] [ text "Click on the logos to learn more" ]
                    ]
                ]
            ]
        ]
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Flags Model Msg
main =
    Browser.document
        { init = init, update = update, view = view, subscriptions = subscriptions }
