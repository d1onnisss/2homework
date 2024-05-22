//
//  TableView.swift
//  iOS-UI4-hw2
//
//  Created by Alexey Lim on 15/5/24.
//

import Foundation
import UIKit

class TableView: UIViewController, UITableViewDataSource {
  
    private lazy var backBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "arrowLeft"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var myContactsLabel: UILabel = {
        let label = UILabel()
        label.text = "My Contacts"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contactTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .systemGray6
        setupUI()
        
        setupData()
        
        backBtn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        contactTableView.dataSource = self
    }
    
    private func setupData() {
        contacts = [
            Contact(image: "Jane", fullName: "Jane Cooper", phoneNumber: "(270)555-0117"),
            Contact(image: "Devon", fullName: "Devon Lane", phoneNumber: "(308)555-0121"),
            Contact(image: "Darrell", fullName: "Darrell Steward", phoneNumber: "(684)555-0102"),
            Contact(image: "Devon L", fullName: "Devon Lane", phoneNumber: "(704)555-0127"),
            Contact(image: "Courtney", fullName: "Courtney Henry", phoneNumber: "(505)555-0125"),
            Contact(image: "Bessie", fullName: "Bessie Cooper", phoneNumber: "(406)555-0120"),
            Contact(image: "Robert", fullName: "Robert Fox", phoneNumber: "(480)555-0103"),
            Contact(image: "Jacob", fullName: "Jacob Jones", phoneNumber: "(702)555-0122"),
            Contact(image: "Jenny", fullName: "Jenny Wilson", phoneNumber: "(239)555-0108")
        ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.imageView?.image = UIImage(named: contacts[indexPath.row].image)
        cell.textLabel?.text = contacts[indexPath.row].fullName
        cell.detailTextLabel?.text = contacts[indexPath.row].phoneNumber
        
        return cell
    }
    
    @objc func backBtnTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupUI() {
        backBtnConfig()
        myContactsLabelConfig()
        contactTableViewConfig()
    }
    
    private func backBtnConfig() {
        view.addSubview(backBtn)
        
        NSLayoutConstraint.activate(
        [
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            backBtn.heightAnchor.constraint(equalToConstant: 24),
            backBtn.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func myContactsLabelConfig() {
        view.addSubview(myContactsLabel)
        
        NSLayoutConstraint.activate(
        [
            myContactsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myContactsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func contactTableViewConfig() {
        view.addSubview(contactTableView)
        
        NSLayoutConstraint.activate(
        [
            contactTableView.topAnchor.constraint(equalTo: myContactsLabel.bottomAnchor, constant: 6),
            contactTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contactTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contactTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
