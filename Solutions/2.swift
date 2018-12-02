import Foundation

// First half

let input = Reader.read()
var two = 0
var three = 0

for box in input {
    autoreleasepool {
        var dict = [Character: Int]()
        for c in box {
            dict[c, default: 0] += 1
        }
        var hasTwo = false
        var hasThree = false
        for (k, v) in dict {
            if v == 2 && hasTwo == false {
                hasTwo = true
                two += 1
            } else if v == 3 && hasThree == false {
                hasThree = true
                three += 1
            }
        }
    }
}

print(two * three)

// Second half

func uniqueMismatch(_ a: String, _ b: String) -> String? {
    var indexA = a.startIndex
    var indexB = b.startIndex
    var firstMismatchIndex: String.Index? = nil
    while indexA != a.endIndex && indexB != b.endIndex {
        if a[indexA] != b[indexB] {
            if firstMismatchIndex != nil {
                return nil
            } else {
                firstMismatchIndex = indexA
            }
        }
        indexA = a.index(after: indexA)
        indexB = b.index(after: indexB)
    }
    guard let mismatch = firstMismatchIndex else {
        return nil
    }
    var a = a
    a.remove(at: mismatch)
    return a
}

for i in 0..<input.count {
    let boxA = input[i]
    for j in (i+1)..<input.count {
        let boxB = input[j]
        if let mismatch = uniqueMismatch(boxA, boxB) {
            print(mismatch)
        }
    }
}
