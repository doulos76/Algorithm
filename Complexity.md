# Complexity

## Time complexity

* __Time complexity__ is a measure of the time requrired to run an algorithm as the input size increases.

### Constant time

* __Bit O notation__ : _O(1)_

A constant time algorithm is one that has the same running time regardless of the size fo the input.

```Swift
func checkFirst(names: [String]) {
  if let first = names.first {
    print(first)
  } else {
    print("no names")
  }
}
```

The size fo the `names` array has no effect on the running time of this function.

![](/image/constant_time_graph.png)

### Linear Time

* __Bit O notation__ : _O(n)_

```Swift
func printNames(names: [String]) {
  for name in names {
    print(name)
  }
}
```

This function prints out all the names in a `String` array. As the input array increases in size, the number of iterations that the `for` loop makes is increased by the same amount.

This behavior is known as `linear time` complexity

![](/image/linear_time_graph.png)


### Quadratic Time

* __Bit O notation__ : _O(n^2)_

```Swift
func printNames2(names: [String]) {
  for _ in names {
    for name in names {
      print(name)
    }
  }
}
```

More commonly referred to as _n squared_, this time compleixity refers to an algorithm that takes time proportional to the square of the input size.

![](/image/quadratic_time_graph.png)

### Logarithmic Time

* __Bit O notation__ : _O(log n)_

```Swift
let numbers = [1 ,3 ,56, 66, 68, 80, 99, 105, 450]

func naiveContains(_ value: Int, in array: [Int]) -> Bool {
  for element in array {
    if element == value {
      return true
    }
  }
  return false
}
```

```Swift
func naiveContains2(_ value: Int, in array: [Int]) -> Bool {
  guard !array.isEmpty else { return false }
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
```

![](/image/logarithmic_time_graph.png)

### Quasilinear time

The quasilinear time complexity shares a similar curve with quadratic time, but is more resilient to large data sets.

![](/image/quasilinear_time_graph.png)

## Space complexity

Space complexity is a measure of the resources required for the algorithm to run. For computers, the resources for a algorithms is memory.

```Swift
func printSorted(_ array: [Int]) {
  let sorted = array.sorted()
  for element in sorted {
    print(element)
  }
}
```

```Swift
func printSorted2(_ array: [Int]) {
  // 1
  guard !array.isEmpty else { return }
  
  // 2
  var currentCount = 0
  var minValue = Int.min
  
  // 3
  for value in array {
    if value == minValue {
      print(value)
      currentCount += 1
    }
  }
  
  while currentCount < array.count {
    // 4
    var currentValue = array.max()!
    
    for value in array {
      if value < currentValue && value > minValue {
        currentValue = value
      }
    }
    
    // 5
    var printCount = 0
    for value in array {
      if value == currentValue {
        print(value)
        currentCount += 1
      }
    }
    
    // 6
    minValue = currentValue
  }
}
```

