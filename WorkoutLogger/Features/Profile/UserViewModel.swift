//
//  UserViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-29.
//

import Foundation

class UserViewModel: ObservableObject {
    
    private var keychainService: KeychainServiceProtocol
    
    init(keychainService: KeychainServiceProtocol = KeychainService()) {
        self.keychainService = keychainService
    }
    
    func logout(setAuth: (Bool) -> Void) {
        self.keychainService.delete(
            service: WORKOUT_LOGGER_KEYCHAIN_SERVICE,
            account: WORKOUT_LOGGER_KEYCHAIN_ACCOUNT
        )
        setAuth(false)
        // TODO: clear apollo cache
    }
}
