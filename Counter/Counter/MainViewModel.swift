import Foundation
import Combine

final class MainViewModel: ObservableObject {
    @Published private(set) var count = 0

    func increaseCount() {
        count += 1
    }

    func decreaseCount() {
        count -= 1
    }

    func resetCount() {
        count = 0
    }
}
