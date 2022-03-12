module Gen.Params.Projects.New exposing (Params, parser)

import Url.Parser as Parser exposing ((</>), Parser)


type alias Params =
    ()


parser =
    (Parser.s "projects" </> Parser.s "new")

