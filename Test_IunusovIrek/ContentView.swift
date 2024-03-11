//
//  ContentView.swift
//  Test_IunusovIrek
//
//  Created by Reek i on 11.03.2024.
//

import SwiftUI

struct ContentView: View {
    let randomNumberOfRows = Int.random(in: 100...1000)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var matrix: [[Int]] = .init()

    var body: some View {
        List {
            ForEach(0..<matrix.count, id: \.self) { row in
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<matrix[row].count, id: \.self) { column in
                            Button {} label: { Text("\(matrix[row][column])") }
                                .buttonStyle(CustomButtonStyle())
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .listStyle(.plain)
        .task {
            fillInMatrix()
        }
        .onReceive(timer) { time in
            changeRandomElement()
        }
    }

    private func fillInMatrix() {
        (0...randomNumberOfRows).forEach { row in
            matrix.append([Int]())
            (0...Int.random(in: 10...100)).forEach { column in
                matrix[row].append(Int.random(in: 0...100))
            }
        }
    }

    private func changeRandomElement() {
        (0..<matrix.count).forEach { row in
            let randomColumn = Int.random(in: 0..<matrix[row].count)

            matrix[row][randomColumn] = Int.random(in: 0...100)
        }
    }
}

#Preview {
    ContentView()
}
