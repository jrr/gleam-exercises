import cassidoo_20250915_baseball as subject
import gleeunit
import gleeunit/should

pub fn main() -> Nil {
  gleeunit.main()
}

// https://buttondown.com/cassidoo/archive/there-is-nothing-more-truly-artistic-than-to-love/
//
// This week's question:
// You are given an array of arrays, where each inner array represents the runs scored by each team in an inning of a baseball game: [[home1, away1], [home2, away2], ...]. Write a function that returns an object with the total runs for each team, which innings each team led, and who won the game.
//
// Example:
//
// const innings = [[1, 0], [2, 2], [0, 3], [4, 1]];
//
// > analyzeBaseballGame(innings)
// > {
//     homeTotal: 7,
//     awayTotal: 6,
//     homeLedInnings: [1, 2, 4],
//     awayLedInnings: [3],
//     winner: "home"
//   }

pub fn empty_game_test() {
  subject.analyze_baseball_game([])
  |> should.equal(subject.empty_game)
}

pub fn example_test() {
  subject.analyze_baseball_game([
    #(1, 0),
    #(2, 2),
    #(0, 3),
    #(4, 1),
  ])
  |> should.equal(subject.GameDetails(7, 6, [1, 2, 4], [3], subject.Home))
}
