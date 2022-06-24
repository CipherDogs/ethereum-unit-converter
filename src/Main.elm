module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { wei : Float
    , gwei : Float
    , ether : Float
    }


init : Model
init =
    Model 0 0 0



-- UPDATE


type Msg
    = ChangeWei String
    | ChangeGwei String
    | ChangeEther String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeWei wei ->
            let
                maybeWei =
                    wei |> String.toFloat
            in
            case maybeWei of
                Nothing ->
                    { model | wei = 0, gwei = 0, ether = 0 }

                Just w ->
                    { model | wei = w, gwei = w / 10 ^ 9, ether = w / 10 ^ 18 }

        ChangeGwei gwei ->
            let
                maybeGwei =
                    gwei |> String.toFloat
            in
            case maybeGwei of
                Nothing ->
                    { model | wei = 0, gwei = 0, ether = 0 }

                Just g ->
                    { model | wei = g * 10 ^ 9, gwei = g, ether = g / 10 ^ 9 }

        ChangeEther ether ->
            let
                maybeEther =
                    ether |> String.toFloat
            in
            case maybeEther of
                Nothing ->
                    { model | wei = 0, gwei = 0, ether = 0 }

                Just e ->
                    { model | wei = e * 10 ^ 18, gwei = e * 10 ^ 9, ether = e }



-- VIEW


view : Model -> Html Msg
view model =
    main_ []
        [ div []
            [ text "Wei"
            , input [ type_ "number", value (String.fromFloat model.wei), onInput ChangeWei ] []
            ]
        , div []
            [ text "Gwei"
            , input [ type_ "number", value (String.fromFloat model.gwei), onInput ChangeGwei ] []
            ]
        , div []
            [ text "Ether"
            , input [ type_ "number", value (String.fromFloat model.ether), onInput ChangeEther ] []
            ]
        ]
