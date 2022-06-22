//
//  RegistrationScreenRouter.swift
//  ProjectVIPER
//
//  Created by Maksim Malofeev on 21/06/2022.
//

import UIKit

protocol RegistrationScreenRouterInput {
    func openAuthScreen(withLogin: String)
}

final class RegistrationScreenRouter: RegistrationScreenRouterInput {

    weak var rootViewController: UIViewController?

    func openAuthScreen(withLogin: String) {
        let vc = UIViewController()
        vc.view.backgroundColor = .cyan
        rootViewController?.present(vc, animated: true, completion: nil)
    }
}

