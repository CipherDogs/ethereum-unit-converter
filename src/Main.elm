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
    , szabo : Float
    , finney : Float
    , ether : Float
    , kether : Float
    , mether : Float
    , gether : Float
    , tether : Float
    }


init : Model
init =
    Model 0 0 0 0 0 0 0 0 0 0 0



-- UPDATE


type Msg
    = ChangeWei String
    | ChangeKwei String
    | ChangeMwei String
    | ChangeGwei String
    | ChangeSzabo String
    | ChangeFinney String
    | ChangeEther String
    | ChangeKether String
    | ChangeMether String
    | ChangeGether String
    | ChangeTether String


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
                        , szabo = w / 10 ^ 12
                        , finney = w / 10 ^ 15
                        , ether = w / 10 ^ 18
                        , kether = w / 10 ^ 21
                        , mether = w / 10 ^ 24
                        , gether = w / 10 ^ 27
                        , tether = w / 10 ^ 30
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
                        , szabo = k / 10 ^ 9
                        , finney = k / 10 ^ 12
                        , ether = k / 10 ^ 15
                        , kether = k / 10 ^ 18
                        , mether = k / 10 ^ 21
                        , gether = k / 10 ^ 24
                        , tether = k / 10 ^ 27
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
                        , szabo = m / 10 ^ 6
                        , finney = m / 10 ^ 9
                        , ether = m / 10 ^ 12
                        , kether = m / 10 ^ 15
                        , mether = m / 10 ^ 18
                        , gether = m / 10 ^ 21
                        , tether = m / 10 ^ 24
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
                        , szabo = g / 10 ^ 3
                        , finney = g / 10 ^ 6
                        , ether = g / 10 ^ 9
                        , kether = g / 10 ^ 12
                        , mether = g / 10 ^ 15
                        , gether = g / 10 ^ 18
                        , tether = g / 10 ^ 21
                    }

        ChangeSzabo szabo ->
            let
                maybeSzabo =
                    szabo |> String.toFloat
            in
            case maybeSzabo of
                Nothing ->
                    init

                Just s ->
                    { model
                        | wei = s * 10 ^ 12
                        , kwei = s * 10 ^ 9
                        , mwei = s * 10 ^ 6
                        , gwei = s * 10 ^ 3
                        , szabo = s
                        , finney = s / 10 ^ 3
                        , ether = s / 10 ^ 6
                        , kether = s / 10 ^ 9
                        , mether = s / 10 ^ 12
                        , gether = s / 10 ^ 15
                        , tether = s / 10 ^ 18
                    }

        ChangeFinney finney ->
            let
                maybeFinney =
                    finney |> String.toFloat
            in
            case maybeFinney of
                Nothing ->
                    init

                Just f ->
                    { model
                        | wei = f * 10 ^ 15
                        , kwei = f * 10 ^ 12
                        , mwei = f * 10 ^ 9
                        , gwei = f * 10 ^ 6
                        , szabo = f * 10 ^ 3
                        , finney = f
                        , ether = f / 10 ^ 3
                        , kether = f / 10 ^ 6
                        , mether = f / 10 ^ 9
                        , gether = f / 10 ^ 12
                        , tether = f / 10 ^ 15
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
                        , szabo = e * 10 ^ 6
                        , finney = e * 10 ^ 3
                        , ether = e
                        , kether = e / 10 ^ 3
                        , mether = e / 10 ^ 6
                        , gether = e / 10 ^ 9
                        , tether = e / 10 ^ 12
                    }

        ChangeKether kether ->
            let
                maybeKether =
                    kether |> String.toFloat
            in
            case maybeKether of
                Nothing ->
                    init

                Just k ->
                    { model
                        | wei = k * 10 ^ 21
                        , kwei = k * 10 ^ 18
                        , mwei = k * 10 ^ 15
                        , gwei = k * 10 ^ 12
                        , szabo = k * 10 ^ 9
                        , finney = k * 10 ^ 6
                        , ether = k * 10 ^ 3
                        , kether = k
                        , mether = k / 10 ^ 3
                        , gether = k / 10 ^ 6
                        , tether = k / 10 ^ 9
                    }

        ChangeMether mether ->
            let
                maybeMether =
                    mether |> String.toFloat
            in
            case maybeMether of
                Nothing ->
                    init

                Just m ->
                    { model
                        | wei = m * 10 ^ 24
                        , kwei = m * 10 ^ 21
                        , mwei = m * 10 ^ 18
                        , gwei = m * 10 ^ 15
                        , szabo = m * 10 ^ 12
                        , finney = m * 10 ^ 9
                        , ether = m * 10 ^ 6
                        , kether = m * 10 ^ 3
                        , mether = m
                        , gether = m / 10 ^ 3
                        , tether = m / 10 ^ 6
                    }

        ChangeGether gether ->
            let
                maybeGether =
                    gether |> String.toFloat
            in
            case maybeGether of
                Nothing ->
                    init

                Just g ->
                    { model
                        | wei = g * 10 ^ 27
                        , kwei = g * 10 ^ 24
                        , mwei = g * 10 ^ 21
                        , gwei = g * 10 ^ 18
                        , szabo = g * 10 ^ 15
                        , finney = g * 10 ^ 12
                        , ether = g * 10 ^ 9
                        , kether = g * 10 ^ 6
                        , mether = g * 10 ^ 3
                        , gether = g
                        , tether = g / 10 ^ 3
                    }

        ChangeTether tether ->
            let
                maybeTether =
                    tether |> String.toFloat
            in
            case maybeTether of
                Nothing ->
                    init

                Just t ->
                    { model
                        | wei = t * 10 ^ 30
                        , kwei = t * 10 ^ 27
                        , mwei = t * 10 ^ 24
                        , gwei = t * 10 ^ 21
                        , szabo = t * 10 ^ 18
                        , finney = t * 10 ^ 15
                        , ether = t * 10 ^ 12
                        , kether = t * 10 ^ 9
                        , mether = t * 10 ^ 6
                        , gether = t * 10 ^ 3
                        , tether = t
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
            [ text "Szabo / Microether/ Micro"
            , input [ type_ "number", value (String.fromFloat model.szabo), onInput ChangeSzabo ] []
            ]
        , div []
            [ text "Finney / Milliether / Milli"
            , input [ type_ "number", value (String.fromFloat model.finney), onInput ChangeFinney ] []
            ]
        , div []
            [ text "Ether"
            , input [ type_ "number", value (String.fromFloat model.ether), onInput ChangeEther ] []
            ]
        , div []
            [ text "Kether / Grand"
            , input [ type_ "number", value (String.fromFloat model.kether), onInput ChangeKether ] []
            ]
        , div []
            [ text "Mether"
            , input [ type_ "number", value (String.fromFloat model.mether), onInput ChangeMether ] []
            ]
        , div []
            [ text "Gether"
            , input [ type_ "number", value (String.fromFloat model.gether), onInput ChangeGether ] []
            ]
        , div []
            [ text "Tether"
            , input [ type_ "number", value (String.fromFloat model.tether), onInput ChangeTether ] []
            ]
        ]
