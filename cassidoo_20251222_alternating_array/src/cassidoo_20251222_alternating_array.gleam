import gleam/bool
import gleam/dict
import gleam/list
import gleam/set

pub fn main() -> Nil {
  Nil
}

pub fn is_alternating(arr: List(Int)) -> Bool {
  arr
  // evens and odds
  |> group_by_index(fn(i) { i % 2 })
  // list of lists
  |> dict.values
  // how many unique items are in each list?
  |> list.map(count_distinct)
  // if any has more than 1 -> not alternating
  |> list.any(fn(size) { size > 1 })
  |> bool.negate
}

pub fn count_distinct(arr: List(value)) -> Int {
  arr
  |> set.from_list
  |> set.size
}

pub fn group_by_index(arr: List(value), sort_fn: fn(Int) -> Int) {
  arr
  |> list.index_map(fn(x, i) { #(i, x) })
  |> list.group(fn(n) { sort_fn(n.0) })
  |> dict.map_values(fn(_key, value) { value |> list.map(fn(n) { n.1 }) })
}
