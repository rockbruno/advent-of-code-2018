import Foundation

// First half

let input = Reader.read()

var matrix: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 1000), count: 1000)
var overlapping = 0

func process(_ line: String) -> (x: Int, y: Int, w: Int, h: Int) {
    let data = line.components(separatedBy: "@ ")[1]
    let contents = data.components(separatedBy: ": ")
    let pos = contents[0].components(separatedBy: ",")
    let size = contents[1].components(separatedBy: "x")
    return (Int(pos[0])!, Int(pos[1])!, Int(size[0])!, Int(size[1])!)
}

for line in input {
    let data = process(line)
    let x = data.x
    let y = data.y
    let w = data.w
    let h = data.h
    for i in 0..<w {
        for j in 0..<h {
            matrix[y+j][x+i] += 1
            if matrix[y+j][x+i] == 2 {
                overlapping += 1
            }
        }
    }
}

print(overlapping)

// Second half
// You could probably do this in a single pass I guess.

outer: for line in input {
    let data = process(line)
    let x = data.x
    let y = data.y
    let w = data.w
    let h = data.h
    for i in 0..<w {
        for j in 0..<h {
            if matrix[y+j][x+i] > 1 {
                continue outer
            }
        }
    }
    print(line)
}
