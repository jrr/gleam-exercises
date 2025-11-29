import cassidoo_20251124_meal_prep.{
  Answer, Task, all_possible_schedules, max_meal_prep_tasks, ranges_collide,
  valid,
}
import gleam/list
import gleeunit
import gleeunit/should

pub fn main() -> Nil {
  gleeunit.main()
}

// https://buttondown.com/cassidoo/archive/a-dream-is-just-a-dream-a-goal-is-a-dream-with-a/
//
// Given an array of meal prep tasks for Thanksgiving, where each task is represented as [taskName, startTime, endTime], return the maximum number of non-overlapping tasks you can complete, along with the names of the chosen tasks in the order they were selected. Task times are inclusive of start but exclusive of end.
//
// Example:
//
// const tasks = [
//   ["Make Gravy", 10, 11],
//   ["Mash Potatoes", 11, 12],
//   ["Bake Rolls", 11, 13],
//   ["Prep Salad", 12, 13]
// ];
//
// maxMealPrepTasks(tasks)
// > {
//     count: 3,
//     chosen: ["Make Gravy", "Mash Potatoes", "Prep Salad"]
//   }

pub fn example_test() {
  [
    Task("Make Gravy", 10, 11),
    Task("Mash Potatoes", 11, 12),
    Task("Bake Rolls", 11, 13),
    Task("Prep Salad", 12, 13),
  ]
  |> max_meal_prep_tasks
  |> should.equal(
    Answer(count: 3, chosen: ["Make Gravy", "Mash Potatoes", "Prep Salad"]),
  )
}

pub fn simple_test() {
  [
    Task("Make Gravy", 10, 11),
  ]
  |> max_meal_prep_tasks
  |> should.equal(Answer(count: 1, chosen: ["Make Gravy"]))
}

pub fn avoid_long_task_test() {
  [
    Task("Long Task", 8, 12),
    Task("Short 1", 9, 10),
    Task("Short 2", 10, 11),
    Task("Short 3", 11, 12),
  ]
  |> max_meal_prep_tasks
  |> should.equal(Answer(count: 3, chosen: ["Short 1", "Short 2", "Short 3"]))
}

pub fn empty_test() {
  [] |> max_meal_prep_tasks |> should.equal(Answer(count: 0, chosen: []))
}

pub fn all_possible_schedules_test() {
  [Task("A", 1, 2), Task("B", 3, 4)]
  |> all_possible_schedules
  |> list.map(fn(a) { a |> list.map(fn(b) { b.name }) })
  |> should.equal([["A", "B"], ["A"], ["B"], []])
}

pub fn ranges_collide_test() {
  ranges_collide(#(0, 1), #(2, 3)) |> should.be_false
  ranges_collide(#(0, 1), #(1, 2)) |> should.be_false
  ranges_collide(#(0, 3), #(1, 4)) |> should.be_true
  ranges_collide(#(0, 5), #(2, 3)) |> should.be_true
}

pub fn valid_test() {
  [Task("A", 9, 11), Task("B", 10, 12)]
  |> valid
  |> should.be_false
}
