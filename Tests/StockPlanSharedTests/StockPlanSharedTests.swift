import Foundation
import Testing
@testable import StockPlanShared

@Test func authLoginRequestRoundTripJSON() throws {
    let payload = AuthLoginRequest(email: "user@example.com", password: "secret")

    let encoded = try JSONEncoder().encode(payload)
    let decoded = try JSONDecoder().decode(AuthLoginRequest.self, from: encoded)

    #expect(decoded == payload)
}

@Test func stockResponseRoundTripJSON() throws {
    let payload = StockResponse(
        id: "stock-id",
        symbol: "AAPL",
        shares: 10,
        buyPrice: 150.25,
        buyDate: "2026-01-10",
        notes: "Starter position"
    )

    let encoded = try JSONEncoder().encode(payload)
    let decoded = try JSONDecoder().decode(StockResponse.self, from: encoded)

    #expect(decoded == payload)
}
