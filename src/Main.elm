module Main exposing (main)

import BigInt
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Units exposing (Unit(..), convert)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { wei : String
    , kwei : String
    , mwei : String
    , gwei : String
    , szabo : String
    , finney : String
    , ether : String
    , kether : String
    , mether : String
    , gether : String
    , tether : String
    }


init : Model
init =
    { wei = "0"
    , kwei = "0"
    , mwei = "0"
    , gwei = "0"
    , szabo = "0"
    , finney = "0"
    , ether = "0"
    , kether = "0"
    , mether = "0"
    , gether = "0"
    , tether = "0"
    }



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
update msg _ =
    case msg of
        ChangeWei wei ->
            convertUnits wei Wei

        ChangeKwei kwei ->
            convertUnits kwei Kwei

        ChangeMwei mwei ->
            convertUnits mwei Mwei

        ChangeGwei gwei ->
            convertUnits gwei Gwei

        ChangeSzabo szabo ->
            convertUnits szabo Szabo

        ChangeFinney finney ->
            convertUnits finney Finney

        ChangeEther ether ->
            convertUnits ether Ether

        ChangeKether kether ->
            convertUnits kether Kether

        ChangeMether mether ->
            convertUnits mether Mether

        ChangeGether gether ->
            convertUnits gether Gether

        ChangeTether tether ->
            convertUnits tether Tether



-- VIEW


view : Model -> Html Msg
view model =
    main_ []
        [ div []
            [ text "Wei"
            , input [ type_ "number", value model.wei, onInput ChangeWei ] []
            ]
        , div []
            [ text "Kwei / Babbage / Femtoether"
            , input [ type_ "number", value model.kwei, onInput ChangeKwei ] []
            ]
        , div []
            [ text "Mwei / Lovelace / Picoether"
            , input [ type_ "number", value model.mwei, onInput ChangeMwei ] []
            ]
        , div []
            [ text "Gwei"
            , input [ type_ "number", value model.gwei, onInput ChangeGwei ] []
            ]
        , div []
            [ text "Szabo / Microether/ Micro"
            , input [ type_ "number", value model.szabo, onInput ChangeSzabo ] []
            ]
        , div []
            [ text "Finney / Milliether / Milli"
            , input [ type_ "number", value model.finney, onInput ChangeFinney ] []
            ]
        , div []
            [ text "Ether"
            , input [ type_ "number", value model.ether, onInput ChangeEther ] []
            ]
        , div []
            [ text "Kether / Grand"
            , input [ type_ "number", value model.kether, onInput ChangeKether ] []
            ]
        , div []
            [ text "Mether"
            , input [ type_ "number", value model.mether, onInput ChangeMether ] []
            ]
        , div []
            [ text "Gether"
            , input [ type_ "number", value model.gether, onInput ChangeGether ] []
            ]
        , div []
            [ text "Tether"
            , input [ type_ "number", value model.tether, onInput ChangeTether ] []
            ]
        ]



-- HELPERS


convertUnits : String -> Unit -> Model
convertUnits value from =
    let
        maybeValue =
            value |> BigInt.fromIntString
    in
    case maybeValue of
        Nothing ->
            init

        Just v ->
            { wei = convert v from Wei
            , kwei = convert v from Kwei
            , mwei = convert v from Mwei
            , gwei = convert v from Gwei
            , szabo = convert v from Szabo
            , finney = convert v from Finney
            , ether = convert v from Ether
            , kether = convert v from Kether
            , mether = convert v from Mether
            , gether = convert v from Gether
            , tether = convert v from Tether
            }
