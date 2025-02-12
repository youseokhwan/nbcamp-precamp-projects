import UIKit

final class ViewController: UIViewController {
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "R: 255, G: 255, B: 255"
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
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorLabel.text = "R: \(Int(red * 255)), G: \(Int(green * 255)), B: \(Int(blue * 255))"
    }
    
    @objc private func resetBackgroundColor() {
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        colorLabel.text = "R: 255, G: 255, B: 255"
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
