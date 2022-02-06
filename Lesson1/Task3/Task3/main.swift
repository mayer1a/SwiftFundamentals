//
//  main.swift
//  Task3
//
//  Created by Artem Mayer on 01.02.2022.
//

import Foundation

// Запрос и пользовательский ввод числа с последующим интерпретированием в Double
print("Введите сумму вклада числом:")
let deposAmount: Double = Double(readLine() ?? "0") ?? Double(0)

// Запрос и пользовательский ввод числа с последующим интерпретированием в Double
print("Введите годовой процент вклада числом:")
let annualPercent: Double = Double(readLine() ?? "0") ?? Double(0)

// Если произошла ошибка интерпретирования в Double или пользователь ввёл число < 0
//	то выходим
if deposAmount <= 0 || annualPercent <= 0 {
	print("Сумма вклада или годовой процента должны быть больше нуля!")
	exit(0)
}

// Переменная - накопитель: изначальная сумма вклада, к которой затем прибавится прибыль
var totalIncome: Double = deposAmount

// Вычисляем прибыль и итоговую сумму вклада через 5-ь лет
totalIncome += (deposAmount * annualPercent * 5) / 100

// Выводим результат
print("Сумма вклада (вклад + прибыль) через 5-ь лет составила \(totalIncome) рублей")
