import cassidoo_20260126_flippedy.{flippedy}
import gleeunit
import gleeunit/should

pub fn main() -> Nil {
  gleeunit.main()
}

// https://buttondown.com/cassidoo/archive/happiness-is-a-choice-that-requires-effort-at/

// This week's question:
// You are given a string consisting of lowercase words, each separated by a single space. Determine how many vowels appear in the first word. Then, reverse each following word that has the same vowel count.

// Examples:

// flippedy("cat and mice")
// > "cat dna mice"

// flippedy("banana healthy")
// > "banana healthy"

// gleeunit test functions end in `_test`
pub fn example_1_test() {
  flippedy("cat and mice") |> should.equal("cat dna mice")
}

pub fn example_2_test() {
  flippedy("banana healthy") |> should.equal("banana healthy")
}
