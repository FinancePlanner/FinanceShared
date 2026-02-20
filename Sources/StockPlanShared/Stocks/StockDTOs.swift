import Foundation

public struct StockRequest: Codable, Sendable, Equatable {
    public let symbol: String
    public let shares: Double
    public let buyPrice: Double
    public let buyDate: String
    public let notes: String?

    public init(symbol: String, shares: Double, buyPrice: Double, buyDate: String, notes: String?) {
        self.symbol = symbol
        self.shares = shares
        self.buyPrice = buyPrice
        self.buyDate = buyDate
        self.notes = notes
    }
}

public struct StockResponse: Codable, Sendable, Equatable {
    public let id: String
    public let symbol: String
    public let shares: Double
    public let buyPrice: Double
    public let buyDate: String
    public let notes: String?

    public init(id: String, symbol: String, shares: Double, buyPrice: Double, buyDate: String, notes: String?) {
        self.id = id
        self.symbol = symbol
        self.shares = shares
        self.buyPrice = buyPrice
        self.buyDate = buyDate
        self.notes = notes
    }
}

public struct WatchlistItemRequest: Codable, Sendable, Equatable {
    public let symbol: String

    public init(symbol: String) {
        self.symbol = symbol
    }
}

public struct WatchlistItemResponse: Codable, Sendable, Equatable {
    public let id: String
    public let symbol: String

    public init(id: String, symbol: String) {
        self.id = id
        self.symbol = symbol
    }
}

public struct ResearchNoteRequest: Codable, Sendable, Equatable {
    public let symbol: String
    public let title: String?
    public let thesis: String
    public let risks: String?
    public let catalysts: String?
    public let referenceLinks: [String]?

    public init(
        symbol: String,
        title: String?,
        thesis: String,
        risks: String?,
        catalysts: String?,
        referenceLinks: [String]?
    ) {
        self.symbol = symbol
        self.title = title
        self.thesis = thesis
        self.risks = risks
        self.catalysts = catalysts
        self.referenceLinks = referenceLinks
    }
}

public struct ResearchNoteResponse: Codable, Sendable, Equatable {
    public let id: String
    public let symbol: String
    public let title: String?
    public let thesis: String
    public let risks: String?
    public let catalysts: String?
    public let referenceLinks: [String]?

    public init(
        id: String,
        symbol: String,
        title: String?,
        thesis: String,
        risks: String?,
        catalysts: String?,
        referenceLinks: [String]?
    ) {
        self.id = id
        self.symbol = symbol
        self.title = title
        self.thesis = thesis
        self.risks = risks
        self.catalysts = catalysts
        self.referenceLinks = referenceLinks
    }
}

public struct TargetRequest: Codable, Sendable, Equatable {
    public let symbol: String
    public let scenario: String
    public let targetPrice: Double
    public let targetDate: String?
    public let rationale: String?

    public init(
        symbol: String,
        scenario: String,
        targetPrice: Double,
        targetDate: String?,
        rationale: String?
    ) {
        self.symbol = symbol
        self.scenario = scenario
        self.targetPrice = targetPrice
        self.targetDate = targetDate
        self.rationale = rationale
    }
}

public struct TargetResponse: Codable, Sendable, Equatable {
    public let id: String
    public let symbol: String
    public let scenario: String
    public let targetPrice: Double
    public let targetDate: String?
    public let rationale: String?

    public init(
        id: String,
        symbol: String,
        scenario: String,
        targetPrice: Double,
        targetDate: String?,
        rationale: String?
    ) {
        self.id = id
        self.symbol = symbol
        self.scenario = scenario
        self.targetPrice = targetPrice
        self.targetDate = targetDate
        self.rationale = rationale
    }
}

public struct StockHistory: Codable, Sendable, Equatable {
    public let date: String
    public let open: Double
    public let high: Double
    public let low: Double
    public let close: Double
    public let volume: Int

    public init(date: String, open: Double, high: Double, low: Double, close: Double, volume: Int) {
        self.date = date
        self.open = open
        self.high = high
        self.low = low
        self.close = close
        self.volume = volume
    }
}

public struct StockNews: Codable, Sendable, Equatable {
    public let title: String
    public let url: String
    public let date: String

    public init(title: String, url: String, date: String) {
        self.title = title
        self.url = url
        self.date = date
    }
}
