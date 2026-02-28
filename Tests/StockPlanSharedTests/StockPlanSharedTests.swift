import Foundation
import Testing

@testable import StockPlanShared

@Test func authLoginRequestRoundTripJSON() throws {
    let payload = AuthLoginRequest(email: "user@example.com", password: "secret")

    let encoded = try JSONEncoder().encode(payload)
    let decoded = try JSONDecoder().decode(AuthLoginRequest.self, from: encoded)

    #expect(decoded == payload)
}

@Test func authRegisterRequestRoundTripJSON() throws {
    let payload = AuthRegisterRequest(
        username: "valid_user",
        password: "Password123",
        email: "user@example.com",
        firstName: "Jane",
        lastName: "Doe",
        dateOfBirth: Date(timeIntervalSince1970: 946_684_800)
    )

    let encoded = try JSONEncoder().encode(payload)
    let decoded = try JSONDecoder().decode(AuthRegisterRequest.self, from: encoded)

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

@Test func apiSuccessRoundTripJSON() throws {
    let payload = APISuccess(success: true)

    let encoded = try JSONEncoder().encode(payload)
    let decoded = try JSONDecoder().decode(APISuccess.self, from: encoded)

    #expect(decoded == payload)
}

@Test func apiEnvelopeRoundTripJSON() throws {
    let auth = AuthResponse(
        token: "jwt-token",
        userId: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!,
        expiresIn: 604800,
        refreshToken: "refresh-token",
        refreshExpiresIn: 2_592_000,
        username: "valid_user",
        email: "user@example.com",
        firstName: "Jane",
        lastName: "Doe",
        dateOfBirth: Date(timeIntervalSince1970: 946_684_800)
    )

    let payload = APIEnvelope(success: true, data: auth, message: "ok")

    let encoded = try JSONEncoder().encode(payload)
    let decoded = try JSONDecoder().decode(APIEnvelope<AuthResponse>.self, from: encoded)

    #expect(decoded == payload)
}

@Test func bulkStockRequestRoundTripJSON() throws {
    let payload = BulkStockRequest(stocks: [
        StockRequest(
            symbol: "AAPL", shares: 10.5, buyPrice: 150.25, buyDate: "2026-01-10", notes: "First"),
        StockRequest(
            symbol: "MSFT", shares: 5, buyPrice: 300.00, buyDate: "2026-02-15", notes: nil),
    ])

    let encoded = try JSONEncoder().encode(payload)
    let decoded = try JSONDecoder().decode(BulkStockRequest.self, from: encoded)

    #expect(decoded == payload)
}

@Test func bulkStockResponseRoundTripJSON() throws {
    let payload = BulkStockResponse(
        created: 1,
        failed: 1,
        results: [
            BulkStockResultItem(
                index: 0,
                stock: StockResponse(
                    id: "id-1", symbol: "AAPL", shares: 10.5, buyPrice: 150.25,
                    buyDate: "2026-01-10", notes: nil)
            ),
            BulkStockResultItem(index: 1, error: "Invalid buyDate. Expected YYYY-MM-DD."),
        ]
    )

    let encoded = try JSONEncoder().encode(payload)
    let decoded = try JSONDecoder().decode(BulkStockResponse.self, from: encoded)

    #expect(decoded == payload)
}

@Test func bulkStockRequestEmptyArray() throws {
    let payload = BulkStockRequest(stocks: [])

    let encoded = try JSONEncoder().encode(payload)
    let decoded = try JSONDecoder().decode(BulkStockRequest.self, from: encoded)

    #expect(decoded == payload)
    #expect(decoded.stocks.isEmpty)
}
