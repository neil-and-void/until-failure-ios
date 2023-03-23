//
//  Config.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-29.
//

import Foundation

var baseURL: String {
    #if DEV
    return "https://api.viloria.dev"
    #elseif STAGING
    return "https://api.viloria.dev"
    #else
    return "https://api.viloria.dev"
    #endif
}
