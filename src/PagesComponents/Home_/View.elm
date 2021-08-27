module PagesComponents.Home_.View exposing (viewHome)

import Components.Molecules.Footer exposing (footerSlice)
import Components.Molecules.Cta exposing (ctaSlice)
import Components.Molecules.Feature exposing (featureListeSlice, featureSlice)
import Components.Molecules.Hero exposing (heroSlice)
import Css.Global
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Html.Styled as Styled
import Tailwind.Utilities exposing (globalStyles)


viewHome : List (Html msg)
viewHome =
    [ div [ class "bg-white" ]
        [ Css.Global.global globalStyles |> Styled.toUnstyled
        , heroSlice |> Styled.toUnstyled
        , featureSlice |> Styled.toUnstyled
        , featureListeSlice |> Styled.toUnstyled
        , ctaSlice |> Styled.toUnstyled
        , footerSlice |> Styled.toUnstyled
        ]
    ]
