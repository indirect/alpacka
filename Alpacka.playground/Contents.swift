import UIKit

var str = "Hello, playground"

let from = Date(timeIntervalSinceNow: -1000)
let di = Calendar.current.dateInterval(of: .day, for: from)

di?.description

let dif = DateIntervalFormatter()
dif.dateTemplate = "MMM d"
dif.string(from: Date(timeIntervalSinceNow: -100000), to: Date())
