import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            HealthChartView()
                .frame(height: 220)
        }
    }
}

#Preview {
    ContentView()
}
