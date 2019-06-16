# Stack

The __Stack__ data structure is identical, in concept, to a physical stack of objects. When you add an item to to a stack, you place it on top of the stack. When you remove an item from a stack, you always remove the top-most item.

Complexity : _O(1)_

## Stack Operations

* push : Adding an element to the top of the stack
* pop : Removing the top element of the stack.

* example : Navigation stack, Memory allocation, Sear h and conquer algorithms.

## Implementation

* LIFO(Last In First Out)

```Swift
import UIKit

struct Stack<Element> {
  private var storage: [Element] = []
  
  init() {}
  
  mutating func push(_ element: Element) {
    storage.append(element)
  }
  
  @discardableResult
  mutating func pop() -> Element? {
    return storage.popLast()
  }
}

extension Stack: CustomStringConvertible {
  var description: String {
    let topDivider = "------top------\n"
    let bottomDivider = "\n----------"
    
    let stackElements = storage.map { "\($0)" }.reversed().joined(separator: "\n")
    return topDivider + stackElements + bottomDivider
  }
}
```

* Example

```Swift
var stack = Stack<Int>()
stack.push(20)
stack.push(10)
stack.push(3)
stack.push(99)
print("before popping")
print(stack)
print("after popping")
stack.pop()
print(stack)

```