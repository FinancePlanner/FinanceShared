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
        refreshExpiresIn: 2592000
    )

    let payload = APIEnvelope(success: true, data: auth, message: "ok")

    let encoded = try JSONEncoder().encode(payload)
    let decoded = try JSONDecoder().decode(APIEnvelope<AuthResponse>.self, from: encoded)

    #expect(decoded == payload)
}
