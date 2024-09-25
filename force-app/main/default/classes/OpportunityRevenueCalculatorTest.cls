@isTest
public class OpportunityRevenueCalculatorTest {
    @isTest
    static void testCalculateRevenue() {
        // Step 1: Check if a Standard Price Book exists
        Pricebook2 standardPriceBook;
        try {
            standardPriceBook = [SELECT Id FROM Pricebook2 WHERE IsStandard = TRUE AND IsActive = TRUE LIMIT 1];
        } catch (QueryException e) {
            // If there is no standard price book, handle it appropriately
            System.debug('No active standard price book found. Please ensure one exists.');
            return; // Skip the test if there's no standard price book
        }

        // Step 2: Create a Product
        Product2 product = new Product2(
            Name = 'GenWatt Diesel 1000kW',
            IsActive = TRUE,
            ProductCode = 'GC1060'
        );
        insert product;

        // Step 3: Create a Pricebook Entry for the Product with a standard price
        PricebookEntry standardPriceEntry = new PricebookEntry(
            Pricebook2Id = standardPriceBook.Id,
            Product2Id = product.Id,
            UnitPrice = 100000, // Standard price
            IsActive = TRUE
        );
        insert standardPriceEntry;

        // Step 4: Create an Opportunity and associate it with the Price Book
        Opportunity opportunity = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Pricebook2Id = standardPriceBook.Id // Associate with the Price Book
        );
        insert opportunity;

        // Step 5: Create an Opportunity Line Item with TotalPrice specified
        Decimal quantity = 5;
        OpportunityLineItem lineItem = new OpportunityLineItem(
            OpportunityId = opportunity.Id,
            PricebookEntryId = standardPriceEntry.Id, // Link to the standard Pricebook Entry
            Quantity = quantity,
            UnitPrice = standardPriceEntry.UnitPrice,
            TotalPrice = quantity * standardPriceEntry.UnitPrice // Calculate and set the TotalPrice
        );
        insert lineItem;

        // Step 6: Calculate revenue
        Decimal revenue = OpportunityRevenueCalculator.calculateRevenue(opportunity);

        // Step 7: Assert the expected revenue
        System.assertEquals(500000, revenue); // Expecting total revenue of 500000
    }
}
