//
//  main.swift
//  Lesson6
//
//  Created by Artem Mayer on 22.02.2022.
//

import Foundation


// MARK: Error

enum QueueError: Error {
    
    /// Empty queue
    case errorEmtyQueue
}


// MARK: - Position

/// Select element position for subscript
enum Position {
    case first
    case last
}


// MARK: - Queue

struct Queue<T: Equatable> {
    
    // MARK: - Private property
    
    private var elements = [T]()
    

    // MARK: - Public computed property

    /// Queue size
    var size: Int {
        return elements.count
    }

    /// Is the queue empty
    var isEmpty: Bool {
        return elements.isEmpty
    }


    // MARK: - Init
    
    init(_ elements: [T]) {
        self.elements = elements
    }
    
    
    // MARK: - Subscripts
    
    internal subscript(index: Int) -> T? {
        guard index < elements.count, index >= 0 else { return nil }
        
        return elements[elements.count - index - 1]
    }
    
    internal subscript(position: Position) -> T {
        switch position {
        case .first:
            return elements[elements.count - 1]
        case .last:
            return elements[0]
        }
    }


    // MARK: - Public methods
    
    /// Add an element to the end of the queue
    mutating func enqueue(_ element: T) {
        elements.insert(element, at: elements.startIndex)
    }
    
    /// Get and remove the first element from the queue
    mutating func dequeue() throws -> T {
        guard let lastElement = elements.popLast() else { throw QueueError.errorEmtyQueue }
        
        return lastElement
    }
    
    /// Get the first element in the queue (no removal)
    func peek() throws -> T {
        guard let lastElement = elements.last else { throw QueueError.errorEmtyQueue }
        
        return lastElement
    }
    
    
    // MARK: - Hiegher order functions
    
    /// Get a new queue according to the received function
    func evenFilter(_ includeElement: (T) -> Bool) -> [T] {
        var returnElements = [T]()
        
        for element in elements where includeElement(element) {
            returnElements.append(element)
        }
        
        return returnElements
    }
    
    /// Convert values according to the received function
    func map(_ includeElement: (T) -> T) -> [T] {
        var returnElements = [T]()

        elements.forEach {
            returnElements.append(includeElement($0))
        }
        
        return returnElements
    }
    
}


// MARK: - CustomStringConvertible

extension Queue: CustomStringConvertible {
    var description: String {
        return "\(elements)"
    }
}


// MARK: - Demonstration of working with numbers

var numberQueue = Queue([Int]())

for number in 0...20 {
    numberQueue.enqueue(number)
}

print("Очередь элементов до извлечения размером = \(numberQueue.size): \(numberQueue)")
print("------------------------------------------------------------")

do {
    
    for elementIndex in 1...6 {
        try print("Шаг №\(elementIndex): Первый элемент в очереди до извлечения - \"\(numberQueue.dequeue())\".")
        try print("\t\tТеперь первый элемент в очереди - \"\(numberQueue.peek())\"")
    }
    
} catch QueueError.errorEmtyQueue {
    print("Ошибка! Очередь пуста, нечего извлекать или просматривать.")
}

print("------------------------------------------------------------")
print("Очередь элементов после извлечения размером = \(numberQueue.size): \(numberQueue)")

print("Обращение по сабскрипту:", terminator: " ")
print("первый элемент очереди = \(numberQueue[Position.first]),", terminator: " ")
print("последний элемент очереди = \(numberQueue[Position.last]).")

let evenQueue = numberQueue.evenFilter( { $0 % 2 == 0 } )

print("Очередь кратная 2 размером = \(evenQueue.count): \(evenQueue)")

let multipleNineQueue = numberQueue.evenFilter( { $0 % 9 == 0 } )

print("Очередь, кратная 9, размером = \(multipleNineQueue.count): \(multipleNineQueue)")
print("------------------------------------------------------------\n")


// MARK: - Demonstration of working with strings

var flavorsQueue = Queue([String]())

let flavors = ["Melon", "Banana", "Cherry", "Watermelon", "Apple", "Pineapple", "Peach", "Pear"]

for flavor in flavors {
    flavorsQueue.enqueue(flavor)
}

print("Очередь элементов до извлечения размером = \(flavorsQueue.size): \(flavorsQueue)")
print("------------------------------------------------------------")

do {
    
    for elementIndex in 1...4 {
        try print("Шаг №\(elementIndex): Первый элемент в очереди до извлечения - \"\(flavorsQueue.dequeue())\".")
        try print("\t\tТеперь первый элемент в очереди - \"\(flavorsQueue.peek())\"")
    }
    
} catch QueueError.errorEmtyQueue {
    print("Ошибка! Очередь пуста, нечего извлекать или просматривать.")
}

print("------------------------------------------------------------")
print("Очередь элементов после извлечения размером = \(flavorsQueue.size): \(flavorsQueue)")

print("Обращение по сабскрипту:", terminator: " ")
print("первый элемент очереди = \(flavorsQueue[Position.first]),", terminator: " ")
print("последний элемент очереди = \(flavorsQueue[Position.last]).")

let makeLowercase = { (flavor: String) -> String in
    return flavor.lowercased()
}

let lowercaseQueue = flavorsQueue.map(makeLowercase)

print("Очередь строчных элементов размером = \(lowercaseQueue.count): \(lowercaseQueue)")

let startsWithPFlavors = flavorsQueue
    .map { $0.lowercased().starts(with: ["p"]) ? $0 : "" }
    .filter( { $0 != "" } )

print("Очередь элементов, начинающихся с буквы \"P\" размером = \(startsWithPFlavors.count): \(startsWithPFlavors)")
print("------------------------------------------------------------")

print("Элемент №2: \(flavorsQueue[1] ?? "Ошибка! Выход за границы очереди")")

