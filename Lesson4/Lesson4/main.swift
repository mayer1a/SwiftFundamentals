//
//  main.swift
//  Lesson4
//
//  Created by Artem Mayer on 16.02.2022.
//

// MARK: - Библиотека
import Foundation


// MARK: - Перечисление действий с автомобилем

/// Перечисление действий, которые можно совершить с легковым и грузовым автомобилем
enum CarActions {
	case openDoor(String)
	case closeDoor(String)
	case turnOnLights(String)
	case turnOffLights(String)
	case putCargo(Double)
	case takeCargo(Double)
	case startEngine
	case stopEngine
	case openTrunk
	case closeTrunk
	case openBonnet
	case closeBonnet
	case liftBody
	case lowerBody
	case turnOnFlashers
	case turnOffFlashers
	case openRoof
	case closeRoof
	case turnOnAutopilot
	case turnOffAutopilot
	case hitchTrailer
	case unhitchTrailer
}


// MARK: - Класс автомобиля

/// Класс автомобиля с общими свойствами любого автомобиля.
/// Инициализатор с указанием дефолтных параметров.
/// Метод, который выведет полную информацию про автомобиль.
/// Метод для изменения состояний автомобиля
class Car {
	private var brand: String
	private var model: String
	private var engineType: String
	private var transmission: String
	private var manufactureYear: UInt
	var carMileage: UInt
	private var horsePower: UInt
	private var fuelAmount: Double
	var isEngineRunning: Bool
	var isWindowOpen: Bool
	var	isDoorOpen: Bool
	var isLightsOn: Bool
	var	isBonnetOpen: Bool
	var isGasTankEmpty: Bool

	/// Вычисляемое свойство для вывода бренда и модели в одной строке
	fileprivate var	fullCarName: String {
		get	{
			return "\(brand) \(model)"
		}
	}

	/// Инициализация родительского класса любого автомобиля
	/// Булевые аргументы, можно опустить при инициализаии
	init(brand: String,
		 model: String,
		 engineType: String,
		 transmittion: String,
		 manufactureYear: UInt,
		 carMileage: UInt,
		 horsePower: UInt,
		 fuelAmount: Double,
		 isEngineRunning: Bool = false,
		 isWindowOpen: Bool = false,
		 isDoorOpen: Bool = false,
		 isLightsOn: Bool = false,
		 isBonnetOpen: Bool = false)
	{
		self.brand = brand
		self.model = model
		self.engineType = engineType
		self.transmission = transmittion
		self.manufactureYear = manufactureYear
		self.carMileage = carMileage
		self.horsePower = horsePower
		self.fuelAmount = fuelAmount
		self.isEngineRunning = isEngineRunning
		self.isWindowOpen = isWindowOpen
		self.isDoorOpen	= isDoorOpen
		self.isLightsOn	= isLightsOn
		self.isBonnetOpen = isBonnetOpen
		self.isGasTankEmpty	= fuelAmount == 0 ? true : false
	}

	/**
	 Пустой метод для изменения состояния автомобиля для переопределения в классе-потомке

	 - Returns: Void

	 - Parameter is: Действие с автомобилем. Для некоторых действий необходимо отправить String внутри действия

	 */
	fileprivate func carAction(is action: CarActions) {

	}

	/**
	 Метод для вывода подрбной информации об автомобиле - общие свойства для переопределения с вызовом родительского метода

	 - Returns: Void
	 */
	fileprivate func about() {

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
   Бензобак пустой - \(isGasTankEmpty)
   """)
	}
}


// MARK: - Класс легкового автомобиля - наследник класса автомобиль

/// Класс легкового автомобиля с большинством полей реального легкового автомобиля.
/// Инициализатор с указанием дефолтных параметров.
/// Вычисляемое поле занятого место в кузове
/// Метод для вычисления оставшегося места в багажнике
/// Метод, который выведет полную информацию про автомобиль.
/// Метод для изменения состояний автомобиля
final class SportCar: Car {
	private var trunkCapacity: Double
	private var isThereThirdRowSeats: Bool
	private var isSpoilerInstalled: Bool
	var isAutopilotOn: Bool
	var isTrunkOpen: Bool
	var isRoofOpen: Bool

	private var spaceOccupied: Double = 0 {

		willSet(newValue) {
			print("\(fullCarName): Попытка загрузки \(newValue) литров багажа.")
		}

		didSet(oldValue) {
			print("""
  \(fullCarName): К \(oldValue) литров объёма багажа добавлено \(spaceOccupied - oldValue).
   Осталось места на \(trunkCapacity - spaceOccupied) литров багажа.
  """)
		}
	}

	/// Инициализация класса-потомка и вызов инициализатора родительского класса легкового автомобиля
	/// Некоторые булевые аргументы, можно опустить при инициализаии
	init(brand: String,
		 model: String,
		 engineType: String,
		 transmittion: String,
		 manufactureYear: UInt,
		 carMileage: UInt,
		 horsePower: UInt,
		 fuelAmount: Double,
		 isEngineRunning: Bool = false,
		 isWindowOpen: Bool = false,
		 isDoorOpen: Bool = false,
		 isLightsOn: Bool = false,
		 isBonnetOpen: Bool = false,
		 trunkCapacity: Double,
		 isThereThirdRowSeats: Bool,
		 isSpoilerInstalled: Bool,
		 isAutopilotOn: Bool = false,
		 isTrunkOpen: Bool = false,
		 isRoofOpen: Bool = false)
	{
		self.trunkCapacity = trunkCapacity
		self.isThereThirdRowSeats = isThereThirdRowSeats
		self.isSpoilerInstalled	= isSpoilerInstalled
		self.isAutopilotOn = isAutopilotOn
		self.isTrunkOpen = isTrunkOpen
		self.isRoofOpen = isRoofOpen

		super.init(brand: brand,
				   model: model,
				   engineType: engineType,
				   transmittion: transmittion,
				   manufactureYear: manufactureYear,
				   carMileage: carMileage,
				   horsePower: horsePower,
				   fuelAmount: fuelAmount,
				   isEngineRunning: isEngineRunning,
				   isWindowOpen: isWindowOpen,
				   isDoorOpen: isDoorOpen,
				   isLightsOn: isLightsOn,
				   isBonnetOpen: isBonnetOpen)
	}

	/**
	 Метод для изменения состояния автомобиля с выводом сообщения о совершенном действии переопределенный в классе-потомке

	 - Returns: Void

	 - Parameter is: Действие с автомобилем. Для некоторых действий необходимо отправить String внутри действия

	 */
	override func carAction(is action: CarActions) {

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

		case .putCargo(let baggage) where isTrunkOpen:
			spaceOccupied += spaceOccupied + baggage <= trunkCapacity ? baggage : 0
			print("\(fullCarName): В багажник добавлено \(baggage) л. груза")

		case .takeCargo(let baggage) where isTrunkOpen && spaceOccupied > 0:
			spaceOccupied -= spaceOccupied + baggage <= trunkCapacity ? baggage : 0
			print("\(fullCarName): Из багажника достали \(baggage) л. груза")

		case .takeCargo(_) where spaceOccupied == 0:
			print("\(fullCarName): Багажник пустой!")

		case .putCargo(_), .takeCargo(_):
			print("\(fullCarName): Багажник закрыт!")

		case .openRoof:
			isRoofOpen = true
			print("\(fullCarName): Крыша открыта!")

		case .closeRoof:
			isRoofOpen = false
			print("\(fullCarName): Крыша закрыта!")

		case .turnOnAutopilot:
			isAutopilotOn = true
			print("\(fullCarName): Автопилот включен!")

		case .turnOffAutopilot:
			isAutopilotOn = false
			print("\(fullCarName): Автопилот выключен!")

		default:
			print("Неприменимо к данному виду транспорта \(self) \(type(of: self))")
		}

		super.carAction(is: action)
	}

	/**
	 Метод для подсчёта оставшегося свободного места в багажнике

	 - Returns: Свободное место в багажнике - Double
	 */
	func calculateFreeSpace() -> Double {
		return trunkCapacity > 0 ? trunkCapacity - spaceOccupied : 0
	}

	/**
	 Метод для вывода подрбной информации об автомобиле - общие свойста, путём вызова родительского метода
	 и индивидуальные свойства легкового автомобиля

	 - Returns: Void
	 */
	override func about() {

		super.about()

		print("""
   Объём багажника в л.: \(trunkCapacity)
   Занятое место в багажнике в л.: \(spaceOccupied)
   Третий ряд сидений установлен - \(isThereThirdRowSeats)
   Спойлер установлен - \(isSpoilerInstalled)
   Автопилот включён - \(isAutopilotOn)
   Багажник открыт - \(isTrunkOpen)
   Крыша открыта - \(isRoofOpen)
   ------------------------------------------------------------
   """)
	}

}


// MARK: - Класс грузового автомобиля - наследник класса автомобиль

/// Класс грузового автомобиля с большинством полей реального грузовика.
/// Вычисляемое поле занятого место в кузове
/// Инициализатор с указанием дефолтных параметров.
/// Метод для изменения состояний автомобиля
/// Метод для запуска процесса погрузки/разгрузки
/// Метод для остановки процесса погрузки/разгрузки
/// Метод, который выведет полную информацию про грузовик.
final class TrunkCar: Car {
	private var bodyLength: Double
	private var bodyCapacity: Double
	private var carrying: Double
	private var isBodyLowered: Bool
	private var isFlashersOn: Bool
	private var isTrailerHitched: Bool
	private var isCargoHandling: Bool

	private var spaceOccupied: Double = 0 {

		willSet(newValue) {
			print("\(fullCarName): Попытка загрузки \(newValue) тонн багажа.")
		}

		didSet(oldValue) {
			print("""
  \(fullCarName): К \(oldValue) тонн багажа добавлено \(spaceOccupied - oldValue).
   Осталось места на \(bodyCapacity - spaceOccupied) тонн багажа.
  """)
		}
	}

	/// Инициализация класса-потомка и вызов инициализатора родительского класса грузового автомобиля
	/// Булевые аргументы, можно опустить при инициализаии
	init(brand: String,
		 model: String,
		 engineType: String,
		 transmittion: String,
		 manufactureYear: UInt,
		 carMileage: UInt,
		 horsePower: UInt,
		 fuelAmount: Double,
		 isEngineRunning: Bool = false,
		 isWindowOpen: Bool = false,
		 isDoorOpen: Bool = false,
		 isLightsOn: Bool = false,
		 isBonnetOpen: Bool = false,
		 bodyLength: Double,
		 bodyCapacity: Double,
		 carrying: Double,
		 isBodyLowered: Bool = true,
		 isFlashersOn: Bool = false,
		 isTrailerHitched: Bool = false,
		 isCargoHandling: Bool = false)
	{
		self.bodyLength = bodyLength
		self.bodyCapacity = bodyCapacity
		self.carrying = carrying
		self.isBodyLowered = isBodyLowered
		self.isFlashersOn = isFlashersOn
		self.isTrailerHitched = isTrailerHitched
		self.isCargoHandling = isCargoHandling

		super.init(brand: brand,
				   model: model,
				   engineType: engineType,
				   transmittion: transmittion,
				   manufactureYear: manufactureYear,
				   carMileage: carMileage,
				   horsePower: horsePower,
				   fuelAmount: fuelAmount,
				   isEngineRunning: isEngineRunning,
				   isWindowOpen: isWindowOpen,
				   isDoorOpen: isDoorOpen,
				   isLightsOn: isLightsOn,
				   isBonnetOpen: isBonnetOpen)
	}

	/**
	 Метод для изменения состояния автомобиля с выводом сообщения о совершенном действии переопределенный в классе-потомке

	 - Returns: Void

	 - Parameter is: Действие с автомобилем. Для некоторых действий необходимо отправить String внутри действия

	 */
	override func carAction(is action: CarActions) {

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

		case .openBonnet:
			isBonnetOpen = true
			print("\(fullCarName): Капот открыт")

		case .closeBonnet:
			isBonnetOpen = false
			print("\(fullCarName): Капот закрыт")

		case .liftBody:
			isBodyLowered = false
			print("\(fullCarName): Кузов поднят")

		case .lowerBody:
			isBodyLowered = true
			print("\(fullCarName): Кузов опущен")

		case .turnOnFlashers:
			isFlashersOn = true
			print("\(fullCarName): Мигалка включена")

		case .turnOffFlashers:
			isFlashersOn = false
			print("\(fullCarName): Мигалка выключена")

		case .putCargo(let baggage) where isTrailerHitched && isCargoHandling:
			if baggage > bodyCapacity - spaceOccupied {
				print("\(fullCarName): Погружаемый груз превышает допустимый вес погрузки!")
			} else {
				spaceOccupied += baggage
			}

		case .takeCargo(let baggage) where isTrailerHitched && isCargoHandling:
			if baggage > spaceOccupied {
				print("\(fullCarName): Выгружаемый груз превышает оставшийся вес в кузове!")
			} else {
				spaceOccupied -= baggage
			}

		case .takeCargo(_) where spaceOccupied == 0:
			print("\(fullCarName): Багажник пустой!")

		case .putCargo(_), .takeCargo(_):
			print("\(fullCarName): Прицепите трейлер и начните процесс погрузки/разгрузки. Повторите еще раз!")

		case .hitchTrailer:
			self.isTrailerHitched = true
			print("\(fullCarName): Трейлер прицеплен к грузовику")

		case .unhitchTrailer:
			self.isTrailerHitched = false
			print("\(fullCarName): Трейлер отцеплен от грузовика")

		default:
			print("Неприменимо к данному виду транспорта \(self) \(type(of: self))")
		}

		super.carAction(is: action)
	}

	/**
	 Метод для запуска процесса погрузки/роазгрузки

	 - Returns: Void
	 */
	func startCargoHandling() {
		if isCargoHandling {
			print("\(fullCarName): Процесс погрузки/разгрузки уже запущен")
		} else {
			isCargoHandling = true
			print("\(fullCarName): Процесс погрузки/разгрузки запущен")
		}
	}

	/**
	 Метод для остановки процесса погрузки/роазгрузки

	 - Returns: Void
	 */
	func stopCargoHandling() {
		if isCargoHandling {
			isCargoHandling = false
			print("\(fullCarName): Процесс погрузки/разгрузки остановлен")
		} else {
			print("\(fullCarName): Процесс погрузки/разгрузки уже остановлен")
		}
	}

	/**
	 Метод для вывода подрбной информации об автомобиле - общие свойста, путём вызова родительского метода
	 и индивидуальные свойства грузового автомобиля

	 - Returns: Void
	 */
	override func about() {

		super.about()

		print("""
   Длина кузова м.: \(bodyLength)
   Вместимость кузова в т.: \(bodyCapacity)
   Занятое место в кузове в т.: \(spaceOccupied)
   Грузоподъёмность в т.: \(carrying)
   Кузов опущен - \(isBodyLowered)
   Мигалки включены - \(isFlashersOn)
   Трейлер прицеплен - \(isTrailerHitched)
   Процесс погрузки/разгрузки запущен - \(isCargoHandling)
   ------------------------------------------------------------
   """)
	}
}


// MARK: Создание экземпляров легковых и грузовых автомобилей разными инициализаторами

var audiQ7 = SportCar(brand: "Audi",
					  model: "Q7",
					  engineType: "Gasoline",
					  transmittion: "Automatic",
					  manufactureYear: 2021,
					  carMileage: 7950,
					  horsePower: 375,
					  fuelAmount: 92.3,
					  trunkCapacity: 430,
					  isThereThirdRowSeats: false,
					  isSpoilerInstalled: true)

var mercedesBenzAMG = SportCar(brand: "Mercedes Benz",
							   model: "AMG",
							   engineType: "Gasoline",
							   transmittion: "Automatic",
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
							   isThereThirdRowSeats: false,
							   isSpoilerInstalled: true,
							   isAutopilotOn: false,
							   isTrunkOpen: false,
							   isRoofOpen: false)

var freightlinerColumbia = TrunkCar(brand: "Freightliner",
									model: "Columbia",
									engineType: "Diesel",
									transmittion: "Manual",
									manufactureYear: 2017,
									carMileage: 364000,
									horsePower: 850,
									fuelAmount: 600,
									bodyLength: 13,
									bodyCapacity: 90,
									carrying: 150)

var	manTgs = TrunkCar(brand: "MAN",
					  model: "TGS",
					  engineType: "Hybrid",
					  transmittion: "Manual",
					  manufactureYear: 2010,
					  carMileage: 540392,
					  horsePower: 920,
					  fuelAmount: 483.2,
					  isEngineRunning: false,
					  isWindowOpen: false,
					  isDoorOpen: true,
					  isLightsOn: true,
					  isBonnetOpen: false,
					  bodyLength: 15,
					  bodyCapacity: 103,
					  carrying: 183,
					  isBodyLowered: true,
					  isFlashersOn: false,
					  isTrailerHitched: true,
					  isCargoHandling: false)


// MARK: - Вызов метода about каждой машины

audiQ7.about()
mercedesBenzAMG.about()

freightlinerColumbia.about()
manTgs.about()


// MARK: - Заполнение дефолтных или неопределённых свойств и вызов метода about

audiQ7.carMileage += 10
audiQ7.isAutopilotOn = true
audiQ7.isRoofOpen = true

audiQ7.about()

// MARK: - Демонстрация работы действий из перечисления и их обработки внутри структуры, вывод сообщений

mercedesBenzAMG.carAction(is: .openDoor("задняя правая"))
mercedesBenzAMG.carAction(is: .putCargo(23.5))

audiQ7.carAction(is: .turnOnLights("противотуманные и задние габаритные"))

manTgs.carAction(is: .putCargo(30))
manTgs.carAction(is: .hitchTrailer)
manTgs.startCargoHandling()
manTgs.carAction(is: .putCargo(0.1))
manTgs.carAction(is: .putCargo(24.2))
manTgs.startCargoHandling()
manTgs.stopCargoHandling()

manTgs.about()
