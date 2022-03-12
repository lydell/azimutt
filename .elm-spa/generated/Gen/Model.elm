module Gen.Model exposing (Model(..))

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


type Model
    = Redirecting_
    | Blog Gen.Params.Blog.Params Pages.Blog.Model
    | Embed Gen.Params.Embed.Params Pages.Embed.Model
    | Home_ Gen.Params.Home_.Params Pages.Home_.Model
    | NotFound Gen.Params.NotFound.Params Pages.NotFound.Model
    | Projects Gen.Params.Projects.Params Pages.Projects.Model
    | PwaStart Gen.Params.PwaStart.Params Pages.PwaStart.Model
    | Blog__Slug_ Gen.Params.Blog.Slug_.Params Pages.Blog.Slug_.Model
    | Projects__Id_ Gen.Params.Projects.Id_.Params Pages.Projects.Id_.Model
    | Projects__New Gen.Params.Projects.New.Params Pages.Projects.New.Model

