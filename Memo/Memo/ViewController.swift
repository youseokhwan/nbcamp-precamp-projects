import UIKit
import SnapKit

final class ViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    private let dummyData = ["1", "2", "3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

private extension ViewController {
    func configure() {
        configureNavigationController()
        configureLayout()
        configureConstraints()
    }

    func configureNavigationController() {
        view.backgroundColor = .systemBackground
        title = "메모"

        let addMemoButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapAddMemoButton)
        )
        navigationItem.rightBarButtonItem = addMemoButton
    }

    func configureLayout() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }

    func configureConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    @objc func didTapAddMemoButton() {
        print(#function)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = dummyData[indexPath.row]
        return cell
    }
}
