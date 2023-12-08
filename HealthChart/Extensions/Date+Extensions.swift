import UIKit

extension Date {
    enum MonthOfYear: Int {
        case january = 1
        case february
        case march
        case april
        case may
        case june
        case july
        case august
        case september
        case october
        case november
        case december

        var title: String {
            switch self {
            case .january:
                return "january"
            case .february:
                return "february"
            case .march:
                return "march"
            case .april:
                return "april"
            case .may:
                return "may"
            case .june:
                return "june"
            case .july:
                return "july"
            case .august:
                return "august"
            case .september:
                return "september"
            case .october:
                return "october"
            case .november:
                return "november"
            case .december:
                return "december"
            }
        }
    }

    /// Returns true if date year equals to the current system date year
    var isInThisYear: Bool { isInSameYear(as: Date()) }

    /// Initialize the date for specific data components.
    /// By default, the calendar is used from the settings without the timezone.
    /// If you want to convert the date from one calendar to another, you can transfer another type of calendar.
    init(
        year: Int,
        month: MonthOfYear = MonthOfYear.january,
        day: Int = 1,
        hour: Int = 0,
        minute: Int = 0,
        second: Int = 0,
        calendar: Calendar = {
            var calendar = Calendar.current
            calendar.timeZone = TimeZone(secondsFromGMT: 0)!
            return calendar
        }()
    ) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month.rawValue
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        if let date = calendar.date(from: dateComponents) {
            self = date
        } else {
            let dateDescription = "\(day)\\\(month)\\\(year)"
            let timeDescription = "\(hour):\(minute):\(second)"
            fatalError(
                "The date can't be created by format \(dateDescription) \(timeDescription) for \(calendar.identifier)"
            )
        }
    }

    /// Start date in component
    func startDate(component: Calendar.Component) -> Date {
        let calendar = Calendar.current
        let interval = calendar.dateInterval(of: component, for: self)!
        let startDay = interval.start
        return startDay
    }

    /// End date in component
    func endDate(component: Calendar.Component) -> Date {
        let calendar = Calendar.current
        let interval = calendar.dateInterval(of: component, for: self)!
        let endDay = interval.end
        return endDay
    }

    /// Offset date in items
    func offsetDate(byComponent: Calendar.Component = .day, offset: Int = 1) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: byComponent, value: offset, to: self)!
    }

    /// Returns number of days in specific month of specific year
    static func daysCountIn(month: MonthOfYear, year: Int) -> Int {
        let calendar = Calendar.current
        let date = Date(year: year, month: month)
        guard let range = calendar.range(of: .day, in: .month, for: date) else { return 0 }
        return range.count
    }

    /// Returns true if *date* takes place in the same year
    func isInSameYear(as date: Date) -> Bool { isEqual(to: date, toGranularity: .year) }

    /// Returns true if *date* have the same *component* according to *calendar*
    func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }

    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
}

extension Date {
    // Used for charts where the day of the week is used: visually  M/T/W etc
    // (but we want VoiceOver to read out the full day)
    var weekdayString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"

        return formatter.string(from: self)
    }
}


