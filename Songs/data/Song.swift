//
//  JSONLoader.swift
//  Songs
//
//  Created by mario rotz  on 14.10.24.
//
import Foundation

/*
 
 Struct for loading a Song from json
 
 "id": 16,
 "name": "Around And Around",
 "artist": "The Rolling Stones",
 "album": "Stone Age",
 "year": 1971
 
 */

struct JSONError : Error { }



struct Song : Identifiable,Decodable {
    let id: Int
    let name: String
    let artist: String
    let album: String
    let year: Int?
    
    static let NoYearAvailable : String  = "No year available"
    
    func optionalYear() -> String {
        if let aYear = self.year {
            return String(aYear)
        } else
        {
            return Song.NoYearAvailable
        }
    }
    
    var completeName: String {
        return "\(artist) - \(name) from \(album) (\(optionalYear()))"
    }
    
}

//MARK: search method
extension Song {
    func contains(value:String)->Bool {
        return name.contains(value) || artist.contains(value) || album.contains(value)  || optionalYear().contains(value)
    }
}



//MARK: json methods
extension Song {
    static func loadJson(fileName: String,result:(Result<[Song],Error>)-> Void) {
        let decoder = JSONDecoder()
        guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let songList = try? decoder.decode([Song].self, from: data)
        else {
            let error : Error = JSONError()
            let res = Result<[Song],Error>.failure(error)
            result(res)
            return
        }
        let res = Result<[Song],Error>.success(songList)
        result(res)
    }
    
    static func loadSampleSongList(result:(Result<[Song],Error>)-> Void) {
        return loadJson(fileName: "mobile_Warming-up-A",result: result)
    }
}

