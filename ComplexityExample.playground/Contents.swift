import UIKit

//: # Complexity

//: ## Time Complexity

//: ### Constant time
//: O(1)

func checkFirst(names: [String]) {
  if let first = names.first {
    print(first)
  } else {
    print("no names")
  }
}

checkFirst(names: ["aaa", "bbb"])

//: ### Linear Time
//: O(n)
func printNames(names: [String]) {
  for name in names {
    print(name)
  }
}

printNames(names: ["aaa", "bbb"])

//: ### Quadratic time
//: O(n^2)

func printNames2(names: [String]) {
  for _ in names {
    for name in names {
      print(name)
    }
  }
}

printNames2(names: ["aaa", "bbb"])

//: ### Logarithmic time
//: O(log n)

let numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450]

func naiveContains(_ value: Int, in array: [Int]) -> Bool {
  for element in array {
    if element == value {
      return true
    }
  }
  return false
}

naiveContains(451, in: numbers)

func naiveContains2(_ value: Int, in array: [Int]) -> Bool {
  guard !array.isEmpty else { return false}
  let middleIndex = array.count / 2
  
  if value <= array[middleIndex] {
    for index in 0...middleIndex {
      if array[index] == value {
        return true
      }
    }
  } else {
    for index in middleIndex..<array.count {
      if array[index] == value {
        return true
      }
    }
  }
  return false
}

naiveContains2(451, in: numbers)

//: ### Quasilinear time
//: O(n log n)

//: ### Comparing time complexity

func sumFromOne(upto n: Int) -> Int {
  var result = 0
  for i in 1...n {
    result += i
  }
  return result
}

sumFromOne(upto: 10000)

func sumFromOne2(upto n: Int) -> Int {
  return (1...n).reduce(0, +)
}

sumFromOne2(upto: 10000)

// O(1)
func sumFromOne3(upto n: Int) -> Int {
  return (n + 1) * n / 2
}

sumFromOne3(upto: 10000)

//: ## Space complexity

func printSorted(_ array: [Int]) {
  let sorted = array.sorted()
  for element in sorted {
    print(element)
  }
}

printSorted(numbers)

func printSorted2(_ array: [Int]) {
  guard !array.isEmpty else { return }
  var currentCount = 0
  var minValue = Int.min
  
  for value in array {
    if value == minValue {
      print(value)
      currentCount += 1
    }
  }
  
  while currentCount < array.count {
    var currentValue = array.max()!
    
    for value in array {
      if value < currentValue && value > minValue {
        currentValue = value
      }
    }
    
    var printCount = 0
    for value in array {
      if value == currentValue {
        print(value)
        currentCount += 1
      }
    }
    minValue = currentValue
  }
}
