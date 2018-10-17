var card = Card(color: Color.red, value: Value.ace)
var card2 = Card(color: Color.black, value: Value.two)
var card3 = Card(color: Color.black, value: Value.two)
var str: String = "somewhere"

print(card)
print("lll \(card.isEqual(card))")
print("lll \(card.isEqual(card2))")
print("lll \(card2.isEqual(card3))")
print("lll \(card.isEqual(str))")

print("\nlll \(String(card == card))")
print("lll \(String(card == card2))")
print("lll \(String(card2 == card3))")