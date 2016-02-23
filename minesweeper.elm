import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
--import Keyboard
--import Text
--import Time exposing (..)
--import Window

-- MODEL

type FieldState = Covered
                | Mined
                | Flagged
                | Uncovered


type alias Field = {
     id : Int,
     state : FieldState
}

type alias Row   = List Field
type alias Board = List Row

type alias Game = {
     minesCount  : Int,
     rowCount    : Int,
     columnCount : Int,
     -- time limit in seconds
     timeLimit   : Int,
     timeElapsed : Int
}

defaultGame : Game
defaultGame = {
     minesCount  = 10,
     rowCount    = 10,
     columnCount = 10,
     timeLimit   = 100,
     timeElapsed = 0
 }

-- VIEW

backgroundColor : Color
backgroundColor = rgb 51 168 224

view : Game -> Element
view game =
     let size = 25
         w = size * game.columnCount
         h = size * game.rowCount
         screenHeight = 700
         screenWidth = 615
     in
     container screenWidth screenHeight middle <|
         collage screenWidth screenHeight [
             rect screenWidth screenHeight |> filled backgroundColor
     ]


main : Element
main = view defaultGame
