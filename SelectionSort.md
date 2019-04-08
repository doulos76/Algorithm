# Selection Sort

* 데이터를 정렬하는 정렬 알고리즘
* 가장 작은 데이터를 선택하여 맨 앞부터 순서대로 정렬함

## 단순 선택법 알고리즘
* 오름차순으로 정렬하는 단순 선택법의 두 가지 절차
	1. 탐색 범위의 최솟값을 찾는 처리
	2. 탐색 범위의 최솟값을 맨 앞 요소와 교환하는 처리

[Source Code](SelectionSort.playground)

```Swift
/ Finds the smallest value in an array
func findSmallestIndex <T: Comparable> (_ arr: [T]) -> Int {
  // Stores the smallest value
  var smallest = arr[0]
  // We don't need any calculation if the array length is 1
  if arr.count == 1 {
    return 0
  }
  // Stores the index of the smallest value
  var smallestIndex = 0
  for i in 1...arr.count-1 {
    if arr[i] < smallest {
      smallest = arr[i]
      smallestIndex = i
    }
  }
  return smallestIndex
}

// Sort array
func selectionSort <T: Comparable> (arr: [T]) -> [T] {
  var newArr: [T] = []
  // We have to make mutableArray reference copy of original array, because Swift 3 doesn't allow to get var parameter
  var mutableArr = arr
  for _ in 0...mutableArr.count-1 {
    //Finds the smallest element in the array and adds it to the new array
    let smallestIndex = findSmallestIndex(mutableArr)
    newArr.append(mutableArr[smallestIndex])
    mutableArr.remove(at: smallestIndex)
  }
  return newArr
}

print(selectionSort(arr: [5, 3, 6, 2, 10]))
//---> [2, 3, 5, 6, 10]
```

```Swift

public func selectionSort<Element>(_ array: inout [Element])
  where Element: Comparable {
    guard array.count >= 2 else {
      return
    }
    // 1
    for current in 0..<(array.count - 1) {
      var lowest = current
      // 2
      for other in (current + 1)..<array.count {
        if array[lowest] > array[other] {
          lowest = other
        }
      }
      // 3
      if lowest != current {
        array.swapAt(lowest, current)
      }
    }
}


var array = [9, 4, 10, 3]
print("Original: \(array)")
//---> Original: [9, 4, 10, 3]
selectionSort(&array)
print("Selection sorted: \(array)")
//---> Selection sorted: [3, 4, 9, 10]
```

