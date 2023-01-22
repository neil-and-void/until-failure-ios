//
//  TextFieldObserver.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-01-21.
//

import Foundation
import Combine

class TextFieldObserver : ObservableObject {
    @Published var debouncedText = ""
    @Published var text = ""

    private var subscriptions = Set<AnyCancellable>()

    init(text: String) {
        self.text = text
        $text
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] t in
                self?.debouncedText = t
            } )
            .store(in: &subscriptions)
    }
}
