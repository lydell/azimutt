module Gen.Params.Blog.Slug_ exposing (Params, parser)

import Url.Parser as Parser exposing ((</>), Parser)


type alias Params =
    { slug : String }


parser =
    Parser.map Params (Parser.s "blog" </> Parser.string)

