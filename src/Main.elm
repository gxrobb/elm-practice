module Main exposing(..)

import Browser
import String exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)



main =
  Browser.sandbox
    {
      init = init,
      view = view,
      update = update
    }

type Messages =
   SetNewName String
    | SetDeleteName String
    | DeleteTheName
    | Add
    | Delete
    | SetUpdateText String
    -- | GetQuote

init =
  {
    name = "Robb"
    , newNameValue = ""
    , updateMe = "Change Me!"
    , nameList =  [ "Robb", "James" ]
    , deleteNameValue = ""
  }

view model =
  div [ class "container" ]
    [
      div [] [
        div [ class "row" ][
          div [ class "col-6" ][
            div [ class "card p-1 text-center mt-5" ][
              h3 [][ text "List Of Names" ]
              , ul [] ( List.map viewName model.nameList )
            ]
          ]
          , div [ class "col-6 mt-5" ][
              div [ class "card-right card" ][
                div [] [
                    h4 [][ text "Controls" ]
                    , h5 [][ text "Add A Name" ]
                    , input [ onInput SetNewName , class "form-control" ] []
                    , button [ onClick Add , class "btn btn-primary mt-2 mb-4" ] [ text "Add Name" ]
                  ]
                  , div [] [
                     h5 [][ text "Delete A Name" ]
                    , input [ onInput SetDeleteName , class "form-control" ] []
                    , button [ onClick Delete , class "btn btn-primary mt-2 mb-4" ] [ text "Delete Name" ]
                  ]
              ]
          ]
        ]
        , div [ class "changeMe card" ][
            h3 [][ text model.updateMe ]
            , div [][
              input [ onInput SetUpdateText , class "form-control" ] []
            ]
          ]
      ]
    ]

viewName name =
  li [] [ text name ]

changeIt text =
  if text /= "" then text else "Please Enter A Name"

update msg model =
  case msg of
    SetNewName theText ->
      { model | newNameValue = theText}
    SetDeleteName theText ->
      { model | deleteNameValue = theText}
    DeleteTheName ->
      { model | name = "" }
    Add ->
      { model | nameList = model.nameList ++ [ model.newNameValue ] }
    Delete  ->
      { model | nameList = List.filter (\name -> name /= model.deleteNameValue) model.nameList }
    SetUpdateText theText ->
      { model | updateMe = theText}
