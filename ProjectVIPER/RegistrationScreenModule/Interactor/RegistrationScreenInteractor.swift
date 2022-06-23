//
//  RegistrationScreenInteractor.swift
//  ProjectVIPER
//
//  Created by Maksim Malofeev on 21/06/2022.
//

import Foundation

protocol RegistrationScreenInteractorInput {
    var output: RegistrationScreenInteractorOutput? { get set }
    func registration(withLogin login: String, password: String)
}

protocol RegistrationScreenInteractorOutput: AnyObject {
    func didRegistration(withLogin login: String)
}

class RegistrationScreenInteractor: RegistrationScreenInteractorInput {

    weak var output: RegistrationScreenInteractorOutput?

    func registration(withLogin login: String, password: String) {
        let model = Account(login: login, password: password)

        self.output?.didRegistration(withLogin: model.login)
    }


}
