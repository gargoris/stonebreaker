module Main exposing (..)

import Html exposing (..)
import Database.Messages exposing (..)
import Database.Models exposing (..)
import Database.View exposing (..)
import Database.Update exposing (..)


-- MODEL


{-| The model, with all its bells and whistlers
-}
type alias Model =
    { remoteDatabase : DataModel
    , configuredRepo : Bool
    }


initModel : Model
initModel =
    Model Database.Models.initModel False


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



-- MESSAGES


type Msg
    = NoOp
    | DatabaseMsg Database.Messages.Msg



-- VIEW


view : Model -> Html Msg
view model =
    let
        t =
            Database.View.showRepo model.remoteDatabase model.configuredRepo
    in
        div []
            [ Html.map DatabaseMsg t, Html.map DatabaseMsg (showTree model.remoteDatabase.projects) ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        DatabaseMsg (Database.Messages.NewRepo) ->
            ( { model | configuredRepo = True }, Cmd.none )

        DatabaseMsg submsg ->
            let
                ( repoT, msgT ) =
                    Database.Update.update submsg model.remoteDatabase
            in
                ( { model | remoteDatabase = repoT }, Cmd.map DatabaseMsg msgT )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
