//
//  WelcomeView.swift
//  NextRootDemo
//
//  Created by Md Abdul Gafur on 10/6/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Text("Hi \(Helper.getUserName), Welcome to Application").font(.system(size: 18)).foregroundColor(Color.black)
                    .accessibilityIdentifier("welcomeLabel")
                Spacer()
            }
          
            Spacer()
        }
        .background(Color("F8F8F8"))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
