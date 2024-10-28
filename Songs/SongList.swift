//
//  StaffList.swift
//  Songs
//
//  Created by  mario rotz  on 14.10.24.
//
import SwiftUI

struct SongList: View {
    
    static let title = "Songs"
    static let titleNoSongs = "No songs"
    
    @State private var searchText = ""
    @State private var searchIsActive = true

    @State private var songs : [Song]? = Song.loadSampleSongList()
    var body: some View {
        NavigationView {
            List {
                if let _ = songs {
                    ForEach(searchResults) { song in
                        NavigationLink {
                            SongDetail(song: song)
                        } label: {
                            Text(song.completeName)
                        }
                    }
                } else {
                    Text(SongList.titleNoSongs)
                }
            } // List
            .navigationTitle(SongList.title)
        }.searchable(text: $searchText,isPresented: $searchIsActive)

    }
    
    var searchResults: [Song] {
        guard let songs else { return [] }
        if searchText.isEmpty {
                return songs
            } else {
                return songs.filter { $0.contains(value:searchText) }
            }
        }
}
