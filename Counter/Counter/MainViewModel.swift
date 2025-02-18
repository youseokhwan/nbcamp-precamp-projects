import Foundation
import Combine

final class MainViewModel: ObservableObject {
    private let maxCount = 10
    private let minCount = -10

    @Published private(set) var count = 0
    @Published private(set) var plusButtonIsEnabled = true
    @Published private(set) var minusButtonIsEnabled = true

    func increaseCount() {
        count = min(count + 1, maxCount)
        updateButtonStates()
    }

    func decreaseCount() {
        count = max(count - 1, minCount)
        updateButtonStates()
    }

    func resetCount() {
        count = 0
        updateButtonStates()
    }

    private func updateButtonStates() {
        plusButtonIsEnabled = count < maxCount
        minusButtonIsEnabled = count > minCount
    }
}
