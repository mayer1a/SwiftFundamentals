//
//  main.swift
//  Task1
//
//  Created by Artem Mayer on 01.02.2022.
//

import Foundation

// Создаём и инициализируем переменные коэффицентов уравнения
let aCoef: Double = 4
let bCoef: Double = 16
let cCoef: Double = 10.65
let resultMessage: String

// Вычисляем дискриминант
let discriminant: Double = pow(bCoef, 2.0) - 4 * aCoef * cCoef

// Проверяем значение дискриминанта на количество решений квадратного уравнения
//    затем вычисляем корни уравнения, если таковые имеются
if discriminant < Double(0) {
	resultMessage = String(format: "Квадратное уравнение не имеет решений, "
						   + "так как дискриминант < 0 (D = %.3f)", discriminant)

	print(resultMessage)

} else if discriminant == Double(0) {
	let x1Sqr: Double = (-bCoef) / (2 * aCoef)

	resultMessage = String(format: "Уравнение имеет единственный корень x1 = %.3f, "
						   + "так как дискриминант = 0 (D = %.3f)", x1Sqr, discriminant)

	print(resultMessage)

} else {
	let x1Sqr: Double = ((-bCoef) + sqrt(discriminant)) / (2 * aCoef)
	let x2Sqr: Double = ((-bCoef) - sqrt(discriminant)) / (2 * aCoef)

	resultMessage = String(format: "Уравнение имеет корни x1 = %.3f и x2 = %.3f, "
						   + "так как дискриминант > 0 (D = %.3f)", x1Sqr, x2Sqr, discriminant)
	
	print(resultMessage)

}

