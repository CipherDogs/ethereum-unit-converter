module Units exposing (..)

import BigInt exposing (BigInt)
import BigRational
import Html.Attributes exposing (value)


type Unit
    = Wei
    | Kwei
    | Mwei
    | Gwei
    | Szabo
    | Finney
    | Ether
    | Kether
    | Mether
    | Gether
    | Tether


decimalShift : Unit -> Int
decimalShift unit =
    case unit of
        Wei ->
            0

        Kwei ->
            3

        Mwei ->
            6

        Gwei ->
            9

        Szabo ->
            12

        Finney ->
            15

        Ether ->
            18

        Kether ->
            21

        Mether ->
            24

        Gether ->
            27

        Tether ->
            30


unitToWeiValue : Unit -> BigInt
unitToWeiValue unit =
    BigInt.pow (BigInt.fromInt 10) (BigInt.fromInt <| decimalShift unit)


convert : BigInt -> Unit -> Unit -> String
convert value from to =
    let
        rationalValue =
            BigRational.fromBigInt value

        rationalFrom =
            BigRational.fromBigInt (unitToWeiValue from)

        rationalTo =
            BigRational.fromBigInt (unitToWeiValue to)

        toWei =
            BigRational.mul rationalValue rationalFrom

        result =
            BigRational.div toWei rationalTo
    in
    BigRational.toDecimalString 30 result
