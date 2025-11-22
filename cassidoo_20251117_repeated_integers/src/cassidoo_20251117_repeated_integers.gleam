import argv
import gleam/int
import gleam/list

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
