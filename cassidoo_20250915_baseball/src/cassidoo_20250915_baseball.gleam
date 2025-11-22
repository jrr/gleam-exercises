import gleam/io

pub fn main() -> Nil {
  io.println("Hello from cassidoo_20250915_baseball!")
}

pub type Winner {
  Home
  Away
  Tie
}

pub type GameDetails {
  GameDetails(
    home_total: Int,
    away_total: Int,
    home_led_innings: List(Int),
    away_led_innings: List(Int),
    winner: Winner,
  )
}

pub const empty_game = GameDetails(0, 0, [], [], Tie)

type InningRuns =
  #(Int, Int)

pub fn analyze_baseball_game(_innings: List(InningRuns)) -> GameDetails {
  empty_game
}
