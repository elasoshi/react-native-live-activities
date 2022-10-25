//
//  ActivityAttributes.swift
//  LiveActivitiesExample
//
//  Created by Shamsudeen Yusuf on 24/10/22.
//

import Foundation
import ActivityKit

// Live Activity
struct LiveActivityAttributes: ActivityAttributes {
  public typealias LiveDeliveryData = ContentState

  public struct ContentState: Codable, Hashable {
      var courierName: String
      var deliveryTime: Date
  }
  var numberOfGroceyItems: Int
  var id = UUID()
}
