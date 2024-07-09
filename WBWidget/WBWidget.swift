//
//  WBWidget.swift
//  WBWidget
//
//  Created by Назар Ткаченко on 22.06.2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    let data: DataService = .init()
    
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), someValue: data.result())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), someValue: data.result())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: Date(), someValue: data.result())
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let someValue: Int
}

struct WBWidgerEntryView : View {
    var entry: Provider.Entry
    
    let data: DataService = .init()
    
    var body: some View {
        VStack {
            Text(String(data.result()))
            
            Button(intent: CustomAppIntent()) {
                Text("+")
                    .contentShape(Rectangle())
            }
        }
    }
}

struct WBWidget: Widget {
    let kind: String = "WBWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                WBWidgerEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                WBWidgerEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    WBWidget()
} timeline: {
    SimpleEntry(date: Date(), someValue: 2)
    SimpleEntry(date: Date(), someValue: 3)
}
