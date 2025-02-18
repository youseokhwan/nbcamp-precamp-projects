import UIKit
import Combine
import SnapKit

final class MainViewController: UIViewController {
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32)
        return label
    }()
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Plus", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        return button
    }()
    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Minus", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.addTarget(self, action: #selector(didTapMinusButton), for: .touchUpInside)
        return button
    }()
    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.addTarget(self, action: #selector(didTapResetButton), for: .touchUpInside)
        return button
    }()

    private var viewModel = MainViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    @objc private func didTapPlusButton() {
        viewModel.increaseCount()
    }

    @objc private func didTapMinusButton() {
        viewModel.decreaseCount()
    }

    @objc private func didTapResetButton() {
        viewModel.resetCount()
    }
}

private extension MainViewController {
    func configure() {
        configureViews()
        configureConstraints()
        configureBind()
    }

    func configureViews() {
        view.addSubview(countLabel)
        view.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(plusButton)
        buttonsStackView.addArrangedSubview(minusButton)
        buttonsStackView.addArrangedSubview(resetButton)
    }

    func configureConstraints() {
        countLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        buttonsStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(50)
        }
    }

    func configureBind() {
        viewModel.$count
            .receive(on: DispatchQueue.main)
            .sink { [weak self] count in
                self?.countLabel.text = "\(count)"
            }
            .store(in: &cancellables)
        viewModel.$plusButtonIsEnabled
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isEnabled in
                self?.plusButton.isEnabled = isEnabled
            }
            .store(in: &cancellables)
        viewModel.$minusButtonIsEnabled
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isEnabled in
                self?.minusButton.isEnabled = isEnabled
            }
            .store(in: &cancellables)
    }
}
