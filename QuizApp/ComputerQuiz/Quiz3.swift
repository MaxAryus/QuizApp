//
//  Quiz3.swift
//  QuizApp
//
//  Created by Max Aryus on 26.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct Quiz3: View {
    @EnvironmentObject var viewRouter: ViewRouter
    private var solution = 2
    @State private var taped: Int = 0
    @State private var rightSolution: Bool = false
    @State private var showAlert: Bool = false
    @State private var showNext: Bool = false
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Computer")
                    .font(.custom("Helvetica", size: 40))
                    .bold()
                Spacer()
            }.padding(.top, 35)
            
            HStack {
                Text("3/3 \n questions")
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
                Spacer()
                
                Text("Who developed the first email program")
                    .font(.custom("Helvetica", size: 20))
                    .bold()
                    .multilineTextAlignment(.center)
                Spacer()
            }.padding([.top, .bottom], 40)
                .padding(.leading)
            
            Button(action: {
                self.taped = 1
                if self.taped == self.solution {
                    self.rightSolution = true
                    self.showAlert = true
                    self.showNext = true
                    
                } else if self.taped != self.solution {
                    self.rightSolution = false
                    self.showAlert = true
                }
            }) {
                QuizSolution(text: "Bill Gates", number: 1)
                
            }
            Button(action: {
                self.taped = 2
                if self.taped == self.solution {
                    self.rightSolution = true
                    self.showAlert = true
                    self.showNext = true
                    
                } else if self.taped != self.solution {
                    self.rightSolution = false
                    self.showAlert = true
                }            }) {
                    QuizSolution(text: "Ray Tomlinson", number: 2)
            }

            Button(action: {
                self.taped = 3
                if self.taped == self.solution {
                    self.rightSolution = true
                    self.showAlert = true
                    self.showNext = true
                    
                } else if self.taped != self.solution {
                    self.rightSolution = false
                    self.showAlert = true
                }
            }) {
                QuizSolution(text: "Steve Jobs", number: 3)
            }
            Spacer()
            
            if self.showNext {
                Button(action: {
                    withAnimation (){
                        self.viewRouter.currentPage = "contentView"
                    }
                }) {
                    HStack {
                        Spacer()
                        Text("Back to menu")
                            .font(.custom("Helvetica", size: 20))
                            .bold()
                            .padding(15)
                        Spacer()
                        
                    }.background(Color.white).cornerRadius(20)
                        .padding()
                }
            }
            
        }.background(blue).edgesIgnoringSafeArea([.top, .bottom])
        .alert(isPresented: self.$showAlert) {
            Alert(title: Text(self.rightSolution ? "Right" : "False"), message: Text(self.rightSolution ? "You are finished" : "Try it another time"), dismissButton: .default(Text("OK")))
        }
    }
}

struct Quiz3_Previews: PreviewProvider {
    static var previews: some View {
        Quiz3()
    }
}
