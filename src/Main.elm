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
    | ChangeTheName String
    | DeleteTheName
    | GetQuote

init =
  {
    name = "Robb"
    , newNameValue = ""
    , quote = ""
  }

view model =
  div [] [
    h1 [] [text "Hello Datica! My Name Is: ", text model.name]
    , div [][text "Change Name?"]
    , div [][
        input [onInput ChangeTheName][]
        , button [onClick Change][text "Change it!"]
        , button [onClick DeleteTheName][text "Delete the name!"]
    ]
    ,
    div [][
      h2 [][text "Quote Request"]
      , p [][text model.quote]
      , button [onClick GetQuote][text "Requiest Quote"]
    ]
  ]


changeIt text =
  if text /= "" then text else "Please Enter A Name"





update msg model =
  case msg of
    Change ->
      { model | name = changeIt model.newNameValue }
    ChangeTheName theText ->
      { model | newNameValue = theText}
    DeleteTheName ->
      { model | name = "" }
    GetQuote ->
      { model | quote = "3" }
