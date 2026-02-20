import Foundation

public struct AllocationItem: Codable, Sendable, Equatable {
    public let symbol: String
    public let value: Double
    public let currency: String

    public init(symbol: String, value: Double, currency: String) {
        self.symbol = symbol
        self.value = value
        self.currency = currency
    }
}

public struct PortfolioSummaryResponse: Codable, Sendable, Equatable {
    public let baseCurrency: String
    public let totalValue: Double
    public let totalCost: Double
    public let unrealizedPnl: Double
    public let realizedPnl: Double
    public let allocation: [AllocationItem]

    public init(
        baseCurrency: String,
        totalValue: Double,
        totalCost: Double,
        unrealizedPnl: Double,
        realizedPnl: Double,
        allocation: [AllocationItem]
    ) {
        self.baseCurrency = baseCurrency
        self.totalValue = totalValue
        self.totalCost = totalCost
        self.unrealizedPnl = unrealizedPnl
        self.realizedPnl = realizedPnl
        self.allocation = allocation
    }
}

public struct PerformancePoint: Codable, Sendable, Equatable {
    public let date: String
    public let value: Double

    public init(date: String, value: Double) {
        self.date = date
        self.value = value
    }
}

public struct PortfolioPerformanceResponse: Codable, Sendable, Equatable {
    public let baseCurrency: String
    public let points: [PerformancePoint]

    public init(baseCurrency: String, points: [PerformancePoint]) {
        self.baseCurrency = baseCurrency
        self.points = points
    }
}

public struct TransactionResponse: Codable, Sendable, Equatable {
    public let id: String
    public let accountId: String
    public let instrumentId: String
    public let type: String
    public let quantity: Double?
    public let price: Double?
    public let currency: String
    public let tradeDate: String
    public let settleDate: String?
    public let fees: Double?

    public init(
        id: String,
        accountId: String,
        instrumentId: String,
        type: String,
        quantity: Double?,
        price: Double?,
        currency: String,
        tradeDate: String,
        settleDate: String?,
        fees: Double?
    ) {
        self.id = id
        self.accountId = accountId
        self.instrumentId = instrumentId
        self.type = type
        self.quantity = quantity
        self.price = price
        self.currency = currency
        self.tradeDate = tradeDate
        self.settleDate = settleDate
        self.fees = fees
    }
}

public struct LotResponse: Codable, Sendable, Equatable {
    public let id: String
    public let accountId: String
    public let instrumentId: String
    public let openDate: String
    public let closeDate: String?
    public let openQuantity: Double
    public let remainingQuantity: Double
    public let openPrice: Double
    public let currency: String
    public let realizedPnl: Double?
    public let status: String

    public init(
        id: String,
        accountId: String,
        instrumentId: String,
        openDate: String,
        closeDate: String?,
        openQuantity: Double,
        remainingQuantity: Double,
        openPrice: Double,
        currency: String,
        realizedPnl: Double?,
        status: String
    ) {
        self.id = id
        self.accountId = accountId
        self.instrumentId = instrumentId
        self.openDate = openDate
        self.closeDate = closeDate
        self.openQuantity = openQuantity
        self.remainingQuantity = remainingQuantity
        self.openPrice = openPrice
        self.currency = currency
        self.realizedPnl = realizedPnl
        self.status = status
    }
}

public struct PnlBySymbol: Codable, Sendable, Equatable {
    public let symbol: String
    public let currency: String
    public let realizedPnl: Double
    public let unrealizedPnl: Double

    public init(symbol: String, currency: String, realizedPnl: Double, unrealizedPnl: Double) {
        self.symbol = symbol
        self.currency = currency
        self.realizedPnl = realizedPnl
        self.unrealizedPnl = unrealizedPnl
    }
}

public struct PnlResponse: Codable, Sendable, Equatable {
    public let baseCurrency: String
    public let items: [PnlBySymbol]

    public init(baseCurrency: String, items: [PnlBySymbol]) {
        self.baseCurrency = baseCurrency
        self.items = items
    }
}
