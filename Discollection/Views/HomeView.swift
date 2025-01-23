//
//  ContentView.swift
//  Discollection
//
//  Created by Aurore Vernet on 21/01/2025.
//

import SwiftUI

let last_vinyls = [
    [
        "image": "vinyl-radiohead",
        "title": "A Moon Shaped Pool",
        "artist": "Radiohead"
    ],
    [
        "image": "vinyl-dua",
        "title": "Radical Optimism",
        "artist": "Dua Lipa"
    ],
    [
        "image": "vinyl-gorillaz",
        "title": "Demon Days",
        "artist": "Gorillaz"
    ]
]

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("backgroundImage")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    HStack(spacing: 20) {
                        Image("smallLogo")
                        HStack(alignment: .firstTextBaseline, spacing: 0) {
                            Text("Bonjour, ")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 20))
                            Text("Aurore Vernet")
                                .foregroundStyle(.white)
                                .font(.custom("Jaro-Regular", size: 20))
                            Text(" !")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 20))
                        }
                        Spacer()
                        Image("search")
                    }
                    VStack {
                        Text("Derniers ajouts")
                            .foregroundStyle(.white)
                            .font(.custom("Jaldi-Bold", size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            ForEach(Array(last_vinyls.enumerated()), id: \.element) { index, vinyl in
                                NavigationLink(
                                    destination: VinylView(),
                                    label: {
                                        VStack {
                                            Image(vinyl["image"] ?? "")
                                            Text(vinyl["title"] ?? "")
                                                .foregroundStyle(.white)
                                                .font(.custom("Jaldi-Bold", size: 12))
                                            Text(vinyl["artist"] ?? "")
                                                .foregroundStyle(.white)
                                                .font(.custom("Jaldi-Regular", size: 12))
                                            }
                                            if index < last_vinyls.count - 1 {
                                                Spacer()
                                            }
                                    }
                                )
                            }
                        }
                        HStack(spacing: 5) {
                            Spacer()
                            NavigationLink(
                                destination: CollectionView(),
                                label: {
                                    Text("Voir toute ma collection")
                                        .foregroundStyle(.white)
                                        .font(.custom("Jaldi-Regular", size: 16))
                                    Image("chevron-right")
                                }
                            )
                        }
                        VStack(spacing: 0) {
                            (Text("Qu'est-ce que ") + Text("Discollection").font(.custom("Jaro-Regular", size: 24)) + Text(" ?"))
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Bold", size: 24))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("THE application à destination des collectionneurs et vendeurs de vinyles ! ")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 16))
                            Spacer()
                            Text("COLLECTIONNEZ. PARTAGEZ. ACHETEZ & VENDEZ.")
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Bold", size: 16))
                            Spacer()
                            Text("Note : Ceci était un projet à réaliser par mes camarades designers. J'ai repris la consigne et réalisé ma propre maquette pour découvrir la conception d'applications natives avec SwiftUI sur Xcode ! :)")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 14))
                                .padding(15)
                                .background(Color.white.opacity(0.05))
                                .cornerRadius(25)
                        }
                        
                    }
                }
                .padding(20)
                .nav()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
