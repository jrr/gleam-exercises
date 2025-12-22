import gleam/bool
import gleam/dict
import gleam/list
import gleam/set

pub fn main() -> Nil {
  Nil
}

pub fn is_alternating(arr: List(Int)) -> Bool {
  arr
  // number each item
  |> list.index_map(fn(x, i) { #(i, x) }) 
  // group them by position modulo 2
  |> list.group(fn(n) { n.0 % 2 })
  |> dict.map_values(fn(_, value) { value |> list.map(fn(n) { n.1 }) })
  |> dict.values
  |> list.map(set.from_list)
  |> list.map(set.size)
  |> list.any(fn(size) { size > 1 })
  |> bool.negate
}
