//
//  LiveActivitiesAttributes.swift
//  LiveActivities
//
//  Created by Shamsudeen Yusuf on 24/10/22.
//  Copyright © 2022 Facebook. All rights reserved.
//

import Foundation
import ActivityKit

// Live Activity
struct LiveActivityAttributes: ActivityAttributes {
  public typealias InitialState = ContentState

  public struct ContentState: Codable, Hashable {
      var title: String
      var deliveryTime: Date
  }
  var numberOfGroceyItems: Int
  var id = UUID()
}
