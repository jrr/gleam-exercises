import gleam/int
import gleam/io
import gleam/list

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

pub fn analyze_baseball_game(innings: List(InningRuns)) -> GameDetails {
  innings
  |> list.index_fold(empty_game, fn(game, inning, index) {
    let inning_number = index + 1
    let home_total = game.home_total + inning.0
    let away_total = game.away_total + inning.1

    let #(home_led_innings, away_led_innings) = case home_total, away_total {
      h, a if h > a -> #(
        [inning_number, ..game.home_led_innings],
        game.away_led_innings,
      )
      h, a if h < a -> #(game.home_led_innings, [
        inning_number,
        ..game.away_led_innings
      ])
      _, _ -> #(game.home_led_innings, game.away_led_innings)
    }

    let winner = case home_total, away_total {
      home, away if home > away -> Home
      home, away if home < away -> Away
      _, _ -> Tie
    }
    GameDetails(
      home_total: home_total,
      away_total: away_total,
      home_led_innings: home_led_innings |> list.sort(by: int.compare),
      away_led_innings: away_led_innings |> list.sort(by: int.compare),
      winner: winner,
    )
  })
}
