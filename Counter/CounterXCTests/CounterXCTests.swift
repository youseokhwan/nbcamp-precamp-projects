import XCTest

final class CounterXCTests: XCTestCase {
    var viewModel: MainViewModel!

    override func setUp() {
        super.setUp()
        viewModel = MainViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func test_초기_상태() throws {
        XCTAssertEqual(viewModel.count, 0)
        XCTAssertTrue(viewModel.plusButtonIsEnabled)
        XCTAssertTrue(viewModel.minusButtonIsEnabled)
    }

    func test_카운트_증가() throws {
        viewModel.increaseCount()
        XCTAssertEqual(viewModel.count, 1)
    }

    func test_카운트_감소() throws {
        viewModel.decreaseCount()
        XCTAssertEqual(viewModel.count, -1)
    }

    func test_카운트_리셋() throws {
        viewModel.increaseCount()
        viewModel.increaseCount()
        viewModel.increaseCount()
        viewModel.resetCount()
        XCTAssertEqual(viewModel.count, 0)
    }

    func test_카운트_최댓값() throws {
        (0...9).forEach { _ in
            viewModel.increaseCount()
        }
        XCTAssertEqual(viewModel.count, 10)
        XCTAssertFalse(viewModel.plusButtonIsEnabled)
        viewModel.increaseCount()
        XCTAssertEqual(viewModel.count, 10)
        XCTAssertFalse(viewModel.plusButtonIsEnabled)
        viewModel.decreaseCount()
        XCTAssertEqual(viewModel.count, 9)
        XCTAssertTrue(viewModel.plusButtonIsEnabled)
    }

    func test_카운트_최솟값() throws {
        (0...9).forEach { _ in
            viewModel.decreaseCount()
        }
        XCTAssertEqual(viewModel.count, -10)
        XCTAssertFalse(viewModel.minusButtonIsEnabled)
        viewModel.decreaseCount()
        XCTAssertEqual(viewModel.count, -10)
        XCTAssertFalse(viewModel.minusButtonIsEnabled)
        viewModel.increaseCount()
        XCTAssertEqual(viewModel.count, -9)
        XCTAssertTrue(viewModel.plusButtonIsEnabled)
    }
}
