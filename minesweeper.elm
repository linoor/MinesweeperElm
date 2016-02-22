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
     minesCount : Int,
     rowCount : Int,
     columnCount : Int,
     timeLimit : Int,
}
