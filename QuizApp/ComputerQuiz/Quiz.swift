//
//  Quiz.swift
//  QuizApp
//
//  Created by Max Aryus on 26.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct Quiz: View {
    @EnvironmentObject var viewRouter: ViewRouter
    private var solution = 1
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
                Text("1/3 \n questions")
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
                Spacer()
                
                Text("Steve Jobs founded the company...")
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
                    
                }
            }) {
                QuizSolution(text: "Apple", number: 1)
                
            }
            Button(action: {
                self.taped = 2
                if self.taped != self.solution {
                    self.rightSolution = false
                    self.showAlert = true
                }
            }) {
                QuizSolution(text: "Microsoft", number: 2)
            }

            Button(action: {
                self.taped = 3
                if self.taped != self.solution {
                    self.rightSolution = false
                    self.showAlert = true
                    
                }
            }) {
                QuizSolution(text: "Google", number: 3)
            }
            Spacer()
            
            if self.showNext {
                Button(action: {
                    withAnimation() {
                        self.viewRouter.currentPage = "Quiz2"
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

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Quiz()
    }
}

struct QuizSolution: View {
    
    @State var text: String
    @State var number: Int
    var body: some View {
        HStack {
            Text("\(number)")
                .font(.custom("Helvetica", size: 30))
                .fontWeight(.black)
                .foregroundColor(.orange)
                .padding(.leading)
                .padding(15)
            Text("\(text)")
                .font(.custom("Helvetica", size: 20))
                .bold()
            Spacer()
        }.background(Color.white).cornerRadius(20)
            .padding()
    }
}
