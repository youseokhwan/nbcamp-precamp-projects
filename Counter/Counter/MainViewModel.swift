import Foundation

struct MainViewModel {
    private(set) var count = 0

    mutating func increaseCount() {
        count += 1
    }

    mutating func decreaseCount() {
        count -= 1
    }
}
