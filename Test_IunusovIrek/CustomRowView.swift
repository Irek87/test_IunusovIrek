//
//  CustomRowView.swift
//  Test_IunusovIrek
//
//  Created by Reek i on 12.03.2024.
//

import SwiftUI

struct CustomRowView: View {
    @State var arrayOfRandomNumbers: [Int] = .init()
    @Binding var isTimeToChange: Bool

    var body: some View {
        HStack {
            ForEach(arrayOfRandomNumbers, id: \.self) { number in
                Button {} label: { Text("\(number)") }
                    .buttonStyle(CustomButtonStyle())
            }
        }
        .frame(height: 50)
        .task {
            arrayOfRandomNumbers = getArrayOfRandomNumbers()
        }
        .onChange(of: isTimeToChange) { _, _ in
            changeRandomNumber()
        }
    }

    private func getArrayOfRandomNumbers() -> [Int] {
        var arrayOfRandomIntegers: [Int] = .init()

        (0...Int.random(in: 10...100)).forEach { _ in
            arrayOfRandomIntegers.append(Int.random(in: 0...100))
        }

        return arrayOfRandomIntegers
    }

    private func changeRandomNumber() {
        arrayOfRandomNumbers[Int.random(in: 0..<arrayOfRandomNumbers.count)] = Int.random(in: 0...100)
    }
}
