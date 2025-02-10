import UIKit

final class ViewController: UIViewController {
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "현재 RGB값: x, y, z"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(colorLabel)
        NSLayoutConstraint.activate([
            colorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
