@isTest
public class OpportunityStageUpdateTriggerTest {
    @isTest
    static void testOpportunityStageUpdate() {
        // Create a test account because Opportunity requires AccountId
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        // Create an opportunity with the correct field names
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity', 
            CloseDate = System.today().addDays(20),  // Correct field name for the expected close date
            Amount = 15000,  // Amount field
            StageName = 'Prospecting',  // Initial stage
            AccountId = testAccount.Id  // Required AccountId
        );
        
        // Insert the Opportunity record
        insert opp;

        // Query the opportunity to get the updated record
        Opportunity updatedOpp = [SELECT StageName FROM Opportunity WHERE Id = :opp.Id];

        // Assert that the stage has been updated
        System.assertEquals('Closing', updatedOpp.StageName, 'Opportunity stage should be updated to "Closing"');
    }
}
