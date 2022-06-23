//
//  RegistrationScreenPresentor.swift
//  ProjectVIPER
//
//  Created by Maksim Malofeev on 21/06/2022.
//

import Foundation

protocol RegistrationScreenPresenterInput: AnyObject {
    
}

protocol RegistrationScreenPresenterOutput: AnyObject {
    var output: RegistrationScreenPresenterOutput? { get set }
}

final class RegistrationScreenPresenter: RegistrationScreenPresenterOutput {

    weak var output: RegistrationScreenPresenterOutput?

    private let interactor: RegistrationScreenInteractorInput
    private let router: RegistrationScreenRouterInput
    private let view: RegistrationScreenViewInput

    init(view: RegistrationScreenViewInput,
         interactor: RegistrationScreenInteractorInput,
         router: RegistrationScreenRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension RegistrationScreenPresenter: RegistrationScreenViewOutput {
    func userSelectRegistration(withLogin login: String, password: String) {
        interactor.registration(withLogin: login, password: password)
    }
}

extension RegistrationScreenPresenter: RegistrationScreenInteractorOutput {
    func didRegistration(withLogin login: String) {
        router.openAuthScreen(withLogin: login)
    }
}
