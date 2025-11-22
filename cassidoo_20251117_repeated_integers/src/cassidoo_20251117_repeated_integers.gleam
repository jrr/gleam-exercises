import argv
import gleam/int
import gleam/list

// https://buttondown.com/cassidoo/archive/words-once-they-are-printed-have-a-life-of-their/
//
// Given a positive integer n, write a function that returns an array containing all integers from 1 to n, where each integer i appears exactly i times in the result. For example, 3 should appear 3 times, 5 should appear 5 times, and so on. The order of the integers in the output array does not matter.
//
// Example:
//
// > repeatedIntegers(4)
// > [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]

pub fn one_to_n(n: Int) {
  list.repeat(Nil, times: n) |> list.index_map(fn(_, i) { i + 1 })
}

pub fn solve(n: Int) {
  n
  |> one_to_n
  |> list.map(fn(n) { list.repeat(n, n) })
  |> list.flatten
  |> echo
  Nil
}

pub fn main() -> Nil {
  let parsed_arg = case argv.load().arguments {
    [s] -> int.parse(s)
    _ -> Error(Nil)
  }

  case parsed_arg {
    Ok(num) -> solve(num)
    _ -> Nil
  }
}
