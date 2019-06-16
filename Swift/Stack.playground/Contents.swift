//: # Stack
//: LIFO (Last in first out)

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
