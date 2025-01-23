//
//  MarketplaceView.swift
//  Discollection
//
//  Created by Aurore Vernet on 23/01/2025.
//

import SwiftUI

struct MarketplaceView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let featured_vinyls = [
        [
            "image": "vinyl-daftpunk",
            "title": "Da Funk",
            "artist": "Daft Punk",
            "price":"17"
        ],
        [
            "image": "vinyl-winehouse",
            "title": "Back To Black",
            "artist": "Amy Winehouse",
            "price": "19"
        ],
        [
            "image": "vinyl-dragons",
            "title": "Evolve",
            "artist": "Imagine Dragons",
            "price": "43"
        ]
    ]
    
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
                    Text("Marketplace")
                        .foregroundStyle(.white)
                        .font(.custom("Jaro-Regular", size: 24))
                    Spacer()
                    Image("search-small")
                }
                Text("En vedette")
                    .foregroundStyle(.white)
                    .font(.custom("Jaldi-Bold", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    ForEach(Array(featured_vinyls.enumerated()), id: \.element) { index, vinyl in
                        VStack {
                            Image(vinyl["image"] ?? "")
                            Text(vinyl["title"] ?? "")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Bold", size: 12))
                            Text(vinyl["artist"] ?? "")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 12))
                            (Text("à partir de ") + Text(vinyl["price"] ?? "") + Text("€"))
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 12))
                            }
                            if index < featured_vinyls.count - 1 {
                                Spacer()
                            }
                    }
                }
                HStack {
                    Spacer()
                    Text("Voir tout le catalogue")
                        .foregroundStyle(.white)
                        .font(.custom("Jaldi-Regular", size: 16))
                    Image("chevron-right")
                }
                Text("Mes annonces")
                    .foregroundStyle(.white)
                    .font(.custom("Jaldi-Bold", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 20) {
                    Image("vinyl-madonna")
                    VStack(alignment: .leading) {
                        Text("Erotica")
                            .foregroundStyle(.white)
                            .font(.custom("Jaldi-Bold", size: 20))
                        Text("Madonna")
                            .foregroundStyle(.white)
                            .font(.custom("Jaldi-Bold", size: 16))
                        HStack(alignment: .firstTextBaseline, spacing: 0) {
                            Text("Prix : ")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Bold", size: 16))
                            Text("35€")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 16))
                        }
                        HStack(alignment: .firstTextBaseline, spacing: 0) {
                            Text("Statut : ")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Bold", size: 16))
                            Text("En cours")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 16))
                        }
                        HStack(spacing: 20) {
                            Spacer()
                            Text("Modifier")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 14))
                            Text("Supprimer")
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
                    Text("Voir toutes mes annonces")
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
    MarketplaceView()
}
