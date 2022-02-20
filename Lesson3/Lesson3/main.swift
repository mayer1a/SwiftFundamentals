//
//  main.swift
//  Lesson3
//
//  Created by Artem Mayer on 12.02.2022.
//


// MARK: - Библиотеки
import Foundation


// MARK: - Перечисление действий с автомобилем

/// Перечисление действий, которые можно совершить с автомобилем
enum CarActions {
	case openDoor(String)
	case closeDoor(String)
	case turnOnLights(String)
	case turnOffLights(String)
	case startEngine
	case stopEngine
	case openTrunk
	case closeTrunk
	case openBonnet
	case closeBonnet
	case putTrunk(Double)
	case takeTrunk(Double)
}


// MARK: - Структура легкового автомобиля

/// Структура легкового автомобиля с большинством полей реального автомобиля.
/// Инициализатор с указанием дефолтных параметров.
/// Метод, который выведет полную информацию про автомобиль.
/// Метод, который проверит остаток свободного места в багажнике при его заполнении.
/// Метод для изменения состояний автомобиля
struct SportCar {

	var brand: String
	let model: String
	let engineType: String
	var bodyType: String?
	let transmission: String
	let manufactureYear: UInt
	let carMileage: UInt
	var trunkCapacity: Double
	var spaceOccupied: Double
	var isPanoramicRoof: Bool
	var isEngineRunning: Bool
	var isWindowOpen: Bool
	var	isDoorOpen: Bool
	var isLightsOn: Bool
	var isTrunkOpen: Bool
	var	isBonnetOpen: Bool
	var isGasTankEmpty: Bool

	var	fullCarName: String {
		get	{
			return "\(brand) \(model)"
		}
	}

	/// Инициализация структуры легкового автомобиля.
	/// Булевые аргументы, вместимость багажника и занятое пространство в багажнике можно опустить при инициализаии
	init(brand: String,
		 model: String,
		 engineType: String,
		 bodyType: String? = nil,
		 transmission: String,
		 manufactureYear: UInt,
		 carMileage: UInt,
		 trunkCapacity: Double = 0,
		 spaceOccupied: Double = 0,
		 isPanoramicRoof: Bool = false,
		 isEngineRunning: Bool = false,
		 isWindowOpen: Bool = false,
		 isDoorOpen: Bool = false,
		 isLightsOn: Bool = false,
		 isTrunkOpen: Bool = false,
		 isBonnetOpen: Bool = false,
		 isGasTankEmpty: Bool = false)
	{
		self.brand = brand
		self.model = model
		self.engineType = engineType
		self.bodyType = bodyType
		self.transmission = transmission
		self.manufactureYear = manufactureYear
		self.carMileage = carMileage
		self.trunkCapacity = trunkCapacity
		self.spaceOccupied = spaceOccupied
		self.isPanoramicRoof = isPanoramicRoof
		self.isEngineRunning = isEngineRunning
		self.isWindowOpen = isWindowOpen
		self.isDoorOpen = isDoorOpen
		self.isLightsOn = isLightsOn
		self.isTrunkOpen = isTrunkOpen
		self.isBonnetOpen = isBonnetOpen
		self.isGasTankEmpty = isGasTankEmpty
	}

	/**
	 Метод для изменения состояния автомобиля с выводом сообщения о совершенном действии

	 - Returns: Void

	 - Parameter is: Действие с автомобилем. Для некоторых действий необходимо отправить String внутри действия

	 */
	mutating func carAction(is action: CarActions) {
		switch action {
		case .openDoor(let door):
			isDoorOpen = true
			print("\(fullCarName): Открыта \(door) дверь")
		case .closeDoor(let door):
			isDoorOpen = false
			print("\(fullCarName): Закрыта \(door) дверь")
		case .turnOnLights(let lights):
			isLightsOn = true
			print("\(fullCarName): Включены \(lights) огни")
		case .turnOffLights(let lights):
			isLightsOn = false
			print("\(fullCarName): Выключены \(lights) огни")
		case .startEngine:
			isEngineRunning = true
			print("\(fullCarName): Двигатель запущен")
		case .stopEngine:
			isEngineRunning = false
			print("\(fullCarName): Двигатель заглушен")
		case .openTrunk:
			isTrunkOpen = true
			print("\(fullCarName): Багажник открыт")
		case .closeTrunk:
			isTrunkOpen = false
			print("\(fullCarName): Багажник закрыт")
		case .openBonnet:
			isBonnetOpen = true
			print("\(fullCarName): Капот открыт")
		case .closeBonnet:
			isBonnetOpen = false
			print("\(fullCarName): Капот закрыт")
		case .putTrunk(let baggage) where isTrunkOpen:
			spaceOccupied += spaceOccupied + baggage <= trunkCapacity ? baggage : 0
			print("\(fullCarName): В багажник добавлено \(baggage) л. груза")
		case .takeTrunk(let baggage) where isTrunkOpen && spaceOccupied > 0:
			spaceOccupied -= spaceOccupied + baggage <= trunkCapacity ? baggage : 0
			print("\(fullCarName): Из багажника достали \(baggage) л. груза")
		case .putTrunk(_), .takeTrunk(_):
			print("\(fullCarName): Багажник закрыт!")
		}
	}

	/**
	 Метод для вывода подрбной информации об автомобиле

	 - Returns: Void
	 */
	mutating func about() {

		print("""
  ------------------------------------------------------------
  Подробная информация легкового автомобиля \(fullCarName):
  ------------------------------------------------------------
  Тип двигателя: \(engineType)
  Тип кузова: \(bodyType ?? "N/A")
  Тип трансмиссии: \(transmission)
  Год производства: \(manufactureYear)
  Пробег в км.: \(carMileage)
  Объём багажника в л.: \(trunkCapacity)
  Занятый объём багажника в л.: \(spaceOccupied)
  Панорамная крыша - \(isPanoramicRoof)
  Двигатель запущен - \(isEngineRunning)
  Окно открыто - \(isWindowOpen)
  Дверь открыта - \(isDoorOpen)
  Габаритные огни включены - \(isLightsOn)
  Багажник открыт - \(isTrunkOpen)
  Капот открыт - \(isBonnetOpen)
  Бензобак пустой - \(isGasTankEmpty)
  ------------------------------------------------------------
  """)
	}

	/**
	 Метод для подсчёта оставшегося свободного места в багажнике

	 - Returns: Свободное место в багажнике - Double
	 */
	func calculateFreeSpace() -> Double {
		return trunkCapacity > 0 ? trunkCapacity - spaceOccupied : 0
	}

}


// MARK: - Перечисление действий с грузовым автомобилем

enum TrunkAction {
	case loading(Double)
	case unloading(Double)
	case hitchTrailer
	case unhitchTrailer
}

// MARK: - Структура грузового автомобиля

/// Структура грузового автомобиля с большинством полей реального грузовика.
/// Вычисляемое поле занятого место в кузове
/// Инициализатор с указанием дефолтных параметров.
/// Метод для изменения состояний автомобиля
/// Метод для запуска процесса погрузки/разгрузки
/// Метод для остановки процесса погрузки/разгрузки
/// Метод, который выведет полную информацию про грузовик.
struct TrunkCar {
	let brand: String
	let model: String
	let bodyLength: Double
	let bodyCapacity: Double
	let horsePower: UInt

	/// Грузоподъёмность
	let carrying: Double
	private var isTrailerHitched: Bool
	private var isCargoHandling: Bool

	var	fullTrunkName: String {
		get	{
			return "\(brand) \(model)"
		}
	}

	private var spaceOccupied: Double = 0 {

		willSet(newValue) {
			print("\(fullTrunkName): Попытка загрузки \(newValue) тонн.")
		}
		didSet(oldValue) {
			print("""
	\(fullTrunkName): К \(oldValue) тонн груза добавлено \(spaceOccupied - oldValue).
	 Осталось места на \(bodyCapacity - spaceOccupied) тонн.
	""")
		}
	}

	/// Инициализация структуры грузового автомобиля.
	/// Булевые аргументы можно опустить при инициализаии
	init(brand: String,
		 model: String,
		 bodyLength: Double,
		 bodyCapacity: Double,
		 horsePower: UInt,
		 carrying: Double,
		 isTrailerHitched: Bool = false,
		 isLoadingProgress: Bool = false)
	{
		self.brand = brand
		self.model = model
		self.bodyLength = bodyLength
		self.bodyCapacity = bodyCapacity
		self.horsePower = horsePower
		self.carrying = carrying
		self.isTrailerHitched = isTrailerHitched
		self.isCargoHandling = isLoadingProgress
	}

	/**
	 Метод для изменения состояния грузовика с выводом сообщения о совершенном действии

	 - Returns: Void

	 - Parameter is: Действие с грузовиком. Для некоторых действий необходимо отправить Double внутри действия

	 */
	mutating func cargoAction(action: TrunkAction) {

		switch action {
		case .loading(let cargoTons) where isTrailerHitched && isCargoHandling:
			if cargoTons > bodyCapacity - spaceOccupied {
				print("\(fullTrunkName): Погружаемый груз превышает допустимый вес погрузки!")
			} else {
				spaceOccupied += cargoTons
			}
		case .loading(_):
			print("\(fullTrunkName): Прицепите трейлер и начните процесс погрузки/разгрузки. Повторите еще раз!")
		case .unloading(let cargoTons) where isTrailerHitched && isCargoHandling:
			if cargoTons > spaceOccupied {
				print("\(fullTrunkName): Выгружаемый груз превышает оставшийся вес в кузове!")
			} else {
				spaceOccupied -= cargoTons
			}
		case .unloading(_):
			print("\(fullTrunkName): Прицепите трейлер и начните процесс погрузки/разгрузки. Повторите еще раз!")
		case .hitchTrailer:
			self.isTrailerHitched = true
			print("\(fullTrunkName): Трейлер прицеплен к грузовику")
		case .unhitchTrailer:
			self.isTrailerHitched = false
			print("\(fullTrunkName): Трейлер отцеплен от грузовика")
		}
	}

	/**
	 Метод для запуска процесса погрузки/роазгрузки

	 - Returns: Void
	 */
	mutating func startCargoHandling() {
		if isCargoHandling {
			print("\(fullTrunkName): Процесс погрузки/разгрузки уже запущен")
		} else {
			isCargoHandling = true
			print("\(fullTrunkName): Процесс погрузки/разгрузки запущен")
		}
	}

	/**
	 Метод для остановки процесса погрузки/роазгрузки

	 - Returns: Void
	 */
	mutating func stopCargoHandling() {
		if isCargoHandling {
			isCargoHandling = false
			print("\(fullTrunkName): Процесс погрузки/разгрузки остановлен")
		} else {
			print("\(fullTrunkName): Процесс погрузки/разгрузки уже остановлен")
		}
	}

	/**
	 Метод для вывода подрбной информации о грузовике

	 - Returns: Void
	 */
	mutating func about() {

		print("""
   ------------------------------------------------------------
   Подробная информация грузового автомобиля \(fullTrunkName):
   ------------------------------------------------------------
   Длина кузова: \(bodyLength)
   Вместимость кузова в тоннах: \(bodyCapacity)
   Мощность двигателя в л. с.: \(horsePower)
   Максимальная грузоподъёмность грузовика: \(carrying)
   Кузов прицеплен - \(isTrailerHitched)
   Процесс погрузки/разгрузки запущен - \(isCargoHandling)
   Занятый объём кузова в тоннах: \(spaceOccupied)
   ------------------------------------------------------------
   """)
	}
}


// MARK: - Реализация функции сравнения объемов багажника у двух легковых автомобилей

func moreCarTrunkSpace(thisCar: SportCar, anotherCar: SportCar) -> SportCar {
	return thisCar.trunkCapacity > anotherCar.trunkCapacity ? thisCar : anotherCar
}


// MARK: - Реализация функции сравнения мощности двигателей у грузовых автомобилей

func trunkMorePowerful(thisTrunk: TrunkCar, anotherTrunk: TrunkCar) -> TrunkCar {
	return thisTrunk.horsePower > anotherTrunk.horsePower ? thisTrunk : anotherTrunk
}


// MARK: Создание экземпляров легковых и грузовых автомобилей разными инициализаторами

var bmwCar = SportCar(brand: "BMW",
					  model: "X7",
					  engineType: "Gasoline engine",
					  transmission: "Automatic transmission",
					  manufactureYear: 2017,
					  carMileage: 3954)

var alfaRomeoCar = SportCar(brand: "Alfa Romeo",
							model: "GTV",
							engineType: "Gasoline engine",
							bodyType: "Saloon",
							transmission: "Manual transmission",
							manufactureYear: 2019,
							carMileage: 1000,
							trunkCapacity: 230,
							spaceOccupied: 0,
							isPanoramicRoof: false,
							isEngineRunning: false,
							isWindowOpen: false,
							isDoorOpen: false,
							isLightsOn: true,
							isTrunkOpen: false,
							isBonnetOpen: false)

var porscheCar = SportCar(brand: "Porsche",
						  model: "Panamera",
						  engineType: "Hybrid",
						  bodyType: "Hatchback",
						  transmission: "Automatic transmission",
						  manufactureYear: 2021,
						  carMileage: 0,
						  trunkCapacity: 680,
						  spaceOccupied: 0,
						  isPanoramicRoof: true)

var scaniaTrunk = TrunkCar(brand: "Scania",
						   model: "F60",
						   bodyLength: 12.5,
						   bodyCapacity: 30.2,
						   horsePower: 845,
						   carrying: 70)

var volvoTrunk = TrunkCar(brand: "Volvo",
						  model: "C800",
						  bodyLength: 15.7,
						  bodyCapacity: 40.5,
						  horsePower: 905,
						  carrying: 90.5,
						  isTrailerHitched: true,
						  isLoadingProgress: false)


// MARK: - Вызов метода about каждой машины

bmwCar.about()
alfaRomeoCar.about()
porscheCar.about()
scaniaTrunk.about()
volvoTrunk.about()


// MARK: - Заполнение дефолтных или неопределённых свойств и вызов метода about

bmwCar.bodyType = "Crossover"
bmwCar.trunkCapacity = 460.5
bmwCar.isTrunkOpen = true
bmwCar.spaceOccupied = 200
bmwCar.isLightsOn = true

bmwCar.about()


// MARK: - Демонстрация работы действий из перечисления и их обработки внутри структуры, вывод сообщений

bmwCar.carAction(is: .openDoor("передняя левая"))
bmwCar.carAction(is: .putTrunk(23.5))

porscheCar.carAction(is: .turnOnLights("противотуманные и задние габаритные"))

scaniaTrunk.cargoAction(action: .loading(30))
scaniaTrunk.cargoAction(action: .hitchTrailer)
scaniaTrunk.startCargoHandling()
scaniaTrunk.cargoAction(action: .loading(0.1))
scaniaTrunk.cargoAction(action: .loading(24.2))
scaniaTrunk.startCargoHandling()
scaniaTrunk.stopCargoHandling()

scaniaTrunk.about()

// MARK: - Демонстрация работы функции сравнения объема багажника у легкового автомобиля
// Сам принт также можно было реализовать в функции, но хотел поработать с возвращаемой структурой

print("Объём багажника больше у \(moreCarTrunkSpace(thisCar: bmwCar, anotherCar: alfaRomeoCar).fullCarName)")


// MARK: - Демонстрация работы функции сравнения мощности двигателя у грузового автомобиля

print("Двигатель мощнее у \(trunkMorePowerful(thisTrunk: volvoTrunk, anotherTrunk: scaniaTrunk).fullTrunkName)")

