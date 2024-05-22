//
//  ViewController.swift
//  iOS-UI4-hw2
//
//  Created by Alexey Lim on 15/5/24.
//

import UIKit

class LoginController: UIViewController {
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "User")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var welcomeBackLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back , Rohit thakur"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var phoneImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Phone")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var enterNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter Your Mobile Number"
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var enterNumberTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Number"
        tf.textColor = .black
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.font = .systemFont(ofSize: 13, weight: .regular)
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 1))
        tf.leftView = leftView
        tf.leftViewMode = .always
        return tf
    }()
    
    private lazy var changeNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Change Number ?"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemPink
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private lazy var googleImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Google")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var googleLabel: UILabel = {
        let label = UILabel()
        label.text = "Google"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dontHaveAccLabel: UILabel = {
        let label = UILabel()
        label.text = "You Don’t have an account ?"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dontHaveAccStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupUI()
        
        loginBtn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
    }
    
    @objc func loginBtnTapped(_ sender: UIButton) {
        let vc = TableView()
    
        if let phoneNumber = enterNumberTF.text, (phoneNumber.hasPrefix("+996") && phoneNumber.count == 13) || (phoneNumber.hasPrefix("996") && phoneNumber.count == 12) {
            navigationController?.pushViewController(vc, animated: true)
        } else {
            enterNumberTF.layer.borderColor = UIColor.red.cgColor
            enterNumberTF.placeholder = "Введите номер в формате 996 или +996"
        }
    }

    private func setupUI() {
        loginLabelConfig()
        userImageViewComfig()
        welcomeBackLabelConfig()
        phoneImageViewConfig()
        enterNumberLabelConfig()
        enterNumberTFConfig()
        changeNumberLabelConfig()
        loginBtnConfig()
        googleImageViewConfig()
        googleLabelConfig()
        dontHaveAccLabelConfig()
    }
    
    private func loginLabelConfig() {
        view.addSubview(loginLabel)
        
        NSLayoutConstraint.activate(
        [
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func userImageViewComfig() {
        view.addSubview(userImageView)
        
        NSLayoutConstraint.activate(
        [
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userImageView.leadingAnchor.constraint(equalTo: loginLabel.trailingAnchor, constant: 4)
        ])
    }
    
    private func welcomeBackLabelConfig() {
        view.addSubview(welcomeBackLabel)
        
        NSLayoutConstraint.activate(
        [
            welcomeBackLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 4),
            welcomeBackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func phoneImageViewConfig() {
        view.addSubview(phoneImageView)
        
        NSLayoutConstraint.activate(
        [
            phoneImageView.topAnchor.constraint(equalTo: welcomeBackLabel.bottomAnchor, constant: 42),
            phoneImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            phoneImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            phoneImageView.heightAnchor.constraint(equalToConstant: 230)
        ])
    }
    
    private func enterNumberLabelConfig() {
        view.addSubview(enterNumberLabel)
        
        NSLayoutConstraint.activate(
        [
            enterNumberLabel.topAnchor.constraint(equalTo: phoneImageView.bottomAnchor, constant: 26),
            enterNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func enterNumberTFConfig() {
        view.addSubview(enterNumberTF)
        
        NSLayoutConstraint.activate(
        [
            enterNumberTF.topAnchor.constraint(equalTo: enterNumberLabel.bottomAnchor, constant: 22),
            enterNumberTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterNumberTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterNumberTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            enterNumberTF.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func changeNumberLabelConfig() {
        view.addSubview(changeNumberLabel)
        
        NSLayoutConstraint.activate(
        [
            changeNumberLabel.topAnchor.constraint(equalTo: enterNumberTF.bottomAnchor, constant: 12),
            changeNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26)
        ])
    }
    
    private func loginBtnConfig() {
        view.addSubview(loginBtn)
        
        NSLayoutConstraint.activate(
        [
            loginBtn.topAnchor.constraint(equalTo: changeNumberLabel.bottomAnchor, constant: 22),
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginBtn.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func googleImageViewConfig() {
        view.addSubview(googleImageView)
        
        NSLayoutConstraint.activate(
        [
            googleImageView.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 50),
            googleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140),
            googleImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func googleLabelConfig() {
        view.addSubview(googleLabel)
        
        NSLayoutConstraint.activate(
        [
            googleLabel.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 50),
            googleLabel.leadingAnchor.constraint(equalTo: googleImageView.trailingAnchor, constant: 8)
        ])
    }
    
    private func dontHaveAccLabelConfig() {
        view.addSubview(dontHaveAccStackView)
    
        dontHaveAccStackView.addArrangedSubview(dontHaveAccLabel)
        dontHaveAccStackView.addArrangedSubview(signUpLabel)
        
        NSLayoutConstraint.activate(
        [
            dontHaveAccStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            dontHaveAccStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dontHaveAccStackView.widthAnchor.constraint(equalToConstant: 210)
        ])
    }
    
    // ndnvjfdvn
}

