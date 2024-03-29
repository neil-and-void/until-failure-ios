//
//  SwipeItem.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-01-25.
//

import SwiftUI

struct SwipeItem<Content: View>: View {
    var content: () -> Content
    var onDelete: () -> Void

    init(@ViewBuilder content: @escaping () -> Content, onDelete: @escaping () -> Void) {
        self.content = content
        self.onDelete = onDelete
    }

    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                withAnimation {
                    xOffset = anchor + value.translation.width

                    if anchor < 0 {
                        rightPastThreshold = xOffset < -anchorWidth + swipeThreshold
                    } else {
                        rightPastThreshold = xOffset < -swipeThreshold
                    }
                }
            }
            .onEnded { value in
                withAnimation {
                    if rightPastThreshold {
                        anchor = -anchorWidth
                    } else {
                        anchor = 0
                    }

                    xOffset = anchor
                }
            }
    }

    @State
    var xOffset: CGFloat = 0

    @State
    var anchor: CGFloat = 0

    @State
    var rightPastThreshold = false

    let screenWidth = UIScreen.main.bounds.width
    var anchorWidth: CGFloat { screenWidth / 6 }
    var swipeThreshold: CGFloat { screenWidth / 12 } // how much to swipe before locking

    var body: some View {
        GeometryReader { geo in
            ZStack {
                HStack {
                    Spacer()
                    Button(
                        action: {
                            // reset swipe position
                            withAnimation {
                                xOffset = 0
                            }
                            onDelete()
                        }
                    ) {
                        Image(systemName: "trash").foregroundColor(.red)
                    }
                    .frame(width: screenWidth / 6)
                }
                .cornerRadius(8)

                content()
                    .frame(width: geo.size.width)
                    .offset(x: xOffset)
                    .gesture(drag)
                    .clipped()
            }
        }
    }
}
