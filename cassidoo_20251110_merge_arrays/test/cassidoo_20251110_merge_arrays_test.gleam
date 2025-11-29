import atomic_array.{type AtomicArray}
import cassidoo_20251110_merge_arrays.{merge_arrays}
import gleam/int
import gleam/list
import gleeunit
import gleeunit/should

pub fn main() -> Nil {
  gleeunit.main()
}

// https://buttondown.com/cassidoo/archive/if-youre-not-failing-youre-not-trying-reshma/
//
// This week's question:
// You are given two sorted arrays, a and b, where a has a large enough size buffer at the end to hold b (which can be spaces, zeroes, or nulls). Write a function to merge b into a in sorted order.
//
// Example:
//
// let a = [1, 3, 5, 0, 0, 0];
// let b = [2, 4, 6];
//
// > merge(a, b)
// > [1, 2, 3, 4, 5, 6]

pub fn hello_world_test() {
  let name = "Joe"
  let greeting = "Hello, " <> name <> "!"

  assert greeting == "Hello, Joe!"
}

// This exercise (efficiently mutating arrays) doesn't really align with
// Gleam, which emphases immutability, even in its data structures (and
// doesn't even have arrays).
//
// Just for fun I'm going to try using the first array library I found,
// 'atomic_array'.

pub fn fill_array(size: Int, values: List(Int)) -> AtomicArray {
  let arr = atomic_array.new_unsigned(size)
  values |> list.index_map(fn(x, i) { atomic_array.set(arr, i, x) })
  arr
}

pub fn fill_array_test() {
  fill_array(5, [1, 2, 3])
  |> atomic_array.to_list
  |> should.equal([1, 2, 3, 0, 0])
}

pub fn merge_arrays_example_test() {
  let a = fill_array(6, [1, 3, 5])
  let b = fill_array(3, [2, 4, 6])
  merge_arrays(a, b)
  a
  |> atomic_array.to_list
  |> should.equal([1, 2, 3, 4, 5, 6])
}
