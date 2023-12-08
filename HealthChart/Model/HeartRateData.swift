import Foundation

struct HeartRateData {
    let day: Date
    let dailyAverage: Int
    let dailyMin: Int
    let dailyMax: Int
    
    static let lastMonth: [HeartRateData] = [
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 1),
            dailyAverage: 127,
            dailyMin: 55,
            dailyMax: 94
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 1),
            dailyAverage: 127,
            dailyMin: 55,
            dailyMax: 94
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 1),
            dailyAverage: 60,
            dailyMin: 50,
            dailyMax: 89
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 2),
            dailyAverage: 61,
            dailyMin: 41,
            dailyMax: 84
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 3),
            dailyAverage: 76,
            dailyMin: 66,
            dailyMax: 96
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 3),
            dailyAverage: 86,
            dailyMin: 80,
            dailyMax: 93
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 4),
            dailyAverage: 84,
            dailyMin: 54,
            dailyMax: 82
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 5),
            dailyAverage: 79,
            dailyMin: 50,
            dailyMax: 55
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 5),
            dailyAverage: 79,
            dailyMin: 76,
            dailyMax: 90
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 6),
            dailyAverage: 86,
            dailyMin: 56,
            dailyMax: 93
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 7),
            dailyAverage: 93,
            dailyMin: 68,
            dailyMax: 90
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 8),
            dailyAverage: 93,
            dailyMin: 68,
            dailyMax: 150
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 9),
            dailyAverage: 93,
            dailyMin: 88,
            dailyMax: 140
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 10),
            dailyAverage: 93,
            dailyMin: 100,
            dailyMax: 170
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 11),
            dailyAverage: 93,
            dailyMin: 68,
            dailyMax: 100
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 12),
            dailyAverage: 93,
            dailyMin: 99,
            dailyMax: 110
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 13),
            dailyAverage: 93,
            dailyMin: 68,
            dailyMax: 90
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 14),
            dailyAverage: 93,
            dailyMin: 75,
            dailyMax: 133
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 15),
            dailyAverage: 93,
            dailyMin: 73,
            dailyMax: 109
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 16),
            dailyAverage: 93,
            dailyMin: 73,
            dailyMax: 137
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 17),
            dailyAverage: 93,
            dailyMin: 82,
            dailyMax: 169
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 18),
            dailyAverage: 93,
            dailyMin: 62,
            dailyMax: 162
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 19),
            dailyAverage: 93,
            dailyMin: 90,
            dailyMax: 172
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 20),
            dailyAverage: 93,
            dailyMin: 68,
            dailyMax: 164
        ),
//        HeartRateData(
//            day: Date(year: 2022, month: .october, day: 21),
//            dailyAverage: 93,
//            dailyMin: 68,
//            dailyMax: 90
//        ),
//        HeartRateData(
//            day: Date(year: 2022, month: .october, day: 22),
//            dailyAverage: 93,
//            dailyMin: 68,
//            dailyMax: 90
//        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 23),
            dailyAverage: 93,
            dailyMin: 70,
            dailyMax: 177
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 24),
            dailyAverage: 93,
            dailyMin: 100,
            dailyMax: 160
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 25),
            dailyAverage: 93,
            dailyMin: 59,
            dailyMax: 122
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 26),
            dailyAverage: 93,
            dailyMin: 82,
            dailyMax: 113
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 27),
            dailyAverage: 93,
            dailyMin: 77,
            dailyMax: 108
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 28),
            dailyAverage: 93,
            dailyMin: 68,
            dailyMax: 90
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 29),
            dailyAverage: 93,
            dailyMin: 98,
            dailyMax: 134
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 30),
            dailyAverage: 93,
            dailyMin: 101,
            dailyMax: 143
        ),
        HeartRateData(
            day: Date(year: 2022, month: .october, day: 31),
            dailyAverage: 93,
            dailyMin: 88,
            dailyMax: 130
        ),
    ]
}
