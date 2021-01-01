//
//  ContentView.swift
//  Project2
//
//  Created by Timothy Hoiberg on 1/1/21.
//

import SwiftUI

struct ContentView: View {
    static let gridSize = 10
    @State var images = ["elephant", "giraffe", "hippo", "monkey", "panda", "parrot", "penguin", "pig", "rabbit", "snake"]
    @State var layout = Array(repeating: "empty", count: gridSize * gridSize)
    @State var currentLevel = 1
    @State var isGameOver = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Odd One Out").font(.system(size: 36, weight: .thin))
                
                ForEach(0..<Self.gridSize, id: \.self) { row in
                    HStack {
                        ForEach(0..<Self.gridSize, id: \.self) { column in
                            if self.image(row, column) == "empty" {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: 64, height: 64)
                            } else {
                            Button(action: {
                                self.processAnswer(at: row, column)
                            }) {
                                Image(self.image(row, column)).renderingMode(.original)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            }
                        }
                    }
                }
            }.frame(maxHeight: 800)
        }
        .onAppear(perform: createLevel)
        .contentShape(Rectangle())
        .contextMenu {
            Button("Start New Game") {
                self.currentLevel = 1
                self.isGameOver = false
                self.createLevel()
            }
        }
        .opacity(isGameOver ? 0.2 : 1)
        
        if isGameOver {
            VStack {
                Text("Game Over!")
                    .font(.largeTitle)
                Button("Play Again") {
                    self.currentLevel = 1
                    self.isGameOver = false
                    self.createLevel()
                }
                .font(.headline)
                .foregroundColor(.white)
                .buttonStyle(BorderlessButtonStyle())
                .padding(20)
                .background(Color.blue)
                .clipShape(Capsule())
            }
            .transition(.scale)
        }
    }
    
    func image(_ row: Int, _ column: Int) -> String {
        return layout[row * Self.gridSize + column]
    }
    
    func generateLayout(items: Int) {
        layout.removeAll(keepingCapacity: true)
        
        images.shuffle()
        layout.append(images[0])
        
        var numUsed = 0
        var itemCount = 1
        
        for _ in 1 ..< items {
            layout.append(images[itemCount])
            numUsed += 1
            
            if (numUsed == 2) {
                numUsed = 0
                itemCount += 1
            }
            
            if (itemCount == images.count) {
                itemCount = 1
            }
        }
        
        layout += Array(repeating: "empty", count: 100 - layout.count)
    
        layout.shuffle()
    }
    
    func createLevel() {
        if currentLevel == 9 {
            withAnimation {
                isGameOver = true
            }
        } else {
            let numbersOfItems = [0, 5, 15, 25, 35, 49, 65, 81, 100]
            generateLayout(items: numbersOfItems[currentLevel])
        }
    }
    
    func processAnswer(at row: Int, _ column: Int) {
        if self.image(row, column) == self.images[0] {
            self.currentLevel += 1
            self.createLevel()
        } else {
            if self.currentLevel > 1 {
                self.currentLevel -= 1
            }
            
            self.createLevel()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
