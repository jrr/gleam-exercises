import gleam/io
import gleam/list

pub fn main() -> Nil {
  io.println("Hello world!")
}

pub type State {
  State(num_seen: Int, largest_seen: Int)
}

pub fn see_buildings_left(building_heights: List(Int)) -> Int {
  list.fold(building_heights, State(0, 0), fn(state, building_height) {
    case building_height, state {
      height, state if height > state.largest_seen ->
        State(num_seen: state.num_seen + 1, largest_seen: height)
      _, state -> state
    }
  }).num_seen
}
