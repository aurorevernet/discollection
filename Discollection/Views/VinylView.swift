//
//  VinylView.swift
//  Discollection
//
//  Created by Aurore Vernet on 23/01/2025.
//

import SwiftUI

struct VinylView : View {
    
    @Environment(\.dismiss) private var dismiss
    
    let format_list = ["Album complet", "2 disques", "Long Play", "Réédition", "GZ Pressing", "180 grammes"]
    let tracklist = ["A1 Burn The Witch", "A2 Daydreaming", "B1 Decks Dark", "B2 Desert Island Disk", "B3 Ful Stop", "C1 Glass Eye", "C2 Identikit", "C3 The Numbers", "D1 Present Tense", "D2 Tinker Tailer Soldier Spy", "D3 True Love Waits"]
    
    var body : some View {
        NavigationStack {
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
                        Text("A MOON SHAPED POOL")
                            .foregroundStyle(.white)
                            .font(.custom("Jaldi-Bold", size: 20))
                        Spacer()
                        Image("sell")
                    }
                    Image("vinyl-radioheadx2")
                    Text("Radiohead")
                        .foregroundStyle(.white)
                        .font(.custom("Jaldi-Bold", size: 20))
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            HStack(alignment: .firstTextBaseline, spacing: 0) {
                                Text("Année de sortie : ")
                                    .foregroundStyle(.white)
                                    .font(.custom("Jaldi-Bold", size: 16))
                                Text("2016")
                                    .foregroundStyle(.white)
                                    .font(.custom("Jaldi-Regular", size: 16))
                            }
                            HStack(alignment: .firstTextBaseline, spacing: 0) {
                                Text("Genre : ")
                                    .foregroundStyle(.white)
                                    .font(.custom("Jaldi-Bold", size: 16))
                                Text("Rock")
                                    .foregroundStyle(.white)
                                    .font(.custom("Jaldi-Regular", size: 16))
                            }
                            HStack(alignment: .firstTextBaseline, spacing: 0) {
                                Text("Label : ")
                                    .foregroundStyle(.white)
                                    .font(.custom("Jaldi-Bold", size: 16))
                                Text("XL Recordings")
                                    .foregroundStyle(.white)
                                    .font(.custom("Jaldi-Regular", size: 16))
                            }
                            Text("Format : ")
                                    .foregroundStyle(.white)
                                    .font(.custom("Jaldi-Bold", size: 16))
                            ForEach(format_list, id: \.self) { item in
                                HStack(alignment: .top) {
                                    Text("•")
                                    Text(item)
                                }
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 16))
                            }
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Tracklist :")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Bold", size: 16))
                            ForEach(tracklist, id: \.self) { item in
                                HStack(alignment: .top) {
                                    Text(item)
                                }
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 16))
                            }
                        }
                    }
                }
                .padding(20)
                .nav()
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    VinylView()
}
