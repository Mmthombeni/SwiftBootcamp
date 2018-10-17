import Foundation

class Deck: NSObject {
    static let allSpades: [Card] = Value.allValues.map{return Card(color: Color.grey, value: $0)}
    static let allDiamonds: [Card] = Value.allValues.map{return Card(color: Color.blush, value: $0)}
    static let allHearts: [Card] = Value.allValues.map{return Card(color: Color.red, value: $0)}
    static let allClubs: [Card] = Value.allValues.map{return Card(color: Color.black, value: $0)}
    static let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs
}


extension Array {
    func Shuffle() -> Array<Card> {
        var randomCards: Array<Card> = Deck.allCards
        var randomNumber: Int = 0
        var card: Card
        print("lol")

        for i in 0...51{
            print("\(String(randomNumber))")
            randomNumber = Int(arc4random_uniform(UInt32(51)))
            card = randomCards[i]
            randomCards[i] = randomCards[randomNumber]
            randomCards[randomNumber] = card
        }
        return randomCards
    }
}
