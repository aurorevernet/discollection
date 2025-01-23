//
//  StartView.swift
//  Discollection
//
//  Created by Aurore Vernet on 22/01/2025.
//

import SwiftUI

struct StartView: View {
    
    @State private var navigateToApp = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("backgroundImage")
                    .resizable()
                    .ignoresSafeArea()
                Image("bigLogo")
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    navigateToApp = true
                }
            }
            .navigationDestination(isPresented: $navigateToApp) {
                HomeView()
            }
        }
    }
}
