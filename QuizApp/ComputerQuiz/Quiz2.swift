//
//  Quiz2.swift
//  QuizApp
//
//  Created by Max Aryus on 26.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct Quiz2: View {
    @EnvironmentObject var viewRouter: ViewRouter
    private var solution = 3
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
                Text("2/3 \n questions")
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
                Spacer()
                
                Text("What does the D stand for at DHTML")
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
                QuizSolution(text: "Responsive", number: 1)
                
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
                    QuizSolution(text: "Dreamer", number: 2)
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
                QuizSolution(text: "Dynamic", number: 3)
            }
            Spacer()
            
            if self.showNext {
                Button(action: {
                    withAnimation (){
                        self.viewRouter.currentPage = "Quiz3"
                    }
                }) {
                    HStack {
                        Spacer()
                        Text("Next")
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
            Alert(title: Text(self.rightSolution ? "Right" : "False"), message: Text(self.rightSolution ? "" : "Try it another time"), dismissButton: .default(Text("OK")))
        }
    }
}

struct Quiz2_Previews: PreviewProvider {
    static var previews: some View {
        Quiz2()
    }
}
