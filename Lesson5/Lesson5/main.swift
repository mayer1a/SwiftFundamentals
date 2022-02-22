//
//  main.swift
//  Lesson5
//
//  Created by Artem Mayer on 20.02.2022.
//

import Foundation


/// Протокол, описывающий общие свойства и методы для автомобилей
protocol CarProtocol {

    // MARK: - Общие свойства
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

    // MARK: - Описание общих методов
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
    mutating func turnOnLights(what lights: String)

    /// Выключение огней автомобиля
    mutating func turnOffLights(what lights: String)

    /// Открытие капота
    mutating func openBonnet()

    /// Закрытие капота
    mutating func closeBonnet()

    /// Вывод информации об автомобиле
    func about()
}


/// Расширение протокола для реализации общих методов для автомобилей
extension CarProtocol {

    // MARK: - Вычисляемое поле
    /// Вычисляемое свойство для вывода бренда и модели в одной строке
    var fullCarName: String {
        return "\(brand) \(model)"
    }

    // MARK: - Реализация общих методов
    mutating func startEngine() {
        isEngineRunning = true
        print("\(fullCarName): Двигатель запущен")
    }

    mutating func stopEngine() {
        isEngineRunning = false
        print("\(fullCarName): Двигатель остановлен")
    }

    mutating func openWindow() {
        isWindowOpen = true
        print("\(fullCarName): Окно открыто")
    }

    mutating func closeWindow() {
        isWindowOpen = false
        print("\(fullCarName): Окно закрыто")
    }

    mutating func openDoor() {
        isDoorOpen = true
        print("\(fullCarName): Дверь открыта")
    }

    mutating func closeDoor() {
        isDoorOpen = false
        print("\(fullCarName): Дверь закрыта")
    }

    mutating func turnOnLights(what lights: String) {
        isLightsOn = true
        print("\(fullCarName): Включены \(lights) огни")
    }

    mutating func turnOffLights(what lights: String) {
        isLightsOn = false
        print("\(fullCarName): Выключены \(lights) огни")
    }

    mutating func openBonnet() {
        isBonnetOpen = true
        print("\(fullCarName): Капот открыт")
    }

    mutating func closeBonnet() {
        isBonnetOpen = false
        print("\(fullCarName): Капот закрыт")
    }

    func about() {
        print("""
        ------------------------------------------------------------
        Подробная информация автомобиля \(fullCarName):
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


final class SportCar: CarProtocol {

    // MARK: - Публичные свойства
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

    // MARK: - Приватные свойства
    private let trunkCapacity: Double
    private var spaceOccupied: Double
    private let isThereThirdRowSeats: Bool
    private var isSpoilerInstalled: Bool
    private var isAutopilotOn: Bool
    private var isTrunkOpen: Bool
    private var isRoofOpen: Bool

    // MARK: - Инициализатор с дефолт параметрами
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

    // MARK: - Публичные методы
    /// Загрузка багажа
    func putBaggage(liters baggage: Double) {

        if spaceOccupied + baggage <= trunkCapacity {
            print("\(fullCarName): К \(spaceOccupied) литров объёма багажа добавлено \(baggage).", terminator: " ")

            spaceOccupied += baggage

            print("Осталось места на \(trunkCapacity - spaceOccupied) литров багажа")
        } else {
            print("""
            \(fullCarName): Загрузка \(baggage) литров багажа невозможна -
            превышается максимальная вместимость багажника \(trunkCapacity)
            """)
        }
    }

    /// Разгрузка багажа
    func takeBaggage(liters baggage: Double) {

        if spaceOccupied - baggage < 0 {
            print("\(fullCarName): Из \(spaceOccupied) литров объёма багажа взято \(baggage).", terminator: " ")

            spaceOccupied -= baggage

            print("Осталось \(trunkCapacity - spaceOccupied) литров багажа")
        } else {
            print("\(fullCarName): Невозможно взять багажа больше, чем имеется в багажнике (\(baggage))")
        }
    }

    /// Установка спойлера
    func installSpoiler() {
        isSpoilerInstalled = true
        print("\(fullCarName): Спойлер установлен!")
    }

    /// Снятие спойлера
    func uninstallSpoiler() {
        isSpoilerInstalled = false
        print("\(fullCarName): Спойлер снят!")
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


// MARK: - CustomStringConvertible

extension SportCar: CustomStringConvertible {
    var description: String {
        return "\(fullCarName) - экземпляр класса легкового автомобиля (SportCar)"
    }
}


final class TrunkCar: CarProtocol {

    // MARK: - Публичные поля
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

    // MARK: - Приватные поля
    private var spaceOccupied: Double
    private let bodyLength: Double
    private let bodyCapacity: Double
    private let carrying: Double
    private var isBodyLowered: Bool
    private var isFlashersOn: Bool
    private var isTrailerHitched: Bool
    private var isCargoHandling: Bool

    // MARK: - Инициализатор с дефолт параметрами
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
         bodyLength: Double,
         bodyCapacity: Double,
         carrying: Double,
         spaceOccupied: Double = 0,
         isBodyLowered: Bool = false,
         isFlashersOn: Bool = false,
         isTrailerHitched: Bool = false,
         isCargoHandling: Bool = false)
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
        self.bodyLength = bodyLength
        self.bodyCapacity = bodyCapacity
        self.carrying = carrying
        self.spaceOccupied = spaceOccupied
        self.isBodyLowered = isBodyLowered
        self.isFlashersOn = isFlashersOn
        self.isTrailerHitched = isTrailerHitched
        self.isCargoHandling = isCargoHandling
    }

    // MARK: - Публичные методы
    /// Загрузка груза
    func putCargo(tons cargo: Double) {

        if spaceOccupied + cargo <= bodyCapacity {
            print("\(fullCarName): К \(spaceOccupied) тонн груза загружено \(cargo).", terminator: " ")

            spaceOccupied += cargo

            print("Осталось места на \(bodyCapacity - spaceOccupied) тонн груза")
        } else {
            print("""
            \(fullCarName): Загрузка \(cargo) тонн груза невозможна -
            превышается максимальная вместимость кузова \(bodyCapacity)
            """)
        }
    }

    /// Разгрузка груза
    func takeCargo(tons cargo: Double) {

        if spaceOccupied - cargo >= 0 {
            print("\(fullCarName): Из \(spaceOccupied) тонн груза выгружено \(cargo).", terminator: " ")

            spaceOccupied -= cargo

            print("Осталось \(spaceOccupied) тонн груза")
        } else {
            print("\(fullCarName): Невозможно выгрузить груза больше, чем имеется в кузове (\(cargo))")
        }
    }

    /// Сцепка с кузовом
    func startCargoHandling() {
        if isCargoHandling {
            print("\(fullCarName): Процесс погрузки/разгрузки уже запущен")
        } else {
            isCargoHandling = true
            print("\(fullCarName): Процесс погрузки/разгрузки запущен")
        }
    }

    /// Расцепка с кузовом
    func stopCargoHandling() {
        if isCargoHandling {
            isCargoHandling = false
            print("\(fullCarName): Процесс погрузки/разгрузки остановлен")
        } else {
            print("\(fullCarName): Процесс погрузки/разгрузки уже остановлен")
        }
    }

    func about() {
        print("""
        ------------------------------------------------------------
        Подробная информация о грузовом автомобиле \(fullCarName):
        ------------------------------------------------------------
        Тип двигателя: \(engineType)
        Тип трансмиссии: \(transmission)
        Год производства: \(manufactureYear)
        Пробег в км.: \(carMileage)
        Объём топлива в бензобаке в л.: \(fuelAmount)
        Мощность двигателя в л. с.: \(horsePower)
        Длина кузова м.: \(bodyLength)
        Вместимость кузова в т.: \(bodyCapacity)
        Занятое место в кузове в т.: \(spaceOccupied)
        Грузоподъёмность в т.: \(carrying)
        Двигатель запущен - \(isEngineRunning)
        Окно открыто - \(isWindowOpen)
        Дверь открыта - \(isDoorOpen)
        Габаритные огни включены - \(isLightsOn)
        Капот открыт - \(isBonnetOpen)
        Кузов опущен - \(isBodyLowered)
        Мигалки включены - \(isFlashersOn)
        Трейлер прицеплен - \(isTrailerHitched)
        Процесс погрузки/разгрузки запущен - \(isCargoHandling)
        ------------------------------------------------------------
        """)
    }
}


// MARK: - CustomStringConvertible

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "\(fullCarName) - экземпляр класса грузового автомобиля (TrunkCar)"
    }
}


// MARK: - Создание экземпляров

var audiR8 = SportCar(brand: "Audi",
                      model: "R8",
                      engineType: "Gasoline",
                      transmission: "Automatic",
                      manufactureYear: 2020,
                      carMileage: 10746,
                      horsePower: 385,
                      fuelAmount: 230,
                      trunkCapacity: 150)

var mercedesBenzE350 = SportCar(brand: "Mercedes Benz",
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

var volvoF90 = TrunkCar(brand: "Volvo",
                        model: "F90",
                        engineType: "Diesel",
                        transmission: "Manual",
                        manufactureYear: 2017,
                        carMileage: 364000,
                        horsePower: 850,
                        fuelAmount: 600,
                        bodyLength: 13,
                        bodyCapacity: 90,
                        carrying: 150)

var	daimlerTruck = TrunkCar(brand: "Daimler",
                            model: "Truck",
                            engineType: "Electrical",
                            transmission: "Robotic",
                            manufactureYear: 2021,
                            carMileage: 90365,
                            horsePower: 580,
                            fuelAmount: 670,
                            isEngineRunning: false,
                            isWindowOpen: false,
                            isDoorOpen: true,
                            isLightsOn: true,
                            isBonnetOpen: false,
                            bodyLength: 8,
                            bodyCapacity: 20,
                            carrying: 30,
                            isBodyLowered: true,
                            isFlashersOn: false,
                            isTrailerHitched: true,
                            isCargoHandling: false)


// MARK: - Демонстрация метода about

audiR8.about()
mercedesBenzE350.about()

volvoF90.about()
daimlerTruck.about()


// MARK: - Демонстрация работы функций

audiR8.carMileage += 10
audiR8.startEngine()
audiR8.putBaggage(liters: 35.89)
audiR8.turnOnLights(what: "передние")

mercedesBenzE350.openWindow()
mercedesBenzE350.openDoor()
mercedesBenzE350.openBonnet()
mercedesBenzE350.startEngine()
mercedesBenzE350.installSpoiler()
mercedesBenzE350.uninstallSpoiler()

volvoF90.startEngine()
volvoF90.startCargoHandling()
volvoF90.putCargo(tons: 20)
volvoF90.takeCargo(tons: 13.42)
volvoF90.stopCargoHandling()
volvoF90.stopEngine()

daimlerTruck.turnOnLights(what: "передние и задние габаритные")
daimlerTruck.turnOffLights(what: "передние и задние габаритные")

print("------------------------------------------------------------")


// MARK: - Демонстрация работы CustomStringConvertible

print(audiR8)
print(mercedesBenzE350)
print(volvoF90)
print(daimlerTruck)
