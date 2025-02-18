import Testing

struct CounterSwiftTests {
    var viewModel: MainViewModel!

    init() async throws {
        viewModel = MainViewModel()
    }

    @Test func 초기_상태() async throws {
        #expect(viewModel.count == 0)
        #expect(viewModel.plusButtonIsEnabled)
        #expect(viewModel.minusButtonIsEnabled)
    }

    @Test func 카운트_증가() async throws {
        viewModel.increaseCount()
        #expect(viewModel.count == 1)
    }

    @Test func 카운트_감소() async throws {
        viewModel.decreaseCount()
        #expect(viewModel.count == -1)
    }

    @Test func 카운트_리셋() async throws {
        viewModel.increaseCount()
        viewModel.increaseCount()
        viewModel.increaseCount()
        viewModel.resetCount()
        #expect(viewModel.count == 0)
    }

    @Test func 카운트_최댓값() async throws {
        (0...9).forEach { _ in
            viewModel.increaseCount()
        }
        #expect(viewModel.count == 10)
        #expect(!viewModel.plusButtonIsEnabled)
        viewModel.increaseCount()
        #expect(viewModel.count == 10)
        #expect(!viewModel.plusButtonIsEnabled)
        viewModel.decreaseCount()
        #expect(viewModel.count == 9)
        #expect(viewModel.plusButtonIsEnabled)
    }

    @Test func 카운트_최솟값() async throws {
        (0...9).forEach { _ in
            viewModel.decreaseCount()
        }
        #expect(viewModel.count == -10)
        #expect(!viewModel.minusButtonIsEnabled)
        viewModel.decreaseCount()
        #expect(viewModel.count == -10)
        #expect(!viewModel.minusButtonIsEnabled)
        viewModel.increaseCount()
        #expect(viewModel.count == -9)
        #expect(viewModel.minusButtonIsEnabled)
    }
}
