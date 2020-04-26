//
//  MotherView.swift
//  QuizApp
//
//  Created by Max Aryus on 26.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack {
            if viewRouter.currentPage == "contentView" {
                ContentView(quizCategoryName: "Computers", backgroundImage: "computerQuiz")
                .transition(.move(edge: .leading))
            } else if viewRouter.currentPage == "Quiz1" {
                Quiz()
                 .transition(.move(edge: .leading))
            } else if viewRouter.currentPage == "Quiz2" {
                Quiz2()
                 .transition(.move(edge: .leading))
            } else if viewRouter.currentPage == "Quiz3" {
                Quiz3()
                 .transition(.move(edge: .leading))
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}
