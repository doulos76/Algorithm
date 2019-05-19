# Linked List

A linked list is a collection of values arranged in a linear unidirectional sequence. A linked list has several theoretical advantages over contiguous storage options such as the Swift array:

![](/image/linkedlist.png)

* linked list is a chain of __nodes__.

	1. hold a value
	2. hold a referenct to the next node. if nil ==> end of the list.


![](/image/linkedlist_node.png)

## Node

```Swift
import Foundation

public class Node<Value> {
  public var value: Value
  public var next: Node?
  
  public init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}

extension Node: CustomStringConvertible {
  
  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}
```

## LinkedList

```SWift
public struct LinkedList<Value> {
  public var head: Node<Value>?
  public var tail: Node<Value>?
  
  public init() {}
  
  public var isEmpty: Bool {
    return head == nil
  }  
}

extension LinkedList: CustomStringConvertible {  
  public var description: String {
    guard let head = head else { return "Empty list" }
    return String(describing: head)
  }
}

```

## Adding values to the list

1. __push__ : Adds a value at the front of the list
2. __append__ : Adds a value at the end of the list
3. __insert(after:)__ : Adds a value after a particular node of the list

### push operations

* head-first insertion

#### method

```Swift
public mutating func push(_ value: Value) {
	head = Node(value: value, next: head)
	if tail == nil {
		tail = head
	}
}
```

#### test

```Swift
example(of: "push") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)

  print(list)
}
```

#### result 

```
---Example of push---
1 -> 2 -> 3  
```

### append operations

* tail-end insertion

#### method

```Swift
public mutating func append(_ value: Value) {
	guard !isEmpth else {
		push(value)
		return
	}
	
	tail!.next = Node(value: value)
	tail = tail!.next
}
```

#### test

```Swift
example(of: "append") {
  var list = LinkedList<Int>()
  list.append(1)
  list.append(2)
  list.append(3)
  
  print(list)
}
```

#### result 

```
---Example of append---
1 -> 2 -> 3 
```

### insert(after:)operations

#### method

```Swift
public func node(at index: Int) -> Node<Value>? {
	var currentNode = head
	var currentIndex = 0
	
	while currentNode != nil && currentIndex < index {
		currentNode = currentNode!.next
		currentIndex += 1
	}
	return currentNode
}
```

```Swift
@discardableResult
  public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
    guard tail !== node else {
      append(value)
      return tail!
    }
    node.next = Node(value: value, next: node.next)
    return node.next!
  }
```


#### test

```Swift
example(of: "inserting at a particular index") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  print("Before inserting: \(list)")
  var middleNode = list.node(at: 1)!
  for _ in 1...4 {
    middleNode = list.insert(-1, after: middleNode)
  }
  print("After inserting: \(list)")
}
```


#### result

```Swift
---Example of inserting at a particular index---
Before inserting: 1 -> 2 -> 3  
After inserting: 1 -> 2 -> -1 -> -1 -> -1 -> -1 -> 3  
```
### Performance analysis

|    |push|append|insert(after:)|node(at:)|
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| __Behaviour__ |insert at head|insert at tail|insert after a node|returns a node at given index|
| __Time complexity__ |O(1)|O(1)|O(1)|O(i), where i is the given index|

## Removing values from the list

1. __pop__ : Removes the value at the front of the list
2. __removeLast__ : Removes the value at the end of the list
3. __remove(at:)__ : Removes a value anywhere in the list

