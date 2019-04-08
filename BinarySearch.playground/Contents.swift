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

public extension RandomAccessCollection where Element: Comparable {
  func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
    let range = range ?? startIndex..<endIndex
    guard range.lowerBound < range.upperBound else {
      return nil
    }
    let size = distance(from: range.lowerBound, to: range.upperBound)
    let middle = index(range.lowerBound, offsetBy: size / 2)
    if self[middle] == value {
      return middle
    } else if self[middle] > value {
      return binarySearch(for: value, in: range.lowerBound..<middle)
    } else {
      return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
    }
  }
}

let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
let search31 = array.firstIndex(of: 31)
let binarySearch31 = array.binarySearch(for: 31)
print("index(of:): \(String(describing: binarySearch31))")
print("binarySearch(for:): \(String(describing: binarySearch31))")
