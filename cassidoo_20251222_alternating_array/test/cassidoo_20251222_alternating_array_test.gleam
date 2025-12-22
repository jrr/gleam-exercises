import gleeunit
import cassidoo_20251222_alternating_array.{is_alternating}

pub fn main() -> Nil {
  gleeunit.main()
}

// https://buttondown.com/cassidoo/archive/you-only-get-one-life-so-you-might-as-well-feel/

// This week's question:
// An alternating array is a list of any length in which two (not necessarily different) values are alternating (all even-indexed items are equal, and all odd-indexed items are equal). Given an array, return true if it is alternating.

// Examples:

// []             -> True
// [1]            -> True
// [1,1]          -> True
// [1,2,1]        -> True
// [10,5,10,5,10] -> True
// [2,2,3,3]      -> False
// [5,4,3,5,4,3]  -> False

pub fn is_alternating_test(){
  assert is_alternating([]) == True
  assert is_alternating([1]) == True
  assert is_alternating([1,1]) == True
  assert is_alternating([1,2,1]) == True
  assert is_alternating([10,5,10,5,10]) == True
  assert is_alternating([2,2,3,3]) == False
  assert is_alternating([5,4,3,5,4,3]) == False
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  let name = "Joe"
  let greeting = "Hello, " <> name <> "!"

  assert greeting == "Hello, Joe!"
}
