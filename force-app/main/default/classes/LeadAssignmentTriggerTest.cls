@isTest
public class LeadAssignmentTriggerTest {
    @isTest
    static void testLeadAssignment() {
        // Step 1: Create Users for testing
        User salesRep1 = new User(
            Username = 'salesrep1@example.com',
            Email = 'salesrep1@example.com',
            Alias = 'srep1',
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1].Id,
            City = 'San Francisco', // Ensure the city matches your trigger's logic
            Department = 'Sales',
            TimeZoneSidKey = 'GMT',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            FirstName = 'Sales',
            LastName = 'Representative 1'
        );
        insert salesRep1;

        User salesRep2 = new User(
            Username = 'salesrep2@example.com',
            Email = 'salesrep2@example.com',
            Alias = 'srep2',
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1].Id,
            City = 'San Francisco', // Same city for round-robin
            Department = 'Sales',
            TimeZoneSidKey = 'GMT',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            FirstName = 'Sales',
            LastName = 'Representative 2'
        );
        insert salesRep2;

        // Step 2: Create a Lead with matching City
        Lead testLead = new Lead(LastName = 'Test Lead', Company = 'Test Company', City = 'San Francisco', Email = 'test@example.com');

        Test.startTest();
        insert testLead; // This will invoke the trigger
        Test.stopTest();

        // Step 3: Query to verify assignment
        Lead assignedLead = [SELECT Id, OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertNotEquals(null, assignedLead.OwnerId, 'Lead should be assigned.');
        
        // Correct the assertion call here:
        System.assert(new Set<Id>{salesRep1.Id, salesRep2.Id}.contains(assignedLead.OwnerId), 'Lead should be assigned to an active sales representative.');
    }
}
