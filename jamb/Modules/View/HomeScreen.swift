//
//  ContentView.swift
//  Shared
//
//  Created by Domagoj Bunoza on 17.03.2022..
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var viewModel: HomeScreenViewModel
    @State var gameOver: Bool
    @State var isChecked: [Bool]
    
    let screenHeight = UIScreen.main.bounds.height
    
    init(viewModel: HomeScreenViewModel) {
        self.viewModel = viewModel
        self.gameOver = false
        self.isChecked = [false, false, false, false, false, false]
    }
    
    var body: some View {
        renderContentView()
    }
    
    func renderContentView() -> some View {
        ZStack {
            renderBackground()
            VStack {
                renderTitle()
                VStack {
                    HStack {
                        renderDie(index: 0)
                        renderDie(index: 1)
                    }
                    HStack {
                        renderDie(index: 2)
                        renderDie(index: 3)
                    }
                    HStack {
                        renderDie(index: 4)
                        renderDie(index: 5)
                    }
                }
                .padding()
                renderIO()
            }
        }
    }
    
    func renderBackground() -> some View {
        Image("background").resizable().scaledToFill().ignoresSafeArea().foregroundColor(.white)
    }
    
    func renderTitle() -> some View {
        Text("Jamb")
            .font(.system(size: screenHeight * 0.05).bold())
    }
    
    func renderDie(index: Int) -> some View {
        ZStack {
            Image("dice-\(viewModel.screenData[index].number)")
                .resizable()
                .scaledToFit()
                .frame(width: screenHeight * 0.1)
                .padding()
                .overlay(content: {
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                if viewModel.numberOfThrowsLeft != 3 {
                                    viewModel.screenData[index].isLocked.toggle()
                                    isChecked[index].toggle()
                                }
                            }) {
                                Image(systemName: isChecked[index] ? "checkmark.square": "square")
                            }
                            Spacer()
                        }
                    }
                })
        }
        .alert(isPresented: $gameOver, content: {
            Alert(title: Text("Congrats!"), message: Text(viewModel.getResults()), dismissButton: .default(Text("OK")))
        })
    }
    
    func renderIO() -> some View {
        VStack {
            Text("Throws left: \(viewModel.numberOfThrowsLeft)")
                .padding()
            HStack {
                if viewModel.numberOfThrowsLeft != 0 {
                    renderStartThrowButton()
                }
                if viewModel.numberOfThrowsLeft < 3 {
                    if viewModel.numberOfThrowsLeft == 0 {
                        renderNewGameButton()
                    }
                    else {
                        renderAcceptButton()
                    }
                }
            }
        }
    }
    
    func resetChecked() {
        for i in 0...5 {
            isChecked[i] = false
        }
    }
    
    func renderStartThrowButton() -> some View {
        Button(action: {
            viewModel.throwDice()
            if viewModel.numberOfThrowsLeft == 0 {
                gameOver = true
            }
        }, label: {
            Text(viewModel.numberOfThrowsLeft == 3 ? "Start" : "Throw")
        })
        .padding()
    }
    
    func renderNewGameButton() -> some View {
        Button(action: {
            gameOver = false
            viewModel.numberOfThrowsLeft = 0
            viewModel.startNewGame()
            resetChecked()
        }, label: {
            Text("New game")
        })
        .padding()
    }
    
    func renderAcceptButton() -> some View {
        Button(action: {
            viewModel.numberOfThrowsLeft = 0
            gameOver = true
        }, label: {
            Text("Accept")
        })
        .padding()
    }
}

struct Homescreen_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HomeScreenViewModel()
        HomeScreen(viewModel: viewModel)
    }
}
