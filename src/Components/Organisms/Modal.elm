module Components.Organisms.Modal exposing (modal, modalChapter)

import Components.Atoms.Icon exposing (..)
import Css
import ElmBook.Chapter exposing (chapter, renderComponentList)
import ElmBook.ElmCSS exposing (Chapter)
import Html.Styled exposing (Html, button, div, h3, p, span, text)
import Html.Styled.Attributes exposing (css, id, type_)
import Html.Styled.Events exposing (onClick)
import Libs.Models exposing (Text)
import Tailwind.Breakpoints as Bp
import Tailwind.Utilities as Tw


type alias Model =
    { msg : String
    , isModalOpen : Bool
    , description : String
    }


type Msg
    = NoOp
    | ShowModal
    | HideModal


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ShowModal ->
            let
                newModel =
                    { model | isModalOpen = True }
            in
            ( newModel, Cmd.none )

        HideModal ->
            let
                newModel =
                    { model | isModalOpen = False }
            in
            ( newModel, Cmd.none )


initialModel : Model
initialModel =
    { msg = "Hello World"
    , description = "description"
    , isModalOpen = True
    }

modal: Model -> Html msg
modal model =
    div
        [ css
            [ Tw.fixed
            , Tw.z_10
            , Tw.inset_0
            , Tw.overflow_y_auto
            ]
        ]
        [ div
            [ css
                [ Tw.flex
                , Tw.items_end
                , Tw.justify_center
                , Tw.min_h_screen
                , Tw.pt_4
                , Tw.px_4
                , Tw.pb_20
                , Tw.text_center
                , Bp.sm
                    [ Tw.block
                    , Tw.p_0
                    ]
                ]
            ]
            [ {-
                 Background overlay, show/hide based on modal state.

                 Entering: "ease-out duration-300"
                 From: "opacity-0"
                 To: "opacity-100"
                 Leaving: "ease-in duration-200"
                 From: "opacity-100"
                 To: "opacity-0"
              -}
              div
                [ css
                    [ Tw.fixed
                    , Tw.inset_0
                    , Tw.bg_gray_500
                    , Tw.bg_opacity_75
                    , Tw.transition_opacity
                    ]
                ]
                []
            , {- This element is to trick the browser into centering the modal contents. -}
              span
                [ css
                    [ Tw.hidden
                    , Bp.sm
                        [ Tw.inline_block
                        , Tw.align_middle
                        , Tw.h_screen
                        ]
                    ]
                ]
                [ text "\u{200B}" ]
            , {-
                 Modal panel, show/hide based on modal state.

                 Entering: "ease-out duration-300"
                 From: "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                 To: "opacity-100 translate-y-0 sm:scale-100"
                 Leaving: "ease-in duration-200"
                 From: "opacity-100 translate-y-0 sm:scale-100"
                 To: "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
              -}
              div
                [ css
                    [ Tw.inline_block
                    , Tw.align_bottom
                    , Tw.bg_white
                    , Tw.rounded_lg
                    , Tw.px_4
                    , Tw.pt_5
                    , Tw.pb_4
                    , Tw.text_left
                    , Tw.overflow_hidden
                    , Tw.shadow_xl
                    , Tw.transform
                    , Tw.transition_all
                    , Bp.sm
                        [ Tw.my_8
                        , Tw.align_middle
                        , Tw.max_w_lg
                        , Tw.w_full
                        , Tw.p_6
                        ]
                    ]
                ]
                [ div []
                    [ div
                        [ css
                            [ Tw.mx_auto
                            , Tw.flex
                            , Tw.items_center
                            , Tw.justify_center
                            , Tw.h_12
                            , Tw.w_12
                            , Tw.rounded_full
                            , Tw.bg_green_100
                            ]
                        ]
                        [{- Heroicon name: outline/check
                            svg
                            [ css
                                [ Tw.h_6
                                , Tw.w_6
                                , Tw.text_green_600
                                ]
                            , fill "none"
                            , viewBox "0 0 24 24"
                            , stroke "currentColor"
                            , attribute "aria-hidden" "true"
                            ]
                            [ path
                                [ strokeLinecap "round"
                                , strokeLinejoin "round"
                                , strokeWidth "2"
                                , d "M5 13l4 4L19 7"
                                ]
                                []
                            ]
                         -}
                        ]
                    , div
                        [ css
                            [ Tw.mt_3
                            , Tw.text_center
                            , Bp.sm
                                [ Tw.mt_5
                                ]
                            ]
                        ]
                        [ h3
                            [ css
                                [ Tw.text_lg
                                , Tw.leading_6
                                , Tw.font_medium
                                , Tw.text_gray_900
                                ]
                            , id "modal-title"
                            ]
                            [ text model.msg ]
                        , div
                            [ css
                                [ Tw.mt_2
                                ]
                            ]
                            [ p
                                [ css
                                    [ Tw.text_sm
                                    , Tw.text_gray_500
                                    ]
                                ]
                                [ text model.description ]
                            ]
                        ]
                    ]
                , div
                    [ css
                        [ Tw.mt_5
                        , Bp.sm
                            [ Tw.mt_6
                            , Tw.grid
                            , Tw.grid_cols_2
                            , Tw.gap_3
                            , Tw.grid_flow_row_dense
                            ]
                        ]
                    ]
                    [ button
                        [ type_ "button"
                        , css
                            [ Tw.w_full
                            , Tw.inline_flex
                            , Tw.justify_center
                            , Tw.rounded_md
                            , Tw.border
                            , Tw.border_transparent
                            , Tw.shadow_sm
                            , Tw.px_4
                            , Tw.py_2
                            , Tw.bg_indigo_600
                            , Tw.text_base
                            , Tw.font_medium
                            , Tw.text_white
                            , Css.focus
                                [ Tw.outline_none
                                , Tw.ring_2
                                , Tw.ring_offset_2
                                , Tw.ring_indigo_500
                                ]
                            , Css.hover
                                [ Tw.bg_indigo_700
                                ]
                            , Bp.sm
                                [ Tw.col_start_2
                                , Tw.text_sm
                                ]
                            ]
                        ]
                        [ text "Deactivate" ]
                    , button
                        [ type_ "button"
                        , css
                            [ Tw.mt_3
                            , Tw.w_full
                            , Tw.inline_flex
                            , Tw.justify_center
                            , Tw.rounded_md
                            , Tw.border
                            , Tw.border_gray_300
                            , Tw.shadow_sm
                            , Tw.px_4
                            , Tw.py_2
                            , Tw.bg_white
                            , Tw.text_base
                            , Tw.font_medium
                            , Tw.text_gray_700
                            , Css.focus
                                [ Tw.outline_none
                                , Tw.ring_2
                                , Tw.ring_offset_2
                                , Tw.ring_indigo_500
                                ]
                            , Css.hover
                                [ Tw.bg_gray_50
                                ]
                            , Bp.sm
                                [ Tw.mt_0
                                , Tw.col_start_1
                                , Tw.text_sm
                                ]
                            ]
                        ]
                        [ text "Cancel" ]
                    ]
                ]
            ]
        ]


modalBis : Model -> Html msg
modalBis model =
    div [] [ text model.description ]


modalChapter : Chapter x
modalChapter =
    chapter "modal"
        |> renderComponentList
            [ ( "modal", modal initialModel )
            ]
