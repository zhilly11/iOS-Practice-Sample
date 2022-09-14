//
//  main.swift
//  nestedTest
//
//  Created by 최지혁 on 2022/09/01.
//

import Foundation

enum JuiceMakerError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
}

struct Juice {
    var amount: Int
    var price: Int
}

class JuiceMaker {
    var inventory = [
        "Strawberry Juice": Juice(amount: 500, price: 4500),
        "Kiwi Juice": Juice(amount: 300, price: 5000),
        "Watermelon Juice": Juice(amount: 1000, price: 3000)
    ]
    var coinsDeposited = 0
    
    func makeJuiceForResult(juiceNamed name: String) -> Result<Bool, JuiceMakerError> {
        guard let juice = inventory[name] else {
            return .failure(.invalidSelection)
        }
        guard juice.amount > 0 else {
            return .failure(.outOfStock)
        }
        guard juice.price <= coinsDeposited else {
            return .failure(.insufficientFunds(coinsNeeded: juice.price - coinsDeposited))
        }
        
        return .success(true)
    }
    
    
    func makeJuice(juiceNamed name: String) throws {
        guard let juice = inventory[name] else {
            throw JuiceMakerError.invalidSelection
        }
        
        guard juice.amount > 0 else {
            throw JuiceMakerError.outOfStock
        }
        
        guard juice.price <= coinsDeposited else {
            throw JuiceMakerError.insufficientFunds(coinsNeeded: juice.price - coinsDeposited)
        }
        
        coinsDeposited -= juice.price
        
        print("\(name) 나왔습니다~")
    }
}

var juicemaker = JuiceMaker()
juicemaker.coinsDeposited = 2000
let isMakeable = juicemaker.makeJuiceForResult(juiceNamed: "Watermelon Juice")
switch isMakeable {
case .success(let data):
    print(data)
case .failure(let error):
    print(error)
}


//
//do {
//    try juicemaker.makeJuice(juiceNamed: "Watermelon Juice")
//    print("쥬스 만들기 성공! 야미~")
//} catch JuiceMakerError.invalidSelection {
//    print("잘못된 선택 에러!")
//} catch JuiceMakerError.outOfStock {
//    print("재고 없음 에러!")
//} catch JuiceMakerError.insufficientFunds(let coinNeeded) {
//    print("금액 부족 에러! \(coinNeeded) 필요!")
//} catch {
//    print("알 수 없는 에러!")
//}









