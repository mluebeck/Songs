//
//  SongDetail.swift
//  Songs
//
//  Created by  mario rotz  on 14.10.24.
//
import SwiftUI

struct SongDetail : View {
    let song: Song
    var body: some View {
        VStack {
            Text(song.name)
            Text(song.artist)
            Text(song.optionalYear())
        }
        .navigationTitle(song.name)
    }
}
