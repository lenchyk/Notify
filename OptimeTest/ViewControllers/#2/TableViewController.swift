//
//  TableViewController.swift
//  OptimeTest
//
//  Created by Lena Soroka on 06.10.2022.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    struct Props {
        // data
        var data: [[PersonData]]
        var sections: [String]
        
        // callbacks
        var readAllButtonPressed: () -> ()
        var personCellIsSelected: () -> ()
        var messageRequestFilterChosen: () -> ()
        var allFilterChosen: () -> ()
    }
    
    @IBOutlet private var notificationsTableView: UITableView!
    @IBOutlet private var segmentedControl: UISegmentedControl!
    var props: Props?
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
        configureTableView()
        configureDataSource()
    }
    
    private func configureUI() {
        addBarItem()
    }
    
    private func configureTableView() {
        notificationsTableView.delegate = self
        notificationsTableView.dataSource = self
        notificationsTableView.register(
            PersonTableViewCell.nib(),
            forCellReuseIdentifier: Constants.cellIdentifier
        )
    }
    
    private func addBarItem() {
        let rightBarButton = UIBarButtonItem(title: "Read All", style: .plain, target: self, action: #selector(readAllAction(_:)))
        navigationItem.setRightBarButton(rightBarButton, animated: true)
    }
    
    @objc func readAllAction(_ sender: Any) {
        print("Read all!!!")
    }
    
    private func configureDataSource() {
        let data = [
            [
                PersonData(
                    personImage: nil,
                    request: "Message Request",
                    name: "Kate Thomson",
                    isRead: false
                )
            ],
            [
                PersonData(
                    personImage: nil,
                    request: "Group Request",
                    name: "Jack Jones",
                    isRead: true
                ),
                PersonData(
                    personImage: nil,
                    request: "Joined \"app\"",
                    name: "Anna Taylor",
                    isRead: false
                ),
                PersonData(
                    personImage: nil,
                    request: "Message Request",
                    name: "Ted Walker",
                    isRead: false
                ),
                PersonData(
                    personImage: nil,
                    request: "Message Request",
                    name: "Mary West",
                    isRead: true
                ),
                PersonData(
                    personImage: nil,
                    request: "Inviting you to share profile",
                    name: "Alfa inc.",
                    isRead: true
                ),
                PersonData(
                    personImage: nil,
                    request: "Inviting you to transfer profile",
                    name: "Alfa inc.",
                    isRead: true
                )
            ]
        ]
        let sections = ["Today", "Yesterday"]
        props = Props(
            data: data,
            sections: sections,
            readAllButtonPressed: {}, personCellIsSelected: {},
            messageRequestFilterChosen: {}, allFilterChosen: {}
        )
        notificationsTableView.reloadData()
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return props?.data[section].count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return props?.sections.count ?? 1
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return props?.sections[section]
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
        
        if let person = props?.data[indexPath.section][indexPath.row] {
            cell.configure(with: person)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: Constants.headerHeight))
        headerView.backgroundColor = .white
        let title = UILabel()
        title.frame = CGRect(x: 15, y: 0, width: tableView.frame.width - 15, height: Constants.headerHeight)
        title.font = .boldSystemFont(ofSize: 18)
        title.text = props?.sections[section]
        title.textColor = .black
        headerView.addSubview(title)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
