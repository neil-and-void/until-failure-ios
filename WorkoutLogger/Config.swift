//
//  Config.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-29.
//

import Foundation

var baseURL: String {
    #if DEV
    return "https://neil-inc-workout-logger-ejtky726bq-uw.a.run.app"
    #elseif STAGING
    return "https://neil-inc-workout-logger-ejtky726bq-uw.a.run.app"
    #else
    return "TODO"
    #endif
}
