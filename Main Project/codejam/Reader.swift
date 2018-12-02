import Foundation

final class Reader {
  static func read() -> [String] {
    let input = "/Users/bruno.rocha/Desktop/PersonalCodes/advent-of-code-2018/Main Project/in.in"
    let url = URL(fileURLWithPath: input)
    let temp = try! String(contentsOf: url, encoding: String.Encoding.utf8)
    return temp.components(separatedBy: "\n")
  }
}
