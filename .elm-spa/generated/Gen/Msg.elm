module Gen.Msg exposing (Msg(..))

import Gen.Params.Blog
import Gen.Params.Embed
import Gen.Params.Home_
import Gen.Params.NotFound
import Gen.Params.Projects
import Gen.Params.PwaStart
import Gen.Params.Blog.Slug_
import Gen.Params.Projects.Id_
import Gen.Params.Projects.New
import Pages.Blog
import Pages.Embed
import Pages.Home_
import Pages.NotFound
import Pages.Projects
import Pages.PwaStart
import Pages.Blog.Slug_
import Pages.Projects.Id_
import Pages.Projects.New


type Msg
    = Blog Pages.Blog.Msg
    | Embed Pages.Embed.Msg
    | Home_ Pages.Home_.Msg
    | NotFound Pages.NotFound.Msg
    | Projects Pages.Projects.Msg
    | PwaStart Pages.PwaStart.Msg
    | Blog__Slug_ Pages.Blog.Slug_.Msg
    | Projects__Id_ Pages.Projects.Id_.Msg
    | Projects__New Pages.Projects.New.Msg

