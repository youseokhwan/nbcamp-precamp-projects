import UIKit

final class ViewController: UIViewController {
    private var color = Color()

    private lazy var colorView: ColorView = {
        let colorView = ColorView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        return colorView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }

    @objc private func didUpdatedRGB() {
        DispatchQueue.main.async {
            self.view.backgroundColor = UIColor(self.color)
            self.colorView.updateColorLabelText(self.color.rgbText)
        }
    }
}

private extension ViewController {
    func configures() {
        configureViews()
        configureConstraints()
        configureNotifications()
    }

    func configureViews() {
        view.addSubview(colorView)
        colorView.delegate = self
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            colorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func configureNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didUpdatedRGB),
                                               name: .didUpdatedRGB,
                                               object: nil)
    }
}

extension ViewController: ColorViewDelegate {
    func didTapChangeColorButton() {
        color.updateRandomRGB()
    }

    func didTapResetButton() {
        color.resetRGB()
    }
}
