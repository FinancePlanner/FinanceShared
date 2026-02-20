import Foundation

public struct AuthRegisterRequest: Codable, Sendable, Equatable {
    public let email: String
    public let password: String

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

public struct AuthLoginRequest: Codable, Sendable, Equatable {
    public let email: String
    public let password: String

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

public struct AuthResponse: Codable, Sendable, Equatable {
    public let token: String
    public let userId: UUID
    public let expiresIn: Int
    public let refreshToken: String
    public let refreshExpiresIn: Int

    public init(
        token: String,
        userId: UUID,
        expiresIn: Int,
        refreshToken: String,
        refreshExpiresIn: Int
    ) {
        self.token = token
        self.userId = userId
        self.expiresIn = expiresIn
        self.refreshToken = refreshToken
        self.refreshExpiresIn = refreshExpiresIn
    }
}

/// Compatibility alias for endpoint layers that use API-style response names.
public typealias APIAuth = AuthResponse

public struct AuthUserResponse: Codable, Sendable, Equatable {
    public let id: String
    public let email: String

    public init(id: String, email: String) {
        self.id = id
        self.email = email
    }
}

public struct AuthForgotPasswordRequest: Codable, Sendable, Equatable {
    public let email: String

    public init(email: String) {
        self.email = email
    }
}

public struct AuthForgotPasswordResponse: Codable, Sendable, Equatable {
    public let message: String
    public let resetCode: String?

    public init(message: String, resetCode: String?) {
        self.message = message
        self.resetCode = resetCode
    }
}

public struct AuthResetPasswordRequest: Codable, Sendable, Equatable {
    public let email: String
    public let code: String
    public let newPassword: String

    public init(email: String, code: String, newPassword: String) {
        self.email = email
        self.code = code
        self.newPassword = newPassword
    }
}

public struct AuthRefreshRequest: Codable, Sendable, Equatable {
    public let refreshToken: String

    public init(refreshToken: String) {
        self.refreshToken = refreshToken
    }
}
