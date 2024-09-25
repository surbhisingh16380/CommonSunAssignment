public class OpportunityRevenueCalculator {
    public static Decimal calculateRevenue(Opportunity opportunity) {
        // Check if the opportunity is null
        if (opportunity == null) {
            throw new IllegalArgumentException('Opportunity cannot be null.');
        }

        Decimal totalRevenue = 0;

        // Query the Opportunity Line Items associated with the Opportunity
        List<OpportunityLineItem> lineItems = [
            SELECT Quantity, UnitPrice 
            FROM OpportunityLineItem 
            WHERE OpportunityId = :opportunity.Id
        ];

        // Check if there are line items
        if (lineItems.isEmpty()) {
            // Optionally log or handle the case where there are no line items
            return totalRevenue; // Returns 0 if no line items are present
        }

        // Calculate total revenue from all line items
        for (OpportunityLineItem lineItem : lineItems) {
            // Use 0 if Quantity or UnitPrice is null
            Decimal quantity = lineItem.Quantity != null ? lineItem.Quantity : 0;
            Decimal unitPrice = lineItem.UnitPrice != null ? lineItem.UnitPrice : 0;
            totalRevenue += quantity * unitPrice;
        }

        return totalRevenue; // Returns the total revenue
    }
}
