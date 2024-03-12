//
//  ContentView.swift
//  Test_IunusovIrek
//
//  Created by Reek i on 11.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isTimeToChange: Bool = false
    let randomNumberOfRows = Int.random(in: 100...Int.max)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        List {
            ForEach(0...randomNumberOfRows, id: \.self) { _ in
                ScrollView(.horizontal) {
                    CustomRowView(isTimeToChange: $isTimeToChange)
                }
                .scrollIndicators(.hidden)
            }
        }
        .listStyle(.plain)
        .onReceive(timer) { _ in
            isTimeToChange.toggle()
        }
    }
}

#Preview {
    ContentView()
}
