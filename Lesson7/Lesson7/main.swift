//
//  main.swift
//  Lesson7
//
//  Created by Artem Mayer on 27.02.2022.
//

import Foundation


// MARK: - Error
enum PurchaseError: Error {
    case errorInvalidName
    case errorNotEnoughMoney
    case errorQuantityCar
    case errorInvalidType
}


// MARK: - LocalizedError
extension PurchaseError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .errorInvalidName:
            return NSLocalizedString("Машина с указаным названием отсутствует в автосалоне", comment: "")
        case .errorNotEnoughMoney:
            return NSLocalizedString("Недостаточно денег для покупки", comment: "")
        case .errorQuantityCar:
            return NSLocalizedString("Машины нет в наличии у диллера", comment: "My error")
        case .errorInvalidType:
            return NSLocalizedString("При покупке выбран неверный метод типа автомобиля", comment: "My error")
        }
    }
}


// MARK: - Car
struct Car {

    // MARK: - Public properties
    let price: Double
    var count: Int

    let sportCar: SportCar?
    let truckCar: TruckCar?


    // MARK: - Init
    init(price: Double,
         count: Int,
         sportCar: SportCar?,
         truckCar: TruckCar?)
    {
        self.price = price
        self.count = count
        self.sportCar = sportCar
        self.truckCar = truckCar
    }
}


// MARK: - TruckCar
struct TruckCar {

    // MARK: - Public properties
    let brand: String
    let model: String
    let engineType: String
    let bodyType: String
    let transmission: String
    let manufactureYear: Int
    let carMileage: Int
    let bodyLength: Double
    let bodyCapacity: Double
    let isEngineRunning: Bool


    // MARK: - Computed property
    var carFullName: String {
        return "\(brand) \(model)"
    }


    // MARK: - Init
    init(brand: String,
         model: String,
         engineType: String,
         bodyType: String,
         transmission: String,
         manufactureYear: Int,
         carMileage: Int,
         bodyLength: Double,
         bodyCapacity: Double,
         isEngineRunning: Bool = false)
    {
        self.brand = brand
        self.model = model
        self.engineType = engineType
        self.bodyType = bodyType
        self.transmission = transmission
        self.manufactureYear = manufactureYear
        self.carMileage = carMileage
        self.bodyLength = bodyLength
        self.bodyCapacity = bodyCapacity
        self.isEngineRunning = isEngineRunning
    }

}

// MARK: - SportCar
struct SportCar {

    // MARK: - Public properties
    let brand: String
    let model: String
    let engineType: String
    let bodyType: String
    let transmission: String
    let manufactureYear: Int
    let carMileage: Int
    let isEngineRunning: Bool
    let trunkCapacity: Double
    let spaceOccupied: Double
    let isPanoramicRoof: Bool

    // MARK: - Computed property
    var carFullName: String {
        return "\(brand) \(model)"
    }


    // MARK: - Init
    init(brand: String,
         model: String,
         engineType: String,
         bodyType: String,
         transmission: String,
         manufactureYear: Int,
         carMileage: Int,
         trunkCapacity: Double,
         spaceOccupied: Double,
         isPanoramicRoof: Bool = false,
         isEngingRunning: Bool = false)
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
        self.isEngineRunning = isEngingRunning
    }
}


// MARK: - CarShowroom
final class CarShowroom {

    // MARK: - Public property
    var garage = ["Audi RS6": Car(price: 4567733,
                                  count: 1,
                                  sportCar: SportCar(brand: "Audi",
                                                     model: "RS6",
                                                     engineType: "Gasoline",
                                                     bodyType: "Sedan",
                                                     transmission: "Automatic",
                                                     manufactureYear: 2018,
                                                     carMileage: 89473,
                                                     trunkCapacity: 250.5,
                                                     spaceOccupied: 23,
                                                     isPanoramicRoof: false),
                                  truckCar: nil),
                  "BMW X7": Car(price: 13657823,
                                count: 2,
                                sportCar: SportCar(brand: "BMW",
                                                   model: "X7",
                                                   engineType: "Gasoline",
                                                   bodyType: "SUV",
                                                   transmission: "Automatic",
                                                   manufactureYear: 2022,
                                                   carMileage: 0,
                                                   trunkCapacity: 640.9,
                                                   spaceOccupied: 0),
                                truckCar: nil),
                  "Scania F80": Car(price: 7920912,
                                    count: 1,
                                    sportCar: nil,
                                    truckCar: TruckCar(brand: "Scania",
                                                       model: "F80",
                                                       engineType: "Hybrid",
                                                       bodyType: "Truck",
                                                       transmission: "Robotic",
                                                       manufactureYear: 2020,
                                                       carMileage: 350293,
                                                       bodyLength: 27.3,
                                                       bodyCapacity: 37500))]

    // MARK: - Private property
    private var coinDeposit: Double


    // MARK: - Computed property
    var getBalance: Double {
        return coinDeposit
    }


    // MARK: - Init
    init() {
        self.coinDeposit = 0
    }

    init(coinDeposit: Double) {
        self.coinDeposit = coinDeposit
    }


    // MARK: - Public methods
    /// Purchase of a sports car
    func purchaseSportCar(carName: String) -> SportCar? {

        guard let car = garage[carName],
              car.count > 0,
              car.price <= coinDeposit,
              car.sportCar != nil else {
                  return nil
              }

        var purchasedCar = car

        purchasedCar.count -= 1
        garage[carName] = purchasedCar

        print("Куплен спорткарт \(carName) за \(purchasedCar.price) руб.")

        coinDeposit -= purchasedCar.price

        print("Баланс депозита теперь \(coinDeposit) руб.")

        return purchasedCar.sportCar

    }

    /// Purchase of a truck
    func purchaseTruckCar(carName: String) throws -> TruckCar {

        guard let car = garage[carName] else { throw PurchaseError.errorInvalidName }
        guard car.count > 0 else { throw PurchaseError.errorQuantityCar }
        guard car.price <= coinDeposit else { throw PurchaseError.errorNotEnoughMoney }
        guard let purchasedCar = car.truckCar else { throw PurchaseError.errorInvalidType }

        var updateCar = car
        updateCar.count -= 1
        garage[carName] = updateCar

        print("Куплен грузовик \(carName) за \(updateCar.price) руб.")

        coinDeposit -= updateCar.price

        print("Баланс депозита теперь \(coinDeposit) руб.")

        return purchasedCar

    }

    /// Withdrawal of all money from the deposit
    func withdrawMoney() -> Double {
        let withdrawMoney = coinDeposit

        coinDeposit = 0

        print("Выведены все деньги с депозита (\(withdrawMoney) руб.)")

        return withdrawMoney
    }

    /// Adding money to the deposit
    func addMoney(_ amount: Double) {
        coinDeposit += amount

        print("Баланс = \(coinDeposit) руб.")
        print("Было: \(coinDeposit - amount) руб., внесено: \(amount) руб.")
    }
}


// MARK: SportCar CustomStringConvertible
extension SportCar: CustomStringConvertible {
    var description: String {
        return """
            \n\(carFullName) description
            ---------------------------------------------------
            Brand: \(brand)
            Model: \(model)
            Engine type: \(engineType)
            Body type: \(bodyType)
            Transmission type: \(transmission)
            Manufacture year: \(manufactureYear)
            Car mileage: \(carMileage)
            Engine is running - \(isEngineRunning)
            Trunk capacity: \(trunkCapacity)
            Space occupied: \(spaceOccupied)
            Roof is panoramic - \(isPanoramicRoof)
            ---------------------------------------------------\n
            """
    }
}


// MARK: - TruckCar CustomStringConvertible
extension TruckCar: CustomStringConvertible {
    var description: String {
        return """
            \n\(carFullName) description
            ---------------------------------------------------
            Brand: \(brand)
            Model: \(model)
            Engine type: \(engineType)
            Body type: \(bodyType)
            Transmission type: \(transmission)
            Manufacture year: \(manufactureYear)
            Car mileage: \(carMileage)
            Engine is running - \(isEngineRunning)
            Body length: \(bodyLength)
            Body capacity: \(bodyCapacity)
            ---------------------------------------------------\n
            """
    }
}


// MARK: - Demonstration of work
var carShowroom = CarShowroom()

carShowroom.addMoney(4_000_000)
carShowroom.addMoney(567_800.50)

var purchasedCar = carShowroom.purchaseSportCar(carName: "Audi RS6")
let myMoney = carShowroom.withdrawMoney()

print("Ваш баланс = \(carShowroom.getBalance) руб.")

if let audiRS6 = purchasedCar {
    print(audiRS6)
} else {
    print("Возникла ошибка при покупке")
}

// One approach
do {
    let scaniaF90 = try carShowroom.purchaseTruckCar(carName: "Scania F90")

    print(scaniaF90)
} catch let error {
    print(error.localizedDescription)
}

carShowroom.addMoney(15_746_273)

// Another approach
do {
    let scaniaF80 = try carShowroom.purchaseTruckCar(carName: "Scania F80")

    print(scaniaF80)
} catch PurchaseError.errorInvalidName {
    print("Машина с указаным названием отсутствует в автосалоне")
} catch PurchaseError.errorNotEnoughMoney {
    print("Недостаточно денег для покупки")
} catch PurchaseError.errorQuantityCar {
    print("Машины нет в наличии у диллера")
} catch PurchaseError.errorInvalidType {
    print("При покупке автомобиля выбран неверный метод типа автомобиля")
}
