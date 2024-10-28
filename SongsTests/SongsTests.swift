//
//  SongsTests.swift
//  SongsTests
//
//  Created by  mario rotz  on 14.10.24.
//

import Testing

struct SongsTests {

    //let s = Song.loadSampleSongList()
    let year = 1971

    @Test func test_songlistNotEmpty() async throws {
        
        #expect(s!.count>0)
    }
    
    @Test func test_songlistSampleSizeIs20() async throws {
        let s = try await  Song.loadSampleSongList(result: <#T##(Result<[Song], any Error>) -> Void#>)
        #expect(s!.count==20)
    }
    
    @Test func test_NoYearAvailable() async throws {
        let s = self.sampleSong()
        #expect(s.optionalYear() == Song.NoYearAvailable)
    }
    
    @Test func test_YearAvailable() async throws {
        let s = sampleSong(year: self.year)
        #expect(s.optionalYear() == String(self.year))
    }
    
    @Test func test_searchForNamePositive() async throws {
        let s = sampleSong(year: self.year)
        #expect(s.contains(value: "a name")==true)
    }
    
    @Test func test_searchForNameNegative() async throws {
        let s = sampleSong(year: self.year)
        #expect(s.contains(value: "a nice name")==false )
    }
    
    @Test func test_searchForArtistPositive() async throws {
        let s = sampleSong(year: self.year)
        #expect(s.contains(value: "an artist")==true)
    }
    
    @Test func test_searchForArtistNegative() async throws {
        let s = sampleSong(year: self.year)
        #expect(s.contains(value: "a nice artist")==false )
    }
    
    @Test func test_searchForAlbumPositive() async throws {
        let s = sampleSong(year: self.year)
        #expect(s.contains(value: "an album")==true)
    }
    
    @Test func test_searchForAlbumNegative() async throws {
        let s = sampleSong(year: self.year)
        #expect(s.contains(value: "a nice album")==false )
    }
    
    @Test func test_searchForYearPositive() async throws {
        let s = sampleSong(year: self.year)
        #expect(s.contains(value: String(self.year))==true)
    }
    
    @Test func test_searchForYearNegative() async throws {
        let s = sampleSong(year: self.year)
        #expect(s.contains(value: "1392")==false )
    }
    
    @Test func test_completeName() async throws {
        let s = sampleSong(year: self.year)
        #expect(s.completeName == "an artist - a name from an album (1971)" )
    }
    
    private func sampleSong() -> Song {
        .init(id: 1, name: "a name", artist: "an artist", album: "an album")
    }
    
    private func sampleSong(year:Int) -> Song {
        .init(id: 1, name: "a name", artist: "an artist", album: "an album",year: self.year)
    }
    
    
}
