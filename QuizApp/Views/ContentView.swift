//
//  ContentView.swift
//  QuizApp
//
//  Created by Max Aryus on 26.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var quizCategoryName: String
    @State var backgroundImage: String
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Score: 0 ")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.bottom, 40)
                    .foregroundColor(blue)
                Spacer()
                
                ScrollView {
                    Button(action: {
                        withAnimation() {
                            self.viewRouter.currentPage = "Quiz1"
                        }
                    }) {
                        CategoryCard(quizCategoryName: self.$quizCategoryName, backgroundImage: self.$backgroundImage)
                    }
                }
                Spacer()
            }.navigationBarTitle("Welcome")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(quizCategoryName: "Computers", backgroundImage: "computerQuiz")
    }
}

struct CategoryCard: View {
    @Binding var quizCategoryName: String
    @Binding var backgroundImage: String
    var body: some View {
        VStack {
            ZStack {
                Image(self.backgroundImage)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 400)
                
                Text("\(self.quizCategoryName)")
                    .foregroundColor(blue)
                    .font(.custom("Helvetica", size: 40))
                    .bold()
                
            }
        }.cornerRadius(20).shadow(radius: 6)
    }
}
