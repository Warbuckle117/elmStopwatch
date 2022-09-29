module Main exposing (..)

import Browser
import Html exposing (Html, br, button, div, sub, text)
import Html.Events exposing (onClick)
import Time exposing (Posix)


main : Program () Model Msg
main =
    Browser.element
        { init = 0
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Model =
    { currentTime : Int
    }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Time.every 100 Tick


type Msg
    = Tick Posix


type alias DisplayTime =
    { currentTime : Posix
    , stopwatchState : StopwatchState
    }


type alias Stopwatch =
    { elapsedTime : Int
    , state : StopwatchState
    }


type alias StartTime =
    Posix


type StopwatchState
    = Running StartTime
    | Paused StartTime
    | Cleared



-- getCombined : Posix -> StopwatchState -> String
-- getCombined currentTime watch =
--     case watch of
--       Cleared ->
--           "00:00:00"
--       Running startTime ->


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick currentTime ->
            ( { model | currentTime = currentTime }, Cmd.none )


view : Model -> Html Msg
view model =
    div
        []
        [ text "It Lives!!!" ]
