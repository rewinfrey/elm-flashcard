module Flashcard where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Content =
  { sideA: String
  , sideB: String }

-- Model
type alias Flashcard =
  { sideA: String
  , sideB: String
  , correct: Bool
  , attempts: Int }

type alias Flashcards =
  { cards: List Flashcard
  , totalCorrect: Int
  , totalIncorrect: Int
  , attempts: Int }

hiraganaContent : List Content
hiraganaContent =
  [ { sideA = "あ", sideB = "a" }
  , { sideA = "い", sideB = "i" }
  , { sideA = "う", sideB = "u" }
  , { sideA = "え", sideB = "e" }
  , { sideA = "お", sideB = "o" } ]

flashcardForContent : Content -> Flashcard
flashcardForContent content =
  { sideA = content.sideA
  , sideB = content.sideB
  , correct = True
  , attempts = 0 }

initialModel : Flashcards
initialModel =
  {
    cards = List.map flashcardForContent hiraganaContent
  , totalCorrect = 0
  , totalIncorrect = 0
  , attempts = 0
  }

-- Update

viewFlashcard : Flashcard -> Html
viewFlashcard flashcard =
  Html.li [] [ text flashcard.sideA, text flashcard.sideB ]

-- View
view : Flashcards -> Html
view flashcards =
  Html.ul [] (List.map viewFlashcard flashcards.cards)

-- Main
main : Html
main =
  Html.div [] [ view initialModel ]
