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
    , kwei : Float
    , mwei : Float
    , gwei : Float
    , ether : Float
    }


init : Model
init =
    Model 0 0 0 0 0



-- UPDATE


type Msg
    = ChangeWei String
    | ChangeKwei String
    | ChangeMwei String
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
                    init

                Just w ->
                    { model
                        | wei = w
                        , kwei = w / 10 ^ 3
                        , mwei = w / 10 ^ 6
                        , gwei = w / 10 ^ 9
                        , ether = w / 10 ^ 18
                    }

        ChangeKwei kwei ->
            let
                maybeKwei =
                    kwei |> String.toFloat
            in
            case maybeKwei of
                Nothing ->
                    init

                Just k ->
                    { model
                        | wei = k * 10 ^ 3
                        , kwei = k
                        , mwei = k / 10 ^ 3
                        , gwei = k / 10 ^ 6
                        , ether = k / 10 ^ 9
                    }

        ChangeMwei mwei ->
            let
                maybeMwei =
                    mwei |> String.toFloat
            in
            case maybeMwei of
                Nothing ->
                    init

                Just m ->
                    { model
                        | wei = m * 10 ^ 6
                        , kwei = m * 10 ^ 3
                        , mwei = m
                        , gwei = m / 10 ^ 3
                        , ether = m / 10 ^ 6
                    }

        ChangeGwei gwei ->
            let
                maybeGwei =
                    gwei |> String.toFloat
            in
            case maybeGwei of
                Nothing ->
                    init

                Just g ->
                    { model
                        | wei = g * 10 ^ 9
                        , kwei = g * 10 ^ 6
                        , mwei = g * 10 ^ 3
                        , gwei = g
                        , ether = g / 10 ^ 9
                    }

        ChangeEther ether ->
            let
                maybeEther =
                    ether |> String.toFloat
            in
            case maybeEther of
                Nothing ->
                    init

                Just e ->
                    { model
                        | wei = e * 10 ^ 18
                        , kwei = e * 10 ^ 15
                        , mwei = e * 10 ^ 12
                        , gwei = e * 10 ^ 9
                        , ether = e
                    }



-- VIEW


view : Model -> Html Msg
view model =
    main_ []
        [ div []
            [ text "Wei"
            , input [ type_ "number", value (String.fromFloat model.wei), onInput ChangeWei ] []
            ]
        , div []
            [ text "Kwei / Babbage / Femtoether"
            , input [ type_ "number", value (String.fromFloat model.kwei), onInput ChangeKwei ] []
            ]
        , div []
            [ text "Mwei / Lovelace / Picoether"
            , input [ type_ "number", value (String.fromFloat model.mwei), onInput ChangeMwei ] []
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
