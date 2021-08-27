module Components.Organisms.Search exposing (searchInput, searchChapter)
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


searchInput =
    div
        [ css [ Tw.min_w_0, Tw.flex_1, Bp.lg [ Tw.px_0 ], Bp.md [ Tw.px_8 ], Bp.xl [ Tw.col_span_6 ] ] ]
        [ div [ css [ Tw.flex, Tw.items_center, Tw.px_6, Tw.py_4, Bp.lg [ Tw.max_w_none, Tw.mx_0 ], Bp.md [ Tw.max_w_3xl, Tw.mx_auto ], Bp.xl [ Tw.px_0 ] ] ]
            [ div [ css [ Tw.w_full ] ]
                [ label [ for "search", css [ Tw.sr_only ] ]
                    [ text "Search" ]
                , div [ css [ Tw.relative ] ]
                    [ div [ css [ Tw.pointer_events_none, Tw.absolute, Tw.inset_y_0, Tw.left_0, Tw.pl_3, Tw.flex, Tw.items_center ] ]
                        [ search ]
                    , input
                        [ id "search"
                        , name "search"
                        , css [ Tw.block, Tw.w_full, Tw.bg_white, Tw.border, Tw.border_gray_300, Tw.rounded_md, Tw.py_2, Tw.pl_10, Tw.pr_3, Tw.text_sm, Tw.placeholder_gray_500, Css.focus [ Tw.outline_none, Tw.text_gray_900, Tw.placeholder_gray_400, Tw.ring_1, Tw.ring_indigo_500, Tw.border_indigo_500 ], Bp.sm [ Tw.text_sm ] ]
                        , placeholder "Search"
                        , type_ "search"
                        ]
                        []
                    ]
                ]
            ]
        ]

searchChapter : Chapter x
searchChapter =
    chapter "Search"
        |> renderComponentList
            [ ( "searchInput", searchInput )
            ]