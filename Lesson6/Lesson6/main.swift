//
//  main.swift
//  Lesson6
//
//  Created by Artem Mayer on 22.02.2022.
//

import Foundation


// MARK: Error

enum QueueError: Error {
    
    /// Пустая очередь
    case emtyQueue
}


// MARK: - Position

/// Выбрать позицию элемента для сабскрипта
enum Position {
    case first
    case last
}


// MARK: - Queue

struct Queue<T: Equatable> {
    
    // MARK: - Приватные свойства
    
    private var elements = [T]()
    
    
    // MARK: - Инициализатор
    
    init(_ elements: [T]) {
        self.elements = elements
    }
    
    
    // MARK: - Сабскрипты
    
    internal subscript(index: Int) -> T? {
        guard index < elements.count, index >= 0 else {
            return nil
        }
        
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
    
    // MARK: - Публичные методы
    
    /// Показать пустая ли очередь
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    /// Добавить элемент в конец очереди
    mutating func enqueue(_ element: T) {
        elements.insert(element, at: elements.startIndex)
    }
    
    /// Получить и удалить первый элемент из очереди
    mutating func dequeue() throws -> T {
        guard let lastElement = elements.popLast() else {
            throw QueueError.emtyQueue
        }
        
        return lastElement
    }
    
    /// Получить первый элемент в очереди (без удаления)
    func peek() throws -> T {
        guard let lastElement = elements.last else {
            throw QueueError.emtyQueue
        }
        
        return lastElement
    }
    
    /// Размер очереди
    func size() -> Int {
        return elements.count
    }
    
    
    // MARK: - Функции высшего порядка
    
    /// Получить новую очередь согласно принимаемой функции
    func evenFilter(_ includeElement: (T) -> Bool) -> [T] {
        var returnElements = [T]()
        
        for element in elements where includeElement(element) {
            returnElements.append(element)
        }
        
        return returnElements
    }
    
    /// Преобразовать значения согласно принимаемой функции
    func map(_ includeElement: (T) -> T) -> [T] {
        var returnElements = [T]()
        
        for element in elements {
            returnElements.append(includeElement(element))
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


// MARK: - Демонстрация работы с числами

var numberQueue = Queue([Int]())

for number in 0...20 {
    numberQueue.enqueue(number)
}

print("Очередь элементов до извлечения размером = \(numberQueue.size()): \(numberQueue)")
print("------------------------------------------------------------")

do {
    
    for elementIndex in 1...6 {
        try print("Шаг №\(elementIndex): Первый элемент в очереди до извлечения - \"\(numberQueue.dequeue())\".")
        try print("\t\tТеперь первый элемент в очереди - \"\(numberQueue.peek())\"")
    }
    
} catch QueueError.emtyQueue {
    print("Ошибка! Очередь пуста, нечего извлекать или просматривать.")
}

print("------------------------------------------------------------")
print("Очередь элементов после извлечения размером = \(numberQueue.size()): \(numberQueue)")

print("Обращение по сабскрипту:", terminator: " ")
print("первый элемент очереди = \(numberQueue[Position.first]),", terminator: " ")
print("последний элемент очереди = \(numberQueue[Position.last]).")

let evenQueue = numberQueue.evenFilter( { $0 % 2 == 0 } )

print("Очередь кратная 2 размером = \(evenQueue.count): \(evenQueue)")

let multipleNineQueue = numberQueue.evenFilter( { $0 % 9 == 0 } )

print("Очередь, кратная 9, размером = \(multipleNineQueue.count): \(multipleNineQueue)")
print("------------------------------------------------------------\n")


// MARK: - Демонстрация работы со строками

var flavorsQueue = Queue([String]())

let flavors = ["Melon", "Banana", "Cherry", "Watermelon", "Apple", "Pineapple", "Peach", "Pear"]

for flavor in flavors {
    flavorsQueue.enqueue(flavor)
}

print("Очередь элементов до извлечения размером = \(flavorsQueue.size()): \(flavorsQueue)")
print("------------------------------------------------------------")

do {
    
    for elementIndex in 1...4 {
        try print("Шаг №\(elementIndex): Первый элемент в очереди до извлечения - \"\(flavorsQueue.dequeue())\".")
        try print("\t\tТеперь первый элемент в очереди - \"\(flavorsQueue.peek())\"")
    }
    
} catch QueueError.emtyQueue {
    print("Ошибка! Очередь пуста, нечего извлекать или просматривать.")
}

print("------------------------------------------------------------")
print("Очередь элементов после извлечения размером = \(flavorsQueue.size()): \(flavorsQueue)")

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
