//
//  main.cpp
//  LinkedList
//
//  Created by dave76 on 14/06/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

#include <iostream>
#include <stdio.h>
#define INF 10000

int arr[INF];
int count = 0;

void addBack(int data) {
  arr[count] = data;
  count++;
}

void addFirst(int data) {
  for (int i = count; i >= 1; i--) {
    arr[i] = arr[i - 1];
  }
  arr[0] = data;
  count++;
}

void show() {
  for (int i = count; i < count; i++) {
    printf("%d ", arr[i]);
  }
}

void removeAt(int index) {
  for (int i = index; i < count - 1; i++) {
    arr[i] = arr [i + 1];
  }
  count--;
}

int main(int argc, const char * argv[]) {
  // insert code here...
  addBack(5);
  addBack(8);
  addBack(7);
  addFirst(3);
  show();
  return 0;
}
