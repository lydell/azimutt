module Components.Molecules.Header exposing (headerChapter, headerWebsite)

import Components.Atoms.Icon exposing (..)
import Css exposing (url)
import ElmBook.Chapter exposing (chapter, renderComponentList)
import ElmBook.ElmCSS exposing (Chapter)
import Gen.Route as Route
import Html.Styled exposing (Html, a, button, div, header, img, input, label, span, text)
import Html.Styled.Attributes exposing (alt, css, for, href, id, name, placeholder, src, type_)
import Libs.Html.Styled.Attributes exposing (ariaExpanded)
import Tailwind.Breakpoints as Bp
import Tailwind.Utilities as Tw
import Components.Organisms.Search exposing (searchInput)

headerWebsite : String -> Html msg
headerWebsite url =
    header []
        [ div [ css [ Tw.relative, Tw.bg_white ] ]
            [ div [ css [ Tw.flex, Tw.justify_between, Tw.items_center, Tw.max_w_7xl, Tw.mx_auto, Tw.px_4, Tw.py_6, Bp.lg [ Tw.px_8 ], Bp.md [ Tw.justify_start, Tw.space_x_10 ], Bp.sm [ Tw.px_6 ] ] ]
                [ div [ css [ Tw.flex, Tw.justify_start, Bp.lg [ Tw.w_0, Tw.flex_1 ] ] ]
                    [ a [ href (Route.toHref Route.Home_) ]
                        [ span [ css [ Tw.sr_only ] ]
                            [ text "Azimutt" ]
                        , img [ src url, alt "Azimutt", css [ Tw.h_8, Tw.w_auto, Bp.sm [ Tw.h_10 ] ] ] []
                        ]
                    ]
                ]
            ]
        ]


headerApp : Html msg
headerApp =
    header
        [ css [ Tw.bg_white, Tw.shadow_sm, Bp.lg [ Tw.static, Tw.overflow_y_visible ] ] ]
        [ div [ css [ Tw.max_w_7xl, Tw.mx_auto, Tw.px_4, Bp.lg [ Tw.px_8 ], Bp.sm [ Tw.px_6 ] ] ]
            [ div [ css [ Tw.relative, Tw.flex, Tw.justify_between, Bp.lg [ Tw.gap_8 ], Bp.xl [ Tw.grid, Tw.grid_cols_12 ] ] ]
                [ div [ css [ Tw.flex, Bp.lg [ Tw.static ], Bp.md [ Tw.absolute, Tw.left_0, Tw.inset_y_0 ], Bp.xl [ Tw.col_span_2 ] ] ]
                    [ div [ css [ Tw.flex_shrink_0, Tw.flex, Tw.items_center ] ]
                        [ a [ href "/" ]
                            [ img [ css [ Tw.block, Tw.h_8, Tw.w_auto ], src "/logo.png", alt "Azimutt" ] [] ]
                        ]
                    ]
                ,searchInput
                , div [ css [ Tw.flex, Tw.items_center, Bp.lg [ Tw.hidden ], Bp.md [ Tw.absolute, Tw.right_0, Tw.inset_y_0 ] ] ]
                    [ 
                      button
                        [ type_ "button"
                        , css [ Tw.neg_mx_2, Tw.rounded_md, Tw.p_2, Tw.inline_flex, Tw.items_center, Tw.justify_center, Tw.text_gray_400, Css.focus [ Tw.outline_none, Tw.ring_2, Tw.ring_inset, Tw.ring_indigo_500 ], Css.hover [ Tw.bg_gray_100, Tw.text_gray_500 ] ]
                        , ariaExpanded False
                        ]
                        [ span [ css [ Tw.sr_only ] ]
                            [ text "Open menu" ]
                        , openMenu
                        , closedMenu
                        ]
                    ]
                , div [ css [ Tw.hidden, Bp.lg [ Tw.flex, Tw.items_center, Tw.justify_end ], Bp.xl [ Tw.col_span_4 ] ] ]
                    [ a
                        [ href "#"
                        , css [ Tw.ml_5, Tw.flex_shrink_0, Tw.bg_white, Tw.rounded_full, Tw.p_1, Tw.text_gray_400, Css.focus [ Tw.outline_none, Tw.ring_2, Tw.ring_offset_2, Tw.ring_indigo_500 ], Css.hover [ Tw.text_gray_500 ] ]
                        ]
                        [ span [ css [ Tw.sr_only ] ]
                            [ text "Help" ]
                        , help
                        ]
                    , a
                        [ href "#"
                        , css [ Tw.ml_6, Tw.inline_flex, Tw.items_center, Tw.px_4, Tw.py_2, Tw.border, Tw.border_transparent, Tw.text_sm, Tw.font_medium, Tw.rounded_md, Tw.shadow_sm, Tw.text_white, Tw.bg_indigo_600, Css.focus [ Tw.outline_none, Tw.ring_2, Tw.ring_offset_2, Tw.ring_indigo_500 ], Css.hover [ Tw.bg_indigo_700 ] ]
                        ]
                        [ text "New project" ]
                    ]
                ]
            ]
        ]


headerChapter : Chapter x
headerChapter =
    chapter "Header"
        |> renderComponentList
            [ ( "default", headerWebsite "/logo.png" )
            , ( "header app", headerApp )
            ]
