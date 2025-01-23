//
//  SocialView.swift
//  Discollection
//
//  Created by Aurore Vernet on 22/01/2025.
//

import SwiftUI

struct SocialView: View {
    
    let profiles = [
        [
            "image": "profile1",
            "name": "Paul Ochon",
            "vinyls": "8"
        ],
        [
            "image": "profile2",
            "name": "Tom Ate",
            "vinyls": "115"
        ],
        [
            "image": "profile3",
            "name": "Marc Assin",
            "vinyls": "64"
        ]
    ]
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Image("backgroundImage")
                .resizable()
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                                dismiss()
                    }) {
                        Image("chevron-left")
                    }
                    Spacer()
                    Text("Communauté")
                        .foregroundStyle(.white)
                        .font(.custom("Jaro-Regular", size: 24))
                    Spacer()
                    Image("write")
                }
                Text("Quoi de neuf ?")
                    .foregroundStyle(.white)
                    .font(.custom("Jaldi-Bold", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(alignment: .top, spacing: 20) {
                    Image("profile1-small")
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Il y a 2 heures")
                            .foregroundStyle(.white)
                            .font(.custom("Jaldi-Regular", size: 14))
                        HStack(alignment: .firstTextBaseline, spacing: 5) {
                            Text("Paul Ochon").bold().font(.custom("Jaldi-Bold", size: 16)) + Text(" possède un nouveau vinyle dans sa collection :")
                                
                        }
                        .foregroundStyle(.white)
                        .font(.custom("Jaldi-Regular", size: 16))
                        HStack {
                            Image("vinyl")
                            HStack {
                                Text("All System Go") + Text(" de ").font(.custom("Jaldi-Regular", size: 18)) + Text("Donna Summer")
                            }
                            .foregroundStyle(.white)
                            .font(.custom("Jaldi-Bold", size: 18))
                        }
                        HStack(spacing: 20) {
                            Spacer()
                            Text("J'aime")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 14))
                            Text("Commenter")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 14))
                            Text("Partager")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 14))
                        }
                    }
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(25)
                HStack {
                    Spacer()
                    Text("Voir toute l'actualité")
                        .foregroundStyle(.white)
                        .font(.custom("Jaldi-Regular", size: 16))
                    Image("chevron-right")
                }
                Text("Mes amis")
                    .foregroundStyle(.white)
                    .font(.custom("Jaldi-Bold", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    ForEach(Array(profiles.enumerated()), id: \.element) { index, vinyl in
                        VStack {
                            Image(vinyl["image"] ?? "")
                            Text(vinyl["name"] ?? "")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Bold", size: 12))
                            (Text(vinyl["vinyls"] ?? "") + Text(" vinyles"))
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 12))
                        }
                        if index < profiles.count - 1 {
                            Spacer()
                        }
                    }
                }
                HStack {
                    Spacer()
                    Text("Voir tous mes amis")
                        .foregroundStyle(.white)
                        .font(.custom("Jaldi-Regular", size: 16))
                    Image("chevron-right")
                }
            }
            .padding(20)
            .nav()
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SocialView()
}
