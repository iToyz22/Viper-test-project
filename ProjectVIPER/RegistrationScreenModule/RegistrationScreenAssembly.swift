//
//  RegistrationScreenAssembly.swift
//  ProjectVIPER
//
//  Created by Maksim Malofeev on 21/06/2022.
//

import UIKit

class RegistrationScreenAssembly {

    static func assembleRegistrationScreenModule() -> UIViewController {
        let view = RegistrationScreenView()
        let interactor = RegistrationScreenInteractor()
        let router = RegistrationScreenRouter()
        let presentor = RegistrationScreenPresenter(view: view,
                                                    interactor: interactor,
                                                    router: router)

        interactor.output = presentor
        view.output = presentor
        router.rootViewController = view

        return view
    }
}
