//: # Linked List
import UIKit

// LinkedList
struct LinkedList<Value> {
  var head: Node<Value>?
  var tail: Node<Value>?
  var isEmpty: Bool {
    return head == nil
  }
  
  // push
  mutating func push(_ value: Value) {
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
  
  // append
  mutating func append(_ value: Value) {
    guard !isEmpty else {
      push(value)
      return
    }
    
    let node = Node(value: value)
    tail?.next = node
    tail = node
  }
  
  // Insert
  func node(at index: Int) -> Node<Value>? {
    var currentIndex = 0
    var currentNode = head
    
    while(currentNode != nil && currentIndex < index) {
      currentNode = currentNode?.next
      currentIndex += 1
    }
    return currentNode
  }
  
  func insert(_ value: Value, after node: Node<Value>) {
    node.next = Node(value: value, next: node.next)
  }
  
  // Pop
  mutating func pop() -> Value? {
    defer {
      head = head?.next
      if isEmpty {
        tail = nil
      }
    }
    return head?.value
  }
  
  // Removew Last
  mutating func removeLast() -> Value? {
    guard let head = head else {
      return nil
    }
    guard head.next != nil else {
      return pop()
    }
    var prev = head
    var current = head
    
    while let next = current.next {
      prev = current
      current = next
    }
    prev.next = nil
    tail = prev
    return current.value
  }
  
  // Remove After
  mutating func remove(after node: Node<Value>) -> Value? {
    defer {
      if node.next === tail {
        tail = node
      }
      // 10 -> 3
      node.next = node.next?.next
    }
    return node.next?.value
  }
  
  // Initializer
  init() { }
}

extension LinkedList: CustomStringConvertible {
  var description: String {
    guard let head = head else {
      return "Empty List"
    }
    return String(describing: head)
  }
}

// Node
class Node<Value> {
  var value: Value
  var next: Node?
  
  init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}

extension Node: CustomStringConvertible {
  var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}

//let node1 = Node(value: 1)
//let node2 = Node(value: 2)
//let node3 = Node(value: 3)
//
//node1.next = node2
//node2.next = node3
//
//print(node1)

var list = LinkedList<Int>()

//: ## Push Operation

list.push(2)
list.push(3)
list.push(22)

print(list)

//: ## Append Operation

list.append(10)
list.append(3)
list.append(12)

print(list)

//: ## Insert Operation

let middleNode = list.node(at: 1)!
list.insert(999, after: middleNode)
print(list)

//: ## Pop Operation

print("\n================[Before popping list]================\n")
print(list)
print("\n================[After popping list]================\n")
list.pop()
print(list)
list.pop()
print(list)

//: ## Remove Last
print("\n================[Before removing last]================\n")
print(list)

print("\n================[After removing last]================\n")
list.removeLast()
print(list)

//: ## Remove After

print("\n================[Before removing]================\n")
print(list)

let index = 1
let node = list.node(at: index - 1)!
let removedValue = list.remove(after: node)

print("\n================[After removing]================\n")
print(list)
