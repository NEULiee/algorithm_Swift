//
//  main.swift
//  Heap
//
//  Created by neuli on 2022/12/23.
//  https://github.com/kodecocodes/swift-algorithm-club/tree/master/Heap
//

/**
 힙은 배열로 바이너리 트리를 구현하는 것이다.
 최대 힙, 최소 힙 두 가지 종류가 있다.
 최대 힙에서 상위 노드는 하위 노드보다 더 큰 값을 갖는다.
 
 ** 힙이 일반 트리와 다른 점? **
 - 노드의 순서
 binary search tree 에서 왼쪽 자식은 부모보다 작아야 하고 오른쪽 자식은 커야한다.
 하지만 최대 힙에서는 두 자식이 모두 부모보다 작아야한다.
 
 - 메모리
 트리는 저장하는 데이터보다 더 많은 메모리를 차지한다.
 왼쪽, 오른쪽 자식 노드에 대한 포인터 메모리를 추가로 할당해야하기 때문ㅇ
 
 - 균형
 binary search tree는 대부분의 작업이 O(log n) 성능을 갖도록 균형을 맞춰야한다.
 그래서 AVL 트리 또는 레드-블랙 트리와 같은 것을 사용한다.
 힙을 사용하면 실제로 전체 트리를 정렬할 필요가 없고 구조화된 방식 때문에 힙은 O(log n)의 성능을 보장한다.
 
 - 탐색
 binary tree에서는 탐색이 빠르지만 힙은 탐색이 느리다.
 힙의 가장 큰 목적은 가장 큰 값과 작은 값을 빠르게 찾고 상대적으로 삽입과 삭제를 빠르게 하는 것이므로
 탐색을 위한 알고리즘은 아니다.
 */

import Foundation

public struct Heap<T> {
    
    var nodes: [T] = []
    
    private var orderCriteria: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    // 검색
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
    }
    
    internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    internal func leftChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 1
    }
    
    internal func rightChildIndex(ofIndex i: Int) -> Int {
        return 2 * (i + 1)
    }
    
    public func peek() -> T? {
        return nodes.first
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    public mutating func insert<S: Sequence>(_ sequences: S) where S.Iterator.Element == T {
        for value in sequences {
            insert(value)
        }
    }
    
    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else { return }
        remove(at: i)
        insert(value)
    }
    
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size) // 오ㅐ?
            shiftUp(index)
        }
        return nodes.removeLast()
    }
    
    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = parentIndex(ofIndex: childIndex)
        
        while 0 < childIndex && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        nodes[childIndex] = child
    }
    
    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    internal mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}

extension Heap where T: Equatable {
    
    /** Get the index of a node in the heap. Performance: O(n). */
    public func index(of node: T) -> Int? {
        return nodes.firstIndex { $0 == node }
    }
    
    /** Removes the first occurrence of a node from the heap. Performance: O(n). */
    @discardableResult public mutating func remove(node: T) -> T? {
        if let index = index(of: node) {
            return remove(at: index)
        }
        return nil
    }
    
}
