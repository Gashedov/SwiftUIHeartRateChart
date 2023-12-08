import SwiftUI
import Charts

struct HealthChartView: View {
    @State private var data: [HeartRateData] = []
    @State private var chartColor: Color = .red
    @State private var avarageMin: Int = 50
    @State private var avarageMax: Int = 90

    var body: some View {
        GeometryReader(content: { geometry in
            chart
                .padding(.top, geometry.size.height/3.6)
                .padding(.leading, 4)
                .padding(.trailing, 46)
        })
        .background(Color.black)
    }

    private var chart: some View {
        Chart(data, id: \.day) { dataPoint in
            Plot {
                BarMark(
                    x: .value("Day", dataPoint.day, unit: .day),
                    yStart: .value("BPM Min", dataPoint.dailyMin),
                    yEnd: .value("BPM Max", dataPoint.dailyMax),
                    width: .fixed(6)
                )
                .clipShape(Capsule())
                .foregroundStyle(chartColor.gradient)
            }
            .accessibilityLabel(dataPoint.day.weekdayString)
            .accessibilityValue("\(dataPoint.dailyMin) to \(dataPoint.dailyMax) BPM")
            RuleMark(y: .value("min", avarageMin))
                .foregroundStyle(.gray)
                .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                .annotation(position: .trailing, alignment: .leading) {
                    Text(String(avarageMin))
                        .foregroundStyle(.gray)
                        .offset(x: 10, y: 0)
                }
            RuleMark(y: .value("max", avarageMax))
                .foregroundStyle(.gray)
                .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                .annotation(position: .trailing, alignment: .leading) {
                    Text(String(avarageMax))
                        .foregroundStyle(.gray)
                        .offset(x: 10, y: 0)
                }
            BarMark(
                x: .value("Day", data.last!.day, unit: .day),
                yStart: .value("BPM Min", avarageMin-10),
                yEnd: .value("BPM Max", avarageMax+10),
                width: .fixed(1)
            )
            .clipShape(Capsule())
            .foregroundStyle(.white.opacity(0.4))
        }
        // You can replace it with .task and fetch data from healthKit async
        .onAppear {
            data = HeartRateData.lastMonth
            avarageMax = roundToTens(data.maxBPM)
            avarageMin = roundToTens(data.minBPM)
        }
        .accessibilityChartDescriptor(self)
        .chartYAxis(.hidden)
        .chartXAxis(.hidden)
    }
    
    private func roundToTens(_ x : Int) -> Int {
        return 10 * Int(round(Double(x) / 10.0))
    }
}

// MARK: - Accessibility
extension HealthChartView: AXChartDescriptorRepresentable {
    func makeChartDescriptor() -> AXChartDescriptor {

        let dateStringConverter: ((Date) -> (String)) = { date in
            date.formatted(date: .complete, time: .omitted)
        }

        let min = data.map(\.dailyMin).min() ?? 0
        let max = data.map(\.dailyMax).max() ?? 0

        let xAxis = AXCategoricalDataAxisDescriptor(
            title: "Day",
            categoryOrder: data.map { dateStringConverter($0.day) }
        )

        let yAxis = AXNumericDataAxisDescriptor(
            title: "Heart Rate",
            range: Double(min)...Double(max),
            gridlinePositions: []
        ) { value in "Average: \(Int(value)) BPM" }

        let series = AXDataSeriesDescriptor(
            name: "Last Week",
            isContinuous: false,
            dataPoints: data.map {
                .init(
                    x: dateStringConverter($0.day),
                    y: Double($0.dailyAverage),
                    label: "Min: \($0.dailyMin) BPM, Max: \($0.dailyMax) BPM")
            }
        )

        return AXChartDescriptor(
            title: "Heart Rate range",
            summary: nil,
            xAxis: xAxis,
            yAxis: yAxis,
            additionalAxes: [],
            series: [series]
        )
    }
}

#Preview {
    HealthChartView()
}
