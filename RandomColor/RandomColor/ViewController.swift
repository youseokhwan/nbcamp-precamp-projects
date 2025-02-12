import UIKit

final class ViewController: UIViewController {
    private var color = Color()
    
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = color.rgbText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var changeColorButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Color", for: .normal)
        button.addTarget(self, action: #selector(changeRandomBackgroundColor), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.addTarget(self, action: #selector(resetBackgroundColor), for: .touchUpInside)
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

        configureViews()
        configureConstraints()
    }

    @objc private func changeRandomBackgroundColor() {
        color.updateRandomRGB()
        view.backgroundColor = UIColor(color)
        colorLabel.text = color.rgbText
    }
    
    @objc private func resetBackgroundColor() {
        color.resetRGB()
        view.backgroundColor = UIColor(color)
        colorLabel.text = color.rgbText
    }
}

private extension ViewController {
    func configureViews() {
        view.addSubview(colorLabel)
        view.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(changeColorButton)
        buttonsStackView.addArrangedSubview(resetButton)
    }

    func configureConstraints() {
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
