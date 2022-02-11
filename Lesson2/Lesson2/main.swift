//
//  main.swift
//  Lesson2
//
//  Created by Artem Mayer on 09.02.2022.
//


// MARK: - Библиотеки

import Foundation


// MARK: - Задание #1. Определение чётности числа

/**
 Функция проверяет чётность числа

 - Returns:
 Логическое значение, чётное число или нет

 - Parameter inputNumber: Число для проверки на чётность

 */

func isEven(_ inputNumber: Int) -> Bool {
	return inputNumber % 2 == 0 ? true : false
}


// MARK: - Задание #2. Кратность числа трём

/**
 Функция проверяет кратность числа трём

 - Returns:
 Логическое значение, кратно число трём или нет

 - Parameter inputNumber : Число для проверки на кратность трём

 */

func isMultipleOfThree(_ inputNumber: Int) -> Bool {
	return inputNumber % 3 == 0 ? true : false
}


// MARK: - Задание #3. Возрастающий массив из 100 чисел

/**
 Функция  создаёт возрастающий массив целых чисел от 1 до N

 - Returns: Массив целых чисел

 - Parameter inputNumber : Число N - размерность массива

 */

func getIncreasingNumbers(numbersAmount: Int) -> [Int] {
	// Создаём пустой массив типа Int
	var numbers = [Int]()

	// Используя диапазон от 1 до N (размерность массива), заполним массив
	for iteration in 1...numbersAmount {
		numbers.append(iteration)
	}

	return numbers
}

// Создаем и инициализируем массив результатом выполнения функции
var increasingNumbers = getIncreasingNumbers(numbersAmount: 100)

print("--------------------------------------------")

// ОПЦИОНАЛЬНО: Печатаем массив пользователю в консоль
print("Возрастающий массив из \(increasingNumbers.count) чисел: \n\(increasingNumbers)")


// MARK: - Задание #4. Удалить из массива предыдущего урока все чётные числа и числа, не кратные трём

// Итератор для прохода по массиву
var iterator = 0

/*
 OFFTOP: Использую while и такой подход, так как он быстрее и эффективнее, чем использовать for
 c <array>.indexOf(at: <someIterator>) и, если использовать <array>.enumerated(), то при удалении цикл выходит
 за границы массива. Если это можно как-то решить, подскажи
 */

// Идём по массиву, пока не дойдем до конца
while iterator < increasingNumbers.count {
	if isEven(increasingNumbers[iterator]) || !isMultipleOfThree(increasingNumbers[iterator]) {
		increasingNumbers.remove(at: iterator)
	} else {
		iterator += 1
	}
}

print("--------------------------------------------")

// ОПЦИОНАЛЬНО: Печатаем измененный массив пользователю в консоль
print("Изменённый массив из \(increasingNumbers.count) нечётных чисел и кратных трём: \n\(increasingNumbers)")


// MARK: - Задание #5. Функция для добавления числа Фибоначчи

/**
 Функция  добавляет новое число Фибоначчи в массив

 - Important: Функция работает со ссылкой на массив.
 Если не указано количество новых элементов для добавления, по умолчанию будет добавлен один

 - Returns: Void

 - Parameter inputNumber : Ссылка на массив с числами Фибоначчи
 - Parameter amountNumbers: Количество новых элементов для добавления (необязательный параметр)
 */

func addFibonacciNumber(numbers fibonacciNumbers: inout [Int], amountNumbers: Int = 1) {

	// Добавим amountNumbers количество новых чисел Фибоначчи
	for number in 0..<amountNumbers {

		// Добавим в массив новый элемент - сумма последнего и предпоследнего элемента (чило Фибоначчи)
		fibonacciNumbers.append(fibonacciNumbers[number] + fibonacciNumbers[number + 1])
	}
}

// Создаёи и инициализируем массив начальной послоедовательностью Фибоначчи
var fibonacciNumbers = [1, 1]

// Вызываем функцию, в качестве аргумнтов: ссылка на массив (сквозной параметр) и количество новых элементов.
// Не создаем копии массива, тратим меньше памяти.
// Итоговый массив имеет размерность 2 (начальная последовательность) элемента + amountNumbers новых элементов
addFibonacciNumber(numbers: &fibonacciNumbers, amountNumbers: 50)

print("--------------------------------------------")

// ОПЦИОНАЛЬНО: Печатаем массив с числами Фибоначчи пользователю в консоль
print("Массив из \(fibonacciNumbers.count) чисел Фибоначчи: \n\(fibonacciNumbers)")


// MARK: - Задание #6. Заполнить массив из 100 элементов простыми числами

/**
 Функция  генерирует массив из ста простых  чисел

 - Important: Функция работает со ссылкой на массив.
 Если не указано количество новых элементов для добавления, по умолчанию будет добавлен один

 - Returns: Массив простых чисел
 */

func generatePrimeNumbers() -> [Int] {
	var primeNumbers = [Int]()
	var iterator = Int()

	// Генерируем массив из 542 натуральных чисел
	for iterator in 2...541 {
		primeNumbers.append(iterator)
	}

	// Основной цикл берет элемент из оставшихся в массиве
	for (index, number) in primeNumbers.enumerated() {

		iterator = index + 1

		// Внутренний цикл проходит по числам от числа внешнего цикла и сравнивает, находит совпадение - удаляет
		while iterator < primeNumbers.count {

			if primeNumbers[iterator] % number == 0 {
				primeNumbers.remove(at: iterator)
			} else {
				iterator += 1
			}

		}

	}

	return primeNumbers
}

// Создаём и инициализируем массив результатом функции генерирования 100 простых чисел
let primeNumbers = generatePrimeNumbers()

print("--------------------------------------------")

// ОПЦИОНАЛЬНО: Печатаем массив с числами Фибоначчи пользователю в консоль
print("Массив из \(primeNumbers.count) простых чисел: \n\(primeNumbers)")
