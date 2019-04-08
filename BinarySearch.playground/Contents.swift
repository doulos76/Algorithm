import UIKit

func binarySearch(list: [Int], item: Int) -> Int {
  var low = 0
  var high = list.count - 1
  
  while low <= high {
    let mid = (low + high) / 2
    let guess = list[mid]
    
    if guess == item {
      return mid
    } else if guess > item {
      high = mid - 1
    } else {
      low = mid + 1
    }
  }
  return -1
}

let myList = [1, 3, 5, 7, 9, 34, 23, 77, 56, 42]

let myItem = binarySearch(list: myList, item: 3)
let myItem2 = binarySearch(list: myList, item: 5)
let myItem3 = binarySearch(list: myList, item: 1)

