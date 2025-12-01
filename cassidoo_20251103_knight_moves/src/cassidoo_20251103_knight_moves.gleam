import gleam/int
import gleam/io
import gleam/list
import gleam/order

pub fn main() -> Nil {
  io.println("Hello from cassidoo_20251103_knight_moves!")
}

type IntPair =
  #(Int, Int)

type Position =
  IntPair

type Vector =
  IntPair

const relative_moves: List(Vector) = [
  #(1, 2),
  #(-1, 2),
  #(1, -2),
  #(-1, -2),
  #(2, 1),
  #(-2, 1),
  #(2, -1),
  #(-2, -1),
]

fn add(a: IntPair, b: IntPair) -> IntPair {
  #(a.0 + b.0, a.1 + b.1)
}

pub fn compare(a: IntPair, with b: IntPair) -> order.Order {
  case a == b {
    True -> order.Eq
    False ->
      case a, b {
        a, b if a.0 < b.0 -> order.Lt
        a, b if a.0 > b.0 -> order.Gt
        a, b if a.0 == b.0 -> int.compare(a.1, b.1)
        _, _ -> panic
      }
  }
}

pub fn knight_moves(position: Position) -> List(Position) {
  relative_moves
  |> list.map(fn(move) { add(position, move) })
  |> list.filter(is_valid)
  |> list.sort(compare)
}

fn is_valid(value: Position) -> Bool {
  case value.0, value.1 {
    a, _ if a < 0 -> False
    _, b if b < 0 -> False
    a, _ if a > 7 -> False
    _, b if b > 7 -> False
    _, _ -> True
  }
}
