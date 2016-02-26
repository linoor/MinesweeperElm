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
     rowCount    = 20,
     columnCount = 20,
     timeLimit   = 100,
     timeElapsed = 0
 }

-- VIEW

background : Color
background = rgb 51 168 224

shadow : Color
shadow = rgb 41 139 203

view : Game -> Element
view game =
     let
         size = 25
         w = size * game.columnCount
         h = size * game.rowCount
         screenHeight = 700
         screenWidth = 615

         boardLength : Int
         boardLength = size * game.columnCount
         boardHeight : Int
         boardHeight = size * game.rowCount
         spaceBetween = (screenWidth-boardLength) // 2
         spaceUnderBoard = 30

         clockIconPositionX = -boardLength // 2 |> toFloat
         clockIconPositionY = (boardHeight//2) + 20 |> toFloat

         clockIconPosition : (Float, Float)
         clockIconPosition = (clockIconPositionX, clockIconPositionY)
     in
     container screenWidth screenHeight middle <|
         collage screenWidth screenHeight [
             rect screenWidth screenHeight |> filled background,
             image 128 32 "ikonki/saper_logo.png" |> toForm
                                                  |> move (0, screenHeight/2 - (32/2) - 10),
             image 20 20 "ikonki/zegarek.png" |> toForm
                                              |> move clockIconPosition,
             polygon [
                (0.0,0.0),
                (toFloat boardLength, 0.0),
                (toFloat boardLength, toFloat boardHeight),
                (toFloat (boardLength + spaceBetween), toFloat (boardHeight - size)),
                (toFloat (boardLength + spaceBetween), -spaceUnderBoard),
                (0.0+size, -spaceUnderBoard)
             ] |> filled shadow |> move (-(toFloat boardLength / 2), -(screenHeight/2) + spaceUnderBoard)
     ]


main : Element
main = view defaultGame
