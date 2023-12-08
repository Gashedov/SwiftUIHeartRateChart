import Foundation

extension [HeartRateData] {
    var minBPM: Int {
        self.min { first, second in
            first.dailyMin < second.dailyMin
        }?.dailyMin ?? 0
    }

    var maxBPM: Int {
        self.max { first, second in
            first.dailyMax < second.dailyMax
        }?.dailyMax ?? 0
    }

    var earliestDate: Date {
        self.min { first, second in
            first.day < second.day
        }?.day ?? Date()
    }

    var latestDate: Date {
        self.max { first, second in
            first.day < second.day
        }?.day ?? Date()
    }

    var dateInterval: DateInterval {
        DateInterval(start: earliestDate, end: latestDate)
    }
}
