import Foundation

// First half

let input = Reader.read()
let freqs = input.compactMap(Int.init)
print(freqs.reduce(0, +))

// Second half

var iterator = freqs.makeIterator()
var currentFreq = 0
var seenFreqs: Set<Int> = [0]

while true {
    if let freq = iterator.next() {
        currentFreq += freq
        if seenFreqs.contains(currentFreq) {
            print(currentFreq)
            break
        } else {
            seenFreqs.insert(currentFreq)
        }
    } else {
        iterator = freqs.makeIterator()
    }
}
