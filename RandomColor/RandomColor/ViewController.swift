import UIKit

final class ViewController: UIViewController {
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "현재 RGB값: x, y, z"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var changeColorButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Color", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(colorLabel)
        buttonsStackView.addArrangedSubview(changeColorButton)
        buttonsStackView.addArrangedSubview(resetButton)
        view.addSubview(buttonsStackView)

        NSLayoutConstraint.activate([
            colorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
