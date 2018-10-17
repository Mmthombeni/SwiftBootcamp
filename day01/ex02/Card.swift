import Foundation

class Card: NSObject {
    var color: Color
    var value: Value
    override var description: String {
        return ("Deck cards are \(self.value.rawValue) \(self.color.rawValue)") 
    }

    init(color: Color, value: Value) {
        self.color = color
        self.value = value
    }

    override func isEqual(_ object: Any?) -> Bool {
        if let card = object as? Card{
            return (card.color == self.color && card.value == self.value)
        }
        return false
    }

    static func ==(lhs: Card, rhs: Card) -> Bool {
        return (lhs.color == rhs.color && lhs.value == rhs.value)
    }
}