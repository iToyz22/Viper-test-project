//
//  ViewController.swift
//  ProjectVIPER
//
//  Created by Maksim Malofeev on 21/06/2022.
//

import UIKit

protocol RegistrationScreenViewInput {
    var output: RegistrationScreenViewOutput? { get set }
}

protocol RegistrationScreenViewOutput {
    func userSelectRegistration(withLogin login: String, password: String)
}

final class RegistrationScreenView: UIViewController, RegistrationScreenViewInput {

    var output: RegistrationScreenViewOutput?

    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter your username"
        textField.font = UIFont(name: "Apple SD Gothic NEO", size: 16)
        textField.textColor =  #colorLiteral(red: 0.2789022923, green: 0.2789022923, blue: 0.2789022923, alpha: 1)
        textField.tintColor =  #colorLiteral(red: 0.5741509199, green: 0.5741508603, blue: 0.5741509199, alpha: 1)
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter your password"
        textField.font = UIFont(name: "Apple SD Gothic NEO", size: 16)
        textField.textColor =  #colorLiteral(red: 0.2789022923, green: 0.2789022923, blue: 0.2789022923, alpha: 1)
        textField.tintColor =  #colorLiteral(red: 0.5741509199, green: 0.5741508603, blue: 0.5741509199, alpha: 1)
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private let acceptButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2789022923, green: 0.2789022923, blue: 0.2789022923, alpha: 1), for: .normal)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarhy()
        setupLayout()
        view.backgroundColor = .purple

        acceptButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    @objc private func buttonPressed() {
        output?.userSelectRegistration(withLogin: loginTextField.text ?? "",
                                       password: passwordTextField.text ?? "")
    }

    private func setupHierarhy() {
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(acceptButton)
    }

    private func setupLayout() {

        NSLayoutConstraint.activate([
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            loginTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),

            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),

            acceptButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            acceptButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            acceptButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            acceptButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

