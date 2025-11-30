import atomic_array.{type AtomicArray}
import gleam/int
import gleam/io
import gleam/list

pub fn main() -> Nil {
  io.println("Hello from cassidoo_20251110_merge_arrays!")
}

pub fn ignore(x) {
  let _ = x
  Nil
}

pub fn swap(arr: AtomicArray, a_pos: Int, b_pos: Int) -> Nil {
  let a_val = atomic_array.get(arr, a_pos)
  let b_val = atomic_array.get(arr, b_pos)
  let #(a, b) = case a_val, b_val {
    Ok(aa), Ok(bb) -> #(aa, bb)
    _, _ -> panic
  }
  atomic_array.set(arr, a_pos, b) |> ignore
  atomic_array.set(arr, b_pos, a) |> ignore
}

pub fn fill_array(size: Int, values: List(Int)) -> AtomicArray {
  let arr = atomic_array.new_unsigned(size)
  values |> list.index_map(fn(x, i) { atomic_array.set(arr, i, x) })
  arr
}

pub fn in_place_sort(arr: AtomicArray) {
  list.range(0, atomic_array.size(arr) - 1)
  |> list.map(fn(i) {
    let remaining = atomic_array.to_list(arr) |> list.drop(i)
    let assert [head, ..tail] = remaining

    let swap_target = find_min(tail)

    case swap_target, head {
      Ok(x), v if x.0 < v -> {
        swap(arr, x.1 + i + 1, i)
        Nil
      }
      _, _ -> {
        Nil
      }
    }
  })
}

fn find_min(arr: List(Int)) {
  arr
  |> list.index_map(fn(x, i) { #(x, i) })
  |> list.max(fn(a, b) { int.compare(b.0, a.0) })
}

pub fn merge_arrays(large: AtomicArray, small: AtomicArray) {
  let num_values = atomic_array.size(large) - atomic_array.size(small)

  // fill the values (so we now have an unsorted array)
  atomic_array.to_list(small)
  |> list.index_map(fn(x, i) { atomic_array.set(large, num_values + i, x) })

  // in-place sort the array
  in_place_sort(large)

  Nil
}
