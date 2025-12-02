import cassidoo_20251201_sort_hex.{solve}
import gleam/list
import gleam/string
import gleeunit
import gleeunit/should

pub fn main() -> Nil {
  gleeunit.main()
}

// https://buttondown.com/cassidoo/archive/we-all-have-our-down-days-but-its-not-hard-to/
//
// There are 16 basic HTML Colors. Write a program to output them in ascending order by HEX value. Don't use any built-in sorting methods!

// Example output:

// 000000
// 000080
// 0000FF
// 008000
// 008080
// 00FF00
// 00FFFF
// 800000
// 800080
// 808000
// 808080
// C0C0C0
// FF0000
// FF00FF
// FFFF00
// FFFFFF

pub fn example_test() {
  let input = [
    "000080",
    "FFFFFF",
    "0000FF",
    "008000",
    "00FF00",
    "00FFFF",
    "800000",
    "FFFF00",
    "800080",
    "808000",
    "000000",
    "808080",
    "C0C0C0",
    "FF0000",
    "FF00FF",
    "008080",
  ]
  input |> solve |> should.equal(input |> list.sort(string.compare))
}
