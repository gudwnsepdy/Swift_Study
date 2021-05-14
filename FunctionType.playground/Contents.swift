
func couponDiscount(source:Double) -> Double{
    return source * 0.9
}

var additional:(Double) -> Double

let transaction032701 = 120.7

additional = addVAT

let price032701 = additional(transaction032701)

func finalPrice(source: Double, additional:(Double) -> Double) -> Double {
    let price = additional(source)
    
    return price
}

let price032702 = finalPrice(source: 350, additional: couponDiscount)

//: Session 5-3 Closure
let addVATClosure = { (source:Double) -> Double in
    return source * 1.1
}

let addVATClosure2 = { source  in
    return source * 1.1
}

let addVATClosure3 = { source  in
    source * 1.1
}

let addVATClosure4 = { $0 * 1.1 }

let price032703 = addVATClosure4(157.6)


let couponDiscountClosure = { (source:Double) -> Double in
    return source * 0.9
}
let couponDiscountClosure2 = { source in
    return source * 0.9
}
let couponDiscountClosure3 = { source in
    source * 0.9
}
let couponDiscountClosure4 = { $0 * 0.9}

let price32704 = couponDiscountClosure4(200)


func makeAdder (x:Int) -> (Int) -> Int {
    func adder(a:Int) -> Int {
        return x + a
    }
    return adder
}

func makeAdder2 (x:Int) -> (Int) -> Int {
    let adder:(Int) -> Int = {
        return $0 + x
    }
    return adder
}

//func makeAdder3 (x:Int) -> Int -> Int {
//    return{
//        return $0 + x
//    }
//}

let add5 = makeAdder2(x: 5)
//let add10 = makeAdder3(x: 10)

print(add5(2))
//print(add10(2))
//print(makeAdder3(5)(2))

let transactions = [560.0, 321.5, 190.0, 627.8, 1190.0, 450.0]

func addVAT(source:Double) -> Double {
    return source * 1.1
}

var vatPrices:[Double] = []

for transaction in transactions {
    vatPrices += [addVAT(source: transaction)]
}

let vatMapPrices = transactions.map({ transaction -> Double in
    return transaction * 1.1
})

let vatMapPrices2 = transactions.map({$0 * 1.1})

var bigTransactions:[Double] = []

for price in vatPrices {
    if price >= 500 {
        bigTransactions += [price]
    }
}

let bigFilterTransactions = vatPrices.filter {$0 >= 500}

var meetingRooms:[String:Int] = ["Banksy":4, "Rivera":8, "Picasso":10, "Cezanne":20, "Matisse":30]

let members = 9
let available = meetingRooms.filter { $0.1 > members}

print("\(available)")


//5-9 reduce

func priceSum (base: Double, adder:Double) -> Double {
    return base + adder
}

var sum: Double = 0.0

for price in vatPrices {
    sum = priceSum(base: sum, adder: price)
}

print("\(sum)")

var sum2: Double = 0.0

//let sumReduce = vatPrices.reduce(sum2, combine: priceSum)
//
//let sumReduce2 = vatPrices.reduce(0.0, <#T##nextPartialResult: (Result, Double) throws -> Result##(Result, Double) throws -> Result#>)

let sumReduce3 = vatPrices.reduce(0.0, +)
sumReduce3
