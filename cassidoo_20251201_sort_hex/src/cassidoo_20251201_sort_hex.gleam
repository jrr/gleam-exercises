import gleam/io
import gleam/list
import gleam/string

pub fn main() -> Nil {
  io.println("Hello from cassidoo_20251201_sort_hex!")
}

const hex_chars_string = "0123456789ABCDEF"

pub fn solve(input: List(String)) -> List(String) {
  let hex_chars = hex_chars_string |> string.to_graphemes
  recurse(hex_chars, input)
}

fn recurse(hex_chars: List(String), input: List(String)) -> List(String) {
  hex_chars
  // for each char 0-F
  |> list.flat_map(fn(hexchar) {
    // grab the items that start with that char
    let matches =
      input |> list.filter(fn(s) { s |> string.starts_with(hexchar) })

    // tear the first char off
    let tails =
      matches
      |> list.map(fn(s) {
        let assert Ok(#(_head, tail)) = string.pop_grapheme(s)
        tail
      })

    // recurse
    tails
    |> fn(tails) {
      case tails {
        [] -> []
        x -> {
          let assert Ok(first_item) = list.first(x)
          case string.is_empty(first_item) {
            True -> x
            False -> recurse(hex_chars, x)
          }
        }
      }
    }
    // reassemble [head,..tail]
    |> list.map(fn(tail) { hexchar <> tail })
  })
}
