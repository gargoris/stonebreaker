module Database.View exposing (..)

import Database.Messages exposing (..)
import Database.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (action, class, id, disabled, name, placeholder, property, required, size, src, style, type_, value)
import Html.Events exposing (on, onInput, onClick, onSubmit, targetValue)


showRepo : DataRepo -> Bool -> Html Msg
showRepo repo cfg =
    if cfg then
        div [] [ h1 [] [ text repo.name ], p [] [ text repo.url ] ]
    else
        form
            [ action "javascript:void(0);"
            , onSubmit NewRepo
            ]
            [ h2 [] [ text "New repo" ]
            , div [ class "input-group clearfix" ]
                [ div
                    [ class "input-group" ]
                    [ span
                        [ class "input-group-addon" ]
                        [ i [ class "glyphicon glyphicon-link" ] [] ]
                    , input
                        [ type_ "text"
                        , class "form-control md-col md-col-6"
                        , placeholder "Url"
                        , size 40
                        , required True
                        , onInput NewUrl
                        ]
                        []
                    ]
                , div
                    [ class "input-group" ]
                    [ span
                        [ class "input-group-addon" ]
                        [ i [ class "glyphicon glyphicon-user" ] [] ]
                    , input
                        [ type_ "text"
                        , class "form-control md-col md-col-6"
                        , placeholder "User"
                        , size 40
                        , required True
                        , onInput NewUser
                        ]
                        []
                    ]
                , div
                    [ class "input-group" ]
                    [ span
                        [ class "input-group-addon" ]
                        [ i [ class "glyphicon glyphicon-asterisk" ] [] ]
                    , input
                        [ type_ "password"
                        , class "form-control md-col md-col-6"
                        , placeholder "Password"
                        , size 40
                        , required True
                        , onInput NewPassword
                        ]
                        []
                    ]
                , div
                    [ class "col-md-3 col-md-offset-9" ]
                    [ button
                        [ type_ "submit"
                        , class "btn btn-primary  md-col md-col-6"
                        , required True
                        ]
                        [ text "Send" ]
                    ]
                ]
            ]
