//
//  Extension.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}

extension Encodable {
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}


extension String {
    func toDate(dateFormat: String, setLocalTimeZone: Bool = false) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale(identifier: "en_US_POSIX")
        if !setLocalTimeZone { formatter.timeZone = TimeZone(secondsFromGMT: 0) }
        return formatter.date(from: self)
    }
}

extension Date {
    static func dateDictionary(from arrayOfDates: [Date]) -> [String: [Date]] {
        // declare a dictionary
        return Dictionary(grouping: arrayOfDates) { date -> String in
            // get the month as an int
            let monthAsInt = Calendar.current.dateComponents([.month], from: date).month
            // convert the int to a string...i think you probably want to return an int value and do the month conversion in your tableview or collection view
            let monthName = DateFormatter().monthSymbols[(monthAsInt ?? 0) - 1]
            // return the month string
            return monthName
        }
    }
    
    func toString(_ format: String = "dd-MM-yyyy", setLocalTimeZone: Bool = false) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_SG")
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        formatter.timeZone = setLocalTimeZone ? .current : TimeZone(secondsFromGMT: 0)
        return formatter.string(from: self)
    }
}

extension Array where Element: Dated {
    func groupedBy(dateComponents: Set<Calendar.Component>) -> [Date: [Element]] {
        let initial: [Date: [Element]] = [:]
        let groupedByDateComponents = reduce(into: initial) { acc, cur in
            let components = Calendar.current.dateComponents(dateComponents, from: cur.date)
            let date = Calendar.current.date(from: components)!
            let existing = acc[date] ?? []
            acc[date] = existing + [cur]
        }
        
        return groupedByDateComponents
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

protocol Dated {
    var date: Date { get }
}
