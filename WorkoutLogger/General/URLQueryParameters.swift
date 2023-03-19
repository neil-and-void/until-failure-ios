//
//  URLQueryParameters.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-03-17.
//

import Foundation

extension URL {
    func getQueryParam(_ queryParam: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParam } )?.value
    }
}
