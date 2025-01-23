//
//  CollectionView.swift
//  Discollection
//
//  Created by Aurore Vernet on 22/01/2025.
//

import SwiftUI

let vinyls = [
    [
        "image": "vinyl-radiohead",
        "title": "A Moon Shaped Pool",
        "artist": "Radiohead"
    ],
    [
        "image": "vinyl-twenty",
        "title": "Blurryface",
        "artist": "Twenty One Pilots"
    ],
    [
        "image": "vinyl-gorillaz",
        "title": "Demon Days",
        "artist": "Gorillaz"
    ],
    [
        "image": "vinyl-midi",
        "title": "Hellfire",
        "artist": "Black Midi"
    ],
    [
        "image": "vinyl-whitney",
        "title": "Light Upon The Lake",
        "artist": "Whitney"
    ],
    [
        "image": "vinyl-luciani",
        "title": "Sainte-Victoire",
        "artist": "Clara Luciani"
    ],
    [
        "image": "vinyl-weeknd",
        "title": "Starboy",
        "artist": "The Weeknd"
    ],
    [
        "image": "vinyl-headboys",
        "title": "Stepping Stones",
        "artist": "The Headboys"
    ],
    [
        "image": "vinyl-dua",
        "title": "Rasical Optimism",
        "artist": "Dua Lipa"
    ]
]

let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

struct CollectionView: View {
    
    @Environment(\.dismiss) private var dismiss
    
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
                        HStack(alignment: .firstTextBaseline, spacing: 0) {
                            Text("Ma ")
                                .foregroundStyle(.white)
                                .font(.custom("Jaldi-Regular", size: 20))
                            Text("collection")
                                .foregroundStyle(.white)
                                .font(.custom("Jaro-Regular", size: 20))
                        }
                        Spacer()
                        Image("search-small")
                    }
                    HStack() {
                        Image("filter")
                        Text("Par titre")
                            .foregroundStyle(.white)
                            .font(.custom("Jaldi-Regular", size: 20))
                        Image("chevron-down")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(0..<(vinyls.count + 2) / 3, id: \.self) { rowIndex in
                                HStack {
                                    ForEach(0..<3, id: \.self) { columnIndex in
                                        let index = rowIndex * 3 + columnIndex
                                        if index < vinyls.count {
                                            let vinyl = vinyls[index]
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
                                                }
                                            )
                                            if columnIndex < 2 && index + 1 < vinyls.count {
                                                Spacer()
                                            }
                                        }
                                    }
                                }
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
    CollectionView()
}
