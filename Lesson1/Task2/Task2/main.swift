//
//  main.swift
//  Task2
//
//  Created by Artem Mayer on 01.02.2022.
//

import Foundation

// Создаём и инициализируем переменные катетов прямоугольного треугольника
let aLeg: Double = 12
let bLeg: Double = 10

// Вычисляем площадь прямоугольного треугольника
let square: Double = (aLeg * bLeg) / 2

// Вычисляем периметр прямоугольного треугольника
let perimeter: Double = sqrt(pow(aLeg, 2.0) + pow(bLeg, 2.0)) + aLeg + bLeg

// Вычисляем гипотенузу прямоугольного треугольника
let hypotenuse: Double = sqrt(pow(aLeg, 2.0) + pow(bLeg, 2.0))

// Выводим результат
print(String(format: "У прямоугольного треугольника с катетами a = %.3f и b = %.3f \n"
			 + "Площадь = %.3f\nПериметр = %.3f\nГипотенуза = %.3f",
			 aLeg, bLeg, square, perimeter, hypotenuse))
