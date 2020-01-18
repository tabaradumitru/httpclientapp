//
//  NYTimesNewsManagerDelegate.swift
//  HTTPClientApp
//
//  Created by Dumitru Tabara on 1/10/20.
//  Copyright © 2020 Dumitru Tabara. All rights reserved.
//

import Foundation

protocol NYTimesNewsManagerDelegate {
    func didUpdateNYTimesNews(news: NYTimesFeed)
}
