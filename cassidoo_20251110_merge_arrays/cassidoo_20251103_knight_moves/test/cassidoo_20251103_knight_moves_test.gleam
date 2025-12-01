import gleeunit

pub fn main() -> Nil {
  gleeunit.main()
}

//
// https://buttondown.com/cassidoo/archive/your-voice-matters-your-stories-are-worth-telling/
//
// This week's question:
// Given he current position of a knight as [row, col] in an 8x8 chess board represented as a 2D array, write a function to return all valid moves the knight can make. Extra credit: Do this for every chess piece!

// Example:

// knightMoves([4, 4])
// > [[2, 3], [2, 5], [3, 2], [3, 6], [5, 2], [5, 6], [6, 3], [6, 5]]

// knightMoves([0, 0])
// > [[1, 2], [2, 1]]

// knightMoves([1, 2])
// > [[0, 0], [0, 4], [2, 0], [2, 4], [3, 1], [3, 3]]

pub fn hello_world_test() {
  let name = "Joe"
  let greeting = "Hello, " <> name <> "!"

  assert greeting == "Hello, Joe!"
}
