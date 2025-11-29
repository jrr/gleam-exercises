import cassidoo_20251124_meal_prep.{Answer, Task, max_meal_prep_tasks}
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

// gleeunit test functions end in `_test`
pub fn example_test() {
  let tasks = [
    Task("Make Gravy", 10, 11),
    Task("Mash Potatoes", 11, 12),
    Task("Bake Rolls", 11, 13),
    Task("Prep Salad", 12, 13),
  ]

  let result = max_meal_prep_tasks(tasks)
  result
  |> should.equal(
    Answer(count: 3, chosen: [
      "Make Gravy",
      "Mash Potatoes",
      "Prep Salad",
    ]),
  )
}
