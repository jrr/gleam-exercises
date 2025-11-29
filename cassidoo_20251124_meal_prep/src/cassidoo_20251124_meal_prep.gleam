import gleam/bool
import gleam/function
import gleam/int
import gleam/list
import gleam/option

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

fn tasks_collide(pair: #(Task, Task)) -> Bool {
  ranges_collide(#({ pair.0 }.start_time, { pair.0 }.end_time), #(
    { pair.1 }.start_time,
    { pair.1 }.end_time,
  ))
}

pub fn valid(tasks: Schedule) -> Bool {
  tasks
  |> list.combination_pairs
  |> list.map(tasks_collide)
  |> list.any(function.identity)
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
