//
//  Stream.swift
//  Stream App
//
//  Created by Nomadic on 11/27/20.
//  Copyright © 2020 Nomadic. All rights reserved.
//

import Foundation

struct Stream: Hashable {
    
    let title: String
    let urlLink: String
    let image: String
    
//    static func streamData() -> [Stream] {
//        return [
//            Stream(title: "Brighton Pier", urlLink: "https://hddn00.skylinewebcams.com/live.m3u8?a=eeuhtd0inkdcv6crri4ou52gv2", image: "BrightonPier"),
//            Stream(title: "Rose Bay - Sydney", urlLink: "https://hddn00.skylinewebcams.com/live.m3u8?a=eeuhtd0inkdcv6crri4ou52gv2", image: "RoseBaySydney"),
//            Stream(title: "Rose Bay - Sydney1", urlLink: "https://hddn00.skylinewebcams.com/live.m3u8?a=eeuhtd0inkdcv6crri4ou52gv2", image: "RoseBaySydney"),
//            Stream(title: "Rose Bay - Sydney2", urlLink: "https://hddn00.skylinewebcams.com/live.m3u8?a=eeuhtd0inkdcv6crri4ou52gv2", image: "RoseBaySydney"),
//            Stream(title: "Rose Bay - Sydney4", urlLink: "https://hddn00.skylinewebcams.com/live.m3u8?a=eeuhtd0inkdcv6crri4ou52gv2", image: "RoseBaySydney")
////            Stream(title: "Rose Bay - Sydney", urlLink: "https://hddn00.skylinewebcams.com/live.m3u8?a=eeuhtd0inkdcv6crri4ou52gv2", image: "RoseBaySydney"),
////            Stream(title: "Rose Bay - Sydney", urlLink: "https://hddn00.skylinewebcams.com/live.m3u8?a=eeuhtd0inkdcv6crri4ou52gv2", image: "RoseBaySydney")
//        
//        ]
//    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: Stream, rhs: Stream) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    let identifier = UUID().uuidString
}
