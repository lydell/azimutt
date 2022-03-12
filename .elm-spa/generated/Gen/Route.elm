module Gen.Route exposing
    ( Route(..)
    , fromUrl
    , toHref
    )

import Gen.Params.Blog
import Gen.Params.Embed
import Gen.Params.Home_
import Gen.Params.NotFound
import Gen.Params.Projects
import Gen.Params.PwaStart
import Gen.Params.Blog.Slug_
import Gen.Params.Projects.Id_
import Gen.Params.Projects.New
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser)


type Route
    = Blog
    | Embed
    | Home_
    | NotFound
    | Projects
    | PwaStart
    | Blog__Slug_ { slug : String }
    | Projects__Id_ { id : String }
    | Projects__New


fromUrl : Url -> Route
fromUrl =
    Parser.parse (Parser.oneOf routes) >> Maybe.withDefault NotFound


routes : List (Parser (Route -> a) a)
routes =
    [ Parser.map Home_ Gen.Params.Home_.parser
    , Parser.map Blog Gen.Params.Blog.parser
    , Parser.map Embed Gen.Params.Embed.parser
    , Parser.map NotFound Gen.Params.NotFound.parser
    , Parser.map Projects Gen.Params.Projects.parser
    , Parser.map PwaStart Gen.Params.PwaStart.parser
    , Parser.map Projects__New Gen.Params.Projects.New.parser
    , Parser.map Projects__Id_ Gen.Params.Projects.Id_.parser
    , Parser.map Blog__Slug_ Gen.Params.Blog.Slug_.parser
    ]


toHref : Route -> String
toHref route =
    let
        joinAsHref : List String -> String
        joinAsHref segments =
            "/" ++ String.join "/" segments
    in
    case route of
        Blog ->
            joinAsHref [ "blog" ]
    
        Embed ->
            joinAsHref [ "embed" ]
    
        Home_ ->
            joinAsHref []
    
        NotFound ->
            joinAsHref [ "not-found" ]
    
        Projects ->
            joinAsHref [ "projects" ]
    
        PwaStart ->
            joinAsHref [ "pwa-start" ]
    
        Blog__Slug_ params ->
            joinAsHref [ "blog", params.slug ]
    
        Projects__Id_ params ->
            joinAsHref [ "projects", params.id ]
    
        Projects__New ->
            joinAsHref [ "projects", "new" ]

