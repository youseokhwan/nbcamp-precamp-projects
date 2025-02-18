import UIKit
import SnapKit

final class MainViewController: UIViewController {
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "\(0)"
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
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        return button
    }()
    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        return button
    }()
    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

private extension MainViewController {
    func configure() {
        configureViews()
        configureConstraints()
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
            make.horizontalEdges.equalToSuperview().inset(100)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(50)
        }
    }
}
