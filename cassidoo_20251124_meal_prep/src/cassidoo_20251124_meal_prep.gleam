import gleam/io

pub fn main() -> Nil {
  io.println("Hello from cassidoo_20251124_meal_prep!")
}

pub type Task {
  Task(name: String, start_time: Int, end_time: Int)
}

pub type Answer {
  Answer(count: Int, chosen: List(String))
}

pub fn max_meal_prep_tasks(_tasks: List(Task)) -> Answer {
  Answer(count: 0, chosen: [])
}
