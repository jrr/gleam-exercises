import gleam/bool
import gleam/int
import gleam/io
import gleam/list
import gleam/option

pub fn main() -> Nil {
  io.println("Hello from cassidoo_20251124_meal_prep!")
}

pub type Task {
  Task(name: String, start_time: Int, end_time: Int)
}

type Schedule =
  List(Task)

pub type Answer {
  Answer(count: Int, chosen: List(String))
}

pub fn all_possible_schedules(tasks: List(Task)) -> List(Schedule) {
  let how_many = list.length(tasks)
  let many_nones = list.repeat(option.None, how_many)

  tasks
  |> list.map(option.Some)
  |> list.append(many_nones)
  |> list.combinations(how_many)
  |> list.map(option.values)
  |> list.unique
}

pub fn ranges_collide(left: #(Int, Int), right: #(Int, Int)) -> Bool {
  case left.0, left.1, right.0, right.1 {
    a, _, x, y if x < a && a < y -> True
    _, b, x, y if x < b && b < y -> True
    a, b, x, _ if a < x && x < b -> True
    a, b, _, y if a < y && y < b -> True
    _, _, _, _ -> False
  }
}

fn tasks_collide(a: Task, b: Task) -> Bool {
  ranges_collide(#(a.start_time, a.end_time), #(b.start_time, b.end_time))
}

pub fn valid(tasks: Schedule) -> Bool {
  tasks
  |> list.combination_pairs
  |> list.map(fn(pair) { tasks_collide(pair.0, pair.1) })
  |> list.any(fn(x) { x })
  |> bool.negate
}

pub fn max_meal_prep_tasks(tasks: List(Task)) -> Answer {
  tasks
  |> all_possible_schedules
  |> list.filter(valid)
  |> list.max(fn(a, b) { int.compare(a |> list.length, b |> list.length) })
  |> fn(result) {
    case result {
      Ok(r) ->
        Answer(count: r |> list.length, chosen: r |> list.map(fn(s) { s.name }))
      Error(_) -> Answer(count: 0, chosen: [])
    }
  }
}
