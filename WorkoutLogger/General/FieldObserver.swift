//
//  TextFieldObserver.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-01-21.
//

import Foundation
import Combine

// TODO: find a way to make this generic
class TextFieldObserver : ObservableObject {
    @Published var debouncedText: String = ""
    @Published var text: String = ""

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

class IntFieldObserver : ObservableObject {
    @Published var debouncedInt: Int = 0
    @Published var int: Int

    private var subscriptions = Set<AnyCancellable>()

    init(text: Int) {
        self.int = text
        $int
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] t in
                self?.debouncedInt = t
            } )
            .store(in: &subscriptions)
    }

}

class DoubleFieldObserver : ObservableObject {
    @Published var debouncedDouble: Double = 0
    @Published var double: Double

    private var subscriptions = Set<AnyCancellable>()

    init(text: Double) {
        self.double = text
        $double
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] t in
                self?.debouncedDouble = t
            } )
            .store(in: &subscriptions)
    }

}
