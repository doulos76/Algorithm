# Binary Search

# Point

* Binary Search는 데이터를 찾는 탐색 알고리즘
* Binary Search의 대상은 미리 오름차순이나 내림차순으로 정렬되어 있는 데이터
* 탐색하는 범위를 절반씩 추려 나가면서 탐색함
* Complexity : log n

## Algorithm

* 크게 3가지 처리
 1. 가운데 요소를 선택하는 처리
 2. 가운데 데이터와 원하는 데이터를 비교하는 처리
 3. 탐색 범위를 절반으로 좁히는 처리
* 목적 데이터가 존재하지 않을 경우의 처리도 빠짐없이 작성함


[Source Code](BinarySearch.playground)

```Swift
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

let myItem = binarySearch(list: myList, item: 3)  ==> 1
let myItem2 = binarySearch(list: myList, item: 5) ==> 2
let myItem3 = binarySearch(list: myList, item: 1) ==> 0
```

```Swift
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
//---> index(of:): Optional(7)
print("binarySearch(for:): \(String(describing: binarySearch31))")
//---> binarySearch(for:): Optional(7)
```

## Key Points

* Binary search is only a valid algorithm on __sorted__ collections
* Sometimes, it may be beneficial to sort a collection just to leverage the binary search capability for looking up elements.
* Ther `sort` method provided to arrays uses linear search, which has a _O(n)_ time complexity. Binary search has a _O(log n)_ time complexity, which scales much better for large data sets.


