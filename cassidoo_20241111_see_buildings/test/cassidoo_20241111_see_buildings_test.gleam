import cassidoo_20241111_see_buildings.{see_buildings_left}
import gleeunit
import gleeunit/should

pub fn main() -> Nil {
  gleeunit.main()
}

// https://buttondown.com/cassidoo/archive/stand-for-something-or-you-will-fall-for-anything/
//
// Given a list of integers representing the heights of buildings, return the maximum number of buildings that can be seen when looking from the left. A building can see another building if it is taller than all the buildings to its left. The height of the tallest building is included in the count.
//
// Examples:
//
// seeBuildingsLeft([1,2,3,4,5])
// 5
//
// seeBuildingsLeft([5,4,3,2,1])
// 1
//
// seeBuildingsLeft([3,7,8,3,6,1])
// 3

pub fn example_1_test() {
  see_buildings_left([1, 2, 3, 4, 5]) |> should.equal(5)
}

pub fn example_2_test() {
  see_buildings_left([5, 4, 3, 2, 1]) |> should.equal(1)
}

pub fn example_3_test() {
  see_buildings_left([3, 7, 8, 3, 6, 1]) |> should.equal(3)
}
