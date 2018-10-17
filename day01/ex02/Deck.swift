import Foundation

class Deck: NSObject {
    static let allSpades: [Card] = Value.allValues.map{return Card(color: Color.grey, value: $0) }
    static let allDiamonds: [Card] = Value.allValues.map{return Card(color: Color.blush, value: $0)}
    static let allHearts: [Card] = Value.allValues.map{return Card(color: Color.red, value: $0) }
    static let allClubs: [Card] = Value.allValues.map{return Card(color: Color.black, value: $0)}
    static let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs
}