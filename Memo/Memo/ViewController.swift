import UIKit
import SnapKit

final class ViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    private var memos = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        loadMemos()
    }

    @objc private func didTapAddMemoButton() {
        let alert = UIAlertController(title: "새 메모", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "메모를 입력하세요"
        }

        let addAction = UIAlertAction(title: "추가", style: .default) { _ in
            if let text = alert.textFields?.first?.text, !text.isEmpty {
                self.memos.append(text)
                self.tableView.reloadData()
                self.saveMemos()
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .destructive)
        alert.addAction(addAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }

    private func loadMemos() {
        memos = UserDefaults.standard.stringArray(forKey: "memos") ?? []
    }

    private func saveMemos() {
        UserDefaults.standard.set(memos, forKey: "memos")
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
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return memos.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = memos[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            memos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            saveMemos()
        }
    }
}
