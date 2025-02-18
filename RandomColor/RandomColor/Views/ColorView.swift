import UIKit

final class ColorView: UIView {
    weak var delegate: ColorViewDelegate?

    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "R: 255, G: 255, B: 255"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var changeColorButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Color", for: .normal)
        button.addTarget(self, action: #selector(didTapChangeColorButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.addTarget(self, action: #selector(didTapResetButton), for: .touchUpInside)
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        configures()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configures()
    }

    @objc private func didTapChangeColorButton() {
        delegate?.didTapChangeColorButton()
    }

    @objc private func didTapResetButton() {
        delegate?.didTapResetButton()
    }

    func updateColorLabelText(_ text: String) {
        colorLabel.text = text
    }
}

private extension ColorView {
    func configures() {
        configureViews()
        configureConstraints()
    }

    func configureViews() {
        addSubview(colorLabel)
        addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(changeColorButton)
        buttonsStackView.addArrangedSubview(resetButton)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            colorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            colorLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
