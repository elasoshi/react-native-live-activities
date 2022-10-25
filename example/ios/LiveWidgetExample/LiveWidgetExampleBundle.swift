//
//  LiveWidgetExampleBundle.swift
//  LiveWidgetExample
//
//  Created by Shamsudeen Yusuf on 24/10/22.
//

import WidgetKit
import SwiftUI

@main
struct LiveWidgetExampleBundle: WidgetBundle {
    var body: some Widget {
        LiveWidgetExample()
        LiveWidgetExampleLiveActivity()
    }
}
