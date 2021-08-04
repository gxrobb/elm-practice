module Main exposing(..)

import Browser
import String exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Quote



main =
  Browser.sandbox
    {
      init = init,
      view = view,
      update = update
    }




type Messages =
  Change
    | SetNewName String
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
    , nameList = ["Robb", "James"]
    , deleteNameValue = ""
  }


view model =
  div []
    [ ul [] (List.map viewName model.nameList)
    , input [onInput SetNewName] []
    , button [onClick Add] [text "Add Name"]
    , input [onInput SetDeleteName] []
    , button [onClick Delete] [text "Delete Name"]
    , div [][
      text model.updateMe
      , div [][
        input [onInput SetUpdateText] []
        ]
      ]
    ]

viewName name =
  li [] [ text name ]

changeIt text =
  if text /= "" then text else "Please Enter A Name"


-- toBeDeleted name = List.member name ["Robb", "James", "Matt"]
-- List.filter (not << toBeDeleted) [ "Robb", "William", "James", "Bernard", "Dolores", "Teddy" ]
--
--



update msg model =
  case msg of
    Change ->
      { model | name = changeIt model.newNameValue }
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
