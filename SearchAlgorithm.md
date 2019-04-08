# Search Algorithm

* 원하는 데이터를 앚아내는 알고리즘
* 검색 엔진도 탐색 알고리즘을 사용함

## 순차 검색 알고리즘
* Sequential search algorithm
* Linear Search Algorithm
* List에서 특정한 값을 찾는 algorithm
* List에서 찾고자 하는 값을 맨 앞부터 끝까지 차례대로 찾아 나감
* 단점 : 검색할 리스트의 길이가 길면 비효율적
* 장점 : 검색 방법 중 가장 단순하여 구현이 쉽고 정렬되지 않은 리스트에서도 사용할 수 있음

### Psudo Code Example

배열에서 특정 index에 원하는 숫자를 찾는 알고리즘

```
* 정수형 : array[5] = { 4, 2, 3, 5, 1 }
* 정수형 : i
. i <- 0
#
| ^
| | array[i] = 5
| | . 'i번째의 요소가 일치'라고 출력한 후 종료
| |-------------
| | . i <- i + 1
| V
# i < 5
. '찾지 못했습니다.'라고 출력한 후 종료
```

### Code

#### Swift

[Source Code](LinearSearch.playground)

```swift
func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int? {
  for (index, obj) in array.enumerated() where obj == object {
    return index
  }
  return nil
}

let array = [5, 2, 4, 7]
linearSearch(array, 2)
// This will return 1
```
#### Python
```Python
def sequentialSearch(arry, value):
	for i in range(len(array)):
		if array[i] == value:
			return i
	return False
```
#### C
```C
int sequentialSearch(int array[], int n, int m, int value
{
	int i;
	for(i = n; i < m; i++)
		if(array[i] == value)
			return i;
	return  -1;
}
```
