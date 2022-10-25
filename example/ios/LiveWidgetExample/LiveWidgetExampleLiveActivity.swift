//
//  DeliveryTrackWidget.swift
//  DeliveryTrackWidget
//
//  Created by Batikan Sosun on 13.08.2022.
//
import ActivityKit
import WidgetKit
import SwiftUI



struct GroceryDeliveryAppAttributes: ActivityAttributes, Identifiable {
    public typealias LiveDeliveryData = ContentState

    public struct ContentState: Codable, Hashable {
        var courierName: String
        var deliveryTime: Date
        var heading: String
        var subHeading: String
    }
    var numberOfGroceyItems: Int
    var id = UUID()
}

@available(iOSApplicationExtension 16.1, *)
struct LiveWidgetExampleLiveActivity: Widget {
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GroceryDeliveryAppAttributes.self) { context in
            LockScreenView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    dynamicIslandExpandedLeadingView(context: context)
                 }
                 
                 DynamicIslandExpandedRegion(.trailing) {
                     dynamicIslandExpandedTrailingView(context: context)
                 }
                 
                 DynamicIslandExpandedRegion(.center) {
                     dynamicIslandExpandedCenterView(context: context)
                 }

//                DynamicIslandExpandedRegion(.bottom) {
//                    dynamicIslandExpandedBottomView(context: context)
//                }
//
              } compactLeading: {
                  compactLeadingView(context: context)
              } compactTrailing: {
                  compactTrailingView(context: context)
              } minimal: {
                  minimalView(context: context)
              }
              .keylineTint(.cyan)
        }
    }
    
    
    //MARK: Expanded Views
    func dynamicIslandExpandedLeadingView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
        
      VStack{
        
        Text("Arsenal")
          .font(.caption2).bold()
        Image("arsenal").resizable().scaledToFit().cornerRadius(10)
          .frame(width: 60, height: 60)
        Text("0")
          .font(.headline).bold()
      }
     
        
        
    }
    
    func dynamicIslandExpandedTrailingView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
      VStack{
        
        
        Text("Man United")
        .font(.caption2).bold()
        Image("manchester").resizable().scaledToFit().cornerRadius(10)
          .frame(width: 60, height: 60)
        Text("2")
          .font(.headline).bold()
      }
     
    }
    
    func dynamicIslandExpandedBottomView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
  
      return VStack(alignment: .leading) {
                    Text(context.state.heading)
                          .font(.headline).frame(alignment: .leading)
                      Text(context.state.subHeading)
                          .font(.subheadline).frame(alignment: .leading)
                  }
                  
              
    }
    
    func dynamicIslandExpandedCenterView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
      VStack{
        Text("86 mins")
          .font(.headline)
        Text("Emirates Stadium").font(.caption2)
        Text("Referee: Michael Oliver").font(.footnote).italic()
      }
    }
    
    
    //MARK: Compact Views
    func compactLeadingView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
   
      Image(systemName: "football").foregroundColor(Color.green)

    }
    
    func compactTrailingView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {

         
      Text("ARS 0-2 MUN").font(.caption2)

    }
    
    func minimalView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
        VStack(alignment: .center) {
            Image(systemName: "timer")
            Text(context.state.deliveryTime, style: .timer)
                .multilineTextAlignment(.center)
                .monospacedDigit()
                .font(.caption2)
        }
    }
}





@available(iOSApplicationExtension 16.1, *)
struct LockScreenView: View {
    var context: ActivityViewContext<GroceryDeliveryAppAttributes>
    var body: some View {
       
            HStack {
                VStack(alignment: .center) {
                  Text("Arsenal")
                    .font(.caption2).bold()
                  Image("arsenal").resizable().scaledToFit().cornerRadius(10)
                    .frame(width: 60, height: 60)
                  Text("0")
                    .font(.headline).bold()
                }.frame(maxWidth: .infinity)
              
              VStack{
                Text("86 mins")
                  .font(.headline)
                Text("Emirates Stadium").font(.caption2)
                Text("Referee: Michael Oliver").font(.footnote).italic()
              }.frame(maxWidth: .infinity)
              
              VStack{
                
                
                Text("Man United")
                .font(.caption2).bold()
                Image("manchester").resizable().scaledToFit().cornerRadius(10)
                  .frame(width: 60, height: 60)
                Text("2")
                  .font(.headline).bold()
              }.frame(maxWidth: .infinity)

              
            }.padding(10)
     
    }
}

struct BottomLineView: View {
    var time: Date
    var body: some View {
        HStack {
            Divider().frame(width: 50,
                            height: 10)
            .overlay(.gray).cornerRadius(5)
            Image("delivery")
            VStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(style: StrokeStyle(lineWidth: 1,
                                               dash: [4]))
                    .frame(height: 10)
                    .overlay(Text(time, style: .timer).font(.system(size: 8)).multilineTextAlignment(.center))
            }
            Image("home-address")
        }
    }
}
