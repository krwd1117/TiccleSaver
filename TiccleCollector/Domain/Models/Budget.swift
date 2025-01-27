import Foundation

struct Budget: Codable, Identifiable {
    let id: UUID
    let amount: Decimal
    let date: Date
    let createdAt: Date
    
    init(
        id: UUID = UUID(),
        amount: Decimal,
        date: Date,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.amount = amount
        self.date = date
        self.createdAt = createdAt
    }
}

extension Budget {
    struct Status {
        let isOverSpent: Bool
        let hasCarryOver: Bool
        let remainingAmount: Decimal
        
        init(
            isOverSpent: Bool = false,
            hasCarryOver: Bool = false,
            remainingAmount: Decimal = 0
        ) {
            self.isOverSpent = isOverSpent
            self.hasCarryOver = hasCarryOver
            self.remainingAmount = remainingAmount
        }
    }
}

extension Budget {
    var dateComponents: DateComponents {
        Calendar.current.dateComponents([.year, .month, .day], from: date)
    }
    
    func isSameDay(as date: Date) -> Bool {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        return dateComponents.year == components.year &&
               dateComponents.month == components.month &&
               dateComponents.day == components.day
    }
}
