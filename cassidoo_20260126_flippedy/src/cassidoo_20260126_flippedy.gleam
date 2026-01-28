import gleam/list
import gleam/string

const vowels = ["a", "e", "i", "o", "u"]

pub fn count_vowels(word: String) -> Int {
  word
  |> string.to_graphemes()
  |> list.count(fn(char) { list.contains(vowels, char) })
}

pub fn flippedy(input: String) -> String {
  input
  |> string.split(" ")
  |> list.map(fn(word) { #(word, count_vowels(word)) })
  |> fn(words_with_counts) {
    let assert [head, ..tail] = words_with_counts

    tail
    |> list.map(fn(tup) {
      case tup {
        #(word, count) if count == head.1 -> word |> string.reverse()
        #(word, _) -> word
      }
    })
    |> list.prepend(head.0)
    |> string.join(" ")
  }
}
