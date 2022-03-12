module Gen.Pages exposing (Model, Msg, init, subscriptions, update, view)

import Browser.Navigation exposing (Key)
import Effect exposing (Effect)
import ElmSpa.Page
import Gen.Params.Blog
import Gen.Params.Embed
import Gen.Params.Home_
import Gen.Params.NotFound
import Gen.Params.Projects
import Gen.Params.PwaStart
import Gen.Params.Blog.Slug_
import Gen.Params.Projects.Id_
import Gen.Params.Projects.New
import Gen.Model as Model
import Gen.Msg as Msg
import Gen.Route as Route exposing (Route)
import Page exposing (Page)
import Pages.Blog
import Pages.Embed
import Pages.Home_
import Pages.NotFound
import Pages.Projects
import Pages.PwaStart
import Pages.Blog.Slug_
import Pages.Projects.Id_
import Pages.Projects.New
import Request exposing (Request)
import Shared
import Task
import Url exposing (Url)
import View exposing (View)


type alias Model =
    Model.Model


type alias Msg =
    Msg.Msg


init : Route -> Shared.Model -> Url -> Key -> ( Model, Effect Msg )
init route =
    case route of
        Route.Blog ->
            pages.blog.init ()
    
        Route.Embed ->
            pages.embed.init ()
    
        Route.Home_ ->
            pages.home_.init ()
    
        Route.NotFound ->
            pages.notFound.init ()
    
        Route.Projects ->
            pages.projects.init ()
    
        Route.PwaStart ->
            pages.pwaStart.init ()
    
        Route.Blog__Slug_ params ->
            pages.blog__slug_.init params
    
        Route.Projects__Id_ params ->
            pages.projects__id_.init params
    
        Route.Projects__New ->
            pages.projects__new.init ()


update : Msg -> Model -> Shared.Model -> Url -> Key -> ( Model, Effect Msg )
update msg_ model_ =
    case ( msg_, model_ ) of
        ( Msg.Blog msg, Model.Blog params model ) ->
            pages.blog.update params msg model
    
        ( Msg.Embed msg, Model.Embed params model ) ->
            pages.embed.update params msg model
    
        ( Msg.Home_ msg, Model.Home_ params model ) ->
            pages.home_.update params msg model
    
        ( Msg.NotFound msg, Model.NotFound params model ) ->
            pages.notFound.update params msg model
    
        ( Msg.Projects msg, Model.Projects params model ) ->
            pages.projects.update params msg model
    
        ( Msg.PwaStart msg, Model.PwaStart params model ) ->
            pages.pwaStart.update params msg model
    
        ( Msg.Blog__Slug_ msg, Model.Blog__Slug_ params model ) ->
            pages.blog__slug_.update params msg model
    
        ( Msg.Projects__Id_ msg, Model.Projects__Id_ params model ) ->
            pages.projects__id_.update params msg model
    
        ( Msg.Projects__New msg, Model.Projects__New params model ) ->
            pages.projects__new.update params msg model

        _ ->
            \_ _ _ -> ( model_, Effect.none )


view : Model -> Shared.Model -> Url -> Key -> View Msg
view model_ =
    case model_ of
        Model.Redirecting_ ->
            \_ _ _ -> View.none
    
        Model.Blog params model ->
            pages.blog.view params model
    
        Model.Embed params model ->
            pages.embed.view params model
    
        Model.Home_ params model ->
            pages.home_.view params model
    
        Model.NotFound params model ->
            pages.notFound.view params model
    
        Model.Projects params model ->
            pages.projects.view params model
    
        Model.PwaStart params model ->
            pages.pwaStart.view params model
    
        Model.Blog__Slug_ params model ->
            pages.blog__slug_.view params model
    
        Model.Projects__Id_ params model ->
            pages.projects__id_.view params model
    
        Model.Projects__New params model ->
            pages.projects__new.view params model


subscriptions : Model -> Shared.Model -> Url -> Key -> Sub Msg
subscriptions model_ =
    case model_ of
        Model.Redirecting_ ->
            \_ _ _ -> Sub.none
    
        Model.Blog params model ->
            pages.blog.subscriptions params model
    
        Model.Embed params model ->
            pages.embed.subscriptions params model
    
        Model.Home_ params model ->
            pages.home_.subscriptions params model
    
        Model.NotFound params model ->
            pages.notFound.subscriptions params model
    
        Model.Projects params model ->
            pages.projects.subscriptions params model
    
        Model.PwaStart params model ->
            pages.pwaStart.subscriptions params model
    
        Model.Blog__Slug_ params model ->
            pages.blog__slug_.subscriptions params model
    
        Model.Projects__Id_ params model ->
            pages.projects__id_.subscriptions params model
    
        Model.Projects__New params model ->
            pages.projects__new.subscriptions params model



-- INTERNALS


pages :
    { blog : Bundle Gen.Params.Blog.Params Pages.Blog.Model Pages.Blog.Msg
    , embed : Bundle Gen.Params.Embed.Params Pages.Embed.Model Pages.Embed.Msg
    , home_ : Bundle Gen.Params.Home_.Params Pages.Home_.Model Pages.Home_.Msg
    , notFound : Bundle Gen.Params.NotFound.Params Pages.NotFound.Model Pages.NotFound.Msg
    , projects : Bundle Gen.Params.Projects.Params Pages.Projects.Model Pages.Projects.Msg
    , pwaStart : Bundle Gen.Params.PwaStart.Params Pages.PwaStart.Model Pages.PwaStart.Msg
    , blog__slug_ : Bundle Gen.Params.Blog.Slug_.Params Pages.Blog.Slug_.Model Pages.Blog.Slug_.Msg
    , projects__id_ : Bundle Gen.Params.Projects.Id_.Params Pages.Projects.Id_.Model Pages.Projects.Id_.Msg
    , projects__new : Bundle Gen.Params.Projects.New.Params Pages.Projects.New.Model Pages.Projects.New.Msg
    }
pages =
    { blog = bundle Pages.Blog.page Model.Blog Msg.Blog
    , embed = bundle Pages.Embed.page Model.Embed Msg.Embed
    , home_ = bundle Pages.Home_.page Model.Home_ Msg.Home_
    , notFound = bundle Pages.NotFound.page Model.NotFound Msg.NotFound
    , projects = bundle Pages.Projects.page Model.Projects Msg.Projects
    , pwaStart = bundle Pages.PwaStart.page Model.PwaStart Msg.PwaStart
    , blog__slug_ = bundle Pages.Blog.Slug_.page Model.Blog__Slug_ Msg.Blog__Slug_
    , projects__id_ = bundle Pages.Projects.Id_.page Model.Projects__Id_ Msg.Projects__Id_
    , projects__new = bundle Pages.Projects.New.page Model.Projects__New Msg.Projects__New
    }


type alias Bundle params model msg =
    ElmSpa.Page.Bundle params model msg Shared.Model (Effect Msg) Model Msg (View Msg)


bundle page toModel toMsg =
    ElmSpa.Page.bundle
        { redirecting =
            { model = Model.Redirecting_
            , view = View.none
            }
        , toRoute = Route.fromUrl
        , toUrl = Route.toHref
        , fromCmd = Effect.fromCmd
        , mapEffect = Effect.map toMsg
        , mapView = View.map toMsg
        , toModel = toModel
        , toMsg = toMsg
        , page = page
        }


type alias Static params =
    Bundle params () Never


static : View Never -> (params -> Model) -> Static params
static view_ toModel =
    { init = \params _ _ _ -> ( toModel params, Effect.none )
    , update = \params _ _ _ _ _ -> ( toModel params, Effect.none )
    , view = \_ _ _ _ _ -> View.map never view_
    , subscriptions = \_ _ _ _ _ -> Sub.none
    }
    
