import gleam/int
import gleam/io
import gleam/list

import atomic_array.{type AtomicArray}

pub fn main() -> Nil {
  io.println("Hello from cassidoo_20251110_merge_arrays!")
}

pub fn merge_arrays(large: AtomicArray, small: AtomicArray) {
  let num_values = atomic_array.size(large) - atomic_array.size(small)
  let large_values = large |> atomic_array.to_list |> list.take(num_values)
  let combined =
    list.append(large_values, small |> atomic_array.to_list)
    |> list.sort(int.compare)
  combined |> list.index_map(fn(x, i) { atomic_array.set(large, i, x) })

  Nil
}
