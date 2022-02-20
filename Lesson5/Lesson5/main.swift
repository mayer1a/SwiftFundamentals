//
//  main.swift
//  Lesson5
//
//  Created by Artem Mayer on 20.02.2022.
//

// MARK: - Библиотеки
import Foundation


// MARK: - Протокол Car с описанием общих свойств автомобиля и метода действий с автомобилем

/// Протокол, описывающий общие свойства и методы для автомобилей
protocol CarProtocol {
	var brand: String { get }
	var model: String { get }
	var engineType: String { get }
	var transmission: String { get }
	var manufactureYear: UInt { get }
	var carMileage: UInt { get set }
	var horsePower: UInt { get }
	var fuelAmount: Double { get set }
	var isEngineRunning: Bool { get set }
	var isWindowOpen: Bool { get set }
	var	isDoorOpen: Bool { get set }
	var isLightsOn: Bool { get set }
	var	isBonnetOpen: Bool { get set }

	/// Запуск двигателя
	mutating func startEngine()

	/// Остановка двигателя
	mutating func stopEngine()

	/// Открытие окна
	mutating func openWindow()

	/// Закрытие окна
	mutating func closeWindow()

	/// Открытие двери
	mutating func openDoor()

	/// Закрытие двери
	mutating func closeDoor()

	/// Включение огней автомобиля
	mutating func turnOnLights()

	/// Выключение огней автомобиля
	mutating func turnOffLights()

	/// Открытие капота
	mutating func openBonnet()

	/// Закрытие капота
	mutating func closeBonnet()

	/// Вывод информации об автомобиле
	func about()
}


// MARK: - Расширение для протокола Car с реализацией методов общих действий с автомобилем

/// Расширение протокола для реализации общих методов для автомобилей
extension CarProtocol {

	/// Вычисляемое свойство для вывода бренда и модели в одной строке
	var fullCarName: String {
		return "\(brand) \(model)"
	}

	mutating func startEngine() {
		isEngineRunning = true
	}

	mutating func stopEngine() {
		isEngineRunning = false
	}

	mutating func openWindow() {
		isWindowOpen = true
	}

	mutating func closeWindow() {
		isWindowOpen = false
	}

	mutating func openDoor() {
		isDoorOpen = true
	}

	mutating func closeDoor() {
		isDoorOpen = false
	}

	mutating func turnOnLights() {
		isLightsOn = true
	}

	mutating func turnOffLights() {
		isLightsOn = false
	}

	mutating func openBonnet() {
		isBonnetOpen = true
	}

	mutating func closeBonnet() {
		isBonnetOpen = false
	}

	func about() {
		print("""
		------------------------------------------------------------
		Подробная информация легкового автомобиля \(fullCarName):
		------------------------------------------------------------
		Тип двигателя: \(engineType)
		Тип трансмиссии: \(transmission)
		Год производства: \(manufactureYear)
		Пробег в км.: \(carMileage)
		Объём топлива в бензобаке в л.: \(fuelAmount)
		Мощность двигателя в л. с.: \(horsePower)
		Двигатель запущен - \(isEngineRunning)
		Окно открыто - \(isWindowOpen)
		Дверь открыта - \(isDoorOpen)
		Габаритные огни включены - \(isLightsOn)
		Капот открыт - \(isBonnetOpen)
		------------------------------------------------------------
		""")
	}
}


// MARK: - Класс SportCar, имплементирующий протокол Car с описаниями индивидуальных свойств

final class SportCar: CarProtocol {
	let brand: String
	let model: String
	let engineType: String
	let transmission: String
	let manufactureYear: UInt
	var carMileage: UInt
	let horsePower: UInt
	var fuelAmount: Double
	var isEngineRunning: Bool
	var isWindowOpen: Bool
	var isDoorOpen: Bool
	var isLightsOn: Bool
	var isBonnetOpen: Bool

	private let trunkCapacity: Double
	private var spaceOccupied: Double
	private let isThereThirdRowSeats: Bool
	private var isSpoilerInstalled: Bool
	private var isAutopilotOn: Bool
	private var isTrunkOpen: Bool
	private var isRoofOpen: Bool

	init(brand: String,
		 model: String,
		 engineType: String,
		 transmission: String,
		 manufactureYear: UInt,
		 carMileage: UInt,
		 horsePower: UInt,
		 fuelAmount: Double,
		 isEngineRunning: Bool = false,
		 isWindowOpen: Bool = false,
		 isDoorOpen: Bool = false,
		 isLightsOn: Bool = false,
		 isBonnetOpen: Bool = false,
		 isGasTankEmpty: Bool = false,
		 trunkCapacity: Double,
		 spaceOccupied: Double = 0,
		 isThereThirdRowSeats: Bool = false,
		 isSpoilerInstalled: Bool = false,
		 isAutopilotOn: Bool = false,
		 isTrunkOpen: Bool = false,
		 isRoofOpen: Bool = false)
	{
		self.brand = brand
		self.model = model
		self.engineType = engineType
		self.transmission = transmission
		self.manufactureYear = manufactureYear
		self.carMileage = carMileage
		self.horsePower = horsePower
		self.fuelAmount = fuelAmount
		self.isEngineRunning = isEngineRunning
		self.isWindowOpen = isWindowOpen
		self.isDoorOpen = isDoorOpen
		self.isLightsOn = isLightsOn
		self.isBonnetOpen = isBonnetOpen
		self.trunkCapacity = trunkCapacity
		self.spaceOccupied = spaceOccupied
		self.isThereThirdRowSeats = isThereThirdRowSeats
		self.isSpoilerInstalled = isSpoilerInstalled
		self.isAutopilotOn = isAutopilotOn
		self.isTrunkOpen = isTrunkOpen
		self.isRoofOpen = isRoofOpen
	}

	/// Метод упаковки багажа
	func putBaggage(liters baggage: Double) {

		if spaceOccupied + baggage <= trunkCapacity {
			spaceOccupied += baggage

			print("""
			\(fullCarName): К \(spaceOccupied) литров объёма багажа добавлено \(baggage).
			Осталось места на \(trunkCapacity - spaceOccupied) литров багажа.
			""")
		} else {
			print("""
			\(fullCarName): Загрузка \(baggage) литров багажа невозможна -
			превышается максимальная вместимость багажника \(trunkCapacity).
			""")
		}
	}

	/// Метод изъятия багажа
	func takeBaggage(liters baggage: Double) {

		if spaceOccupied - baggage < 0 {
			spaceOccupied -= baggage

			print("""
			\(fullCarName): Из \(spaceOccupied) литров объёма багажа взято \(baggage).
			Осталось \(trunkCapacity - spaceOccupied) литров багажа.
			""")
		} else {
			print("""
			\(fullCarName): Невозможно взять багажа больше, чем имеется в багажнике (\(baggage))
			""")
		}
	}

	func about() {
		print("""
		------------------------------------------------------------
		Подробная информация легкового автомобиля \(fullCarName):
		------------------------------------------------------------
		Тип двигателя: \(engineType)
		Тип трансмиссии: \(transmission)
		Год производства: \(manufactureYear)
		Пробег в км.: \(carMileage)
		Объём топлива в бензобаке в л.: \(fuelAmount)
		Мощность двигателя в л. с.: \(horsePower)
		Объём багажника в л.: \(trunkCapacity)
		Занятое место в багажнике в л.: \(spaceOccupied)
		Двигатель запущен - \(isEngineRunning)
		Окно открыто - \(isWindowOpen)
		Дверь открыта - \(isDoorOpen)
		Габаритные огни включены - \(isLightsOn)
		Капот открыт - \(isBonnetOpen)
		Третий ряд сидений установлен - \(isThereThirdRowSeats)
		Спойлер установлен - \(isSpoilerInstalled)
		Автопилот включён - \(isAutopilotOn)
		Багажник открыт - \(isTrunkOpen)
		Крыша открыта - \(isRoofOpen)
		------------------------------------------------------------
		""")
	}
}

// MARK: - Расширение класса SportCar имплементирующий протокол CustomStringConvertible
extension SportCar: CustomStringConvertible {
	var description: String {
		return "\(fullCarName) - экземпляр класса легкового автомобиля (SportCar)"
	}
}


// MARK: - Класс TrunkCar, имплементирующий протокол Car с описаниями индивидуальных свойств


// MARK: - Создание экземпляров легковых и грузовых автомобилей разными инициализаторами

let audiR8 = SportCar(brand: "Audi",
					  model: "R8",
					  engineType: "Gasoline",
					  transmission: "Automatic",
					  manufactureYear: 2020,
					  carMileage: 10746,
					  horsePower: 385,
					  fuelAmount: 230,
					  trunkCapacity: 150)

let mercedesBenzE350 = SportCar(brand: "Mercedes Benz",
							   model: "E350",
							   engineType: "Gasoline",
							   transmission: "Automatic",
							   manufactureYear: 2022,
							   carMileage: 0,
							   horsePower: 760,
							   fuelAmount: 140,
							   isEngineRunning: false,
							   isWindowOpen: false,
							   isDoorOpen: false,
							   isLightsOn: true,
							   isBonnetOpen: false,
							   trunkCapacity: 120,
							   spaceOccupied: 0.34,
							   isThereThirdRowSeats: false,
							   isSpoilerInstalled: true,
							   isAutopilotOn: false,
							   isTrunkOpen: false,
							   isRoofOpen: false)

// MARK: - Вызов метода about каждой машины

audiR8.about()
mercedesBenzE350.about()


// MARK: - Демонстрация работы расширения класса имплементирующего протокол CustomStringConvertible

print(audiR8)
print(mercedesBenzE350)


