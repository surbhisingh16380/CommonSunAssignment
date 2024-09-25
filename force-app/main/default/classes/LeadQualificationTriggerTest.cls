@isTest
public class LeadQualificationTriggerTest {

    @isTest
    static void testLeadQualificationWithValidFields() {
        // Create a Lead with valid fields
        Lead testLead = new Lead(
            LastName = 'Test',
            Email = 'test@example.com',
            Phone = '1234567890',
            FirstName = 'First',
            Company = 'Test Company',
            Status = 'Open - Not Contacted' // Use a valid status
        );

        Test.startTest(); // Start the test context
        // Insert the Lead
        insert testLead;

        // Convert the Lead using the Database.convertLead method
        Database.LeadConvert leadConvert = new Database.LeadConvert();
        leadConvert.setLeadId(testLead.Id);
        
        // Use a valid converted status that exists in your org
        leadConvert.setConvertedStatus('Closed - Converted'); // Replace with the correct status if needed
        
        Database.convertLead(leadConvert);
        Test.stopTest(); // Stop the test context

        // Assert the lead was converted successfully
        Lead convertedLead = [SELECT Id, IsConverted FROM Lead WHERE Id = :testLead.Id];
        System.assert(convertedLead.IsConverted, 'Lead should be marked as converted.');
    }

    @isTest
    static void testLeadQualificationWithInvalidFields() {
        // Create a Lead with missing required fields
        Lead testLead = new Lead(
            LastName = 'Test',
            Email = null, // Missing Email
            Phone = '1234567890',
            FirstName = 'First',
            Company = 'Test Company',
            Status = 'Open - Not Contacted' // Use a valid status
        );

        Test.startTest(); // Start the test context
        // Insert the Lead (should succeed)
        insert testLead;

        // Prepare to attempt conversion after inserting the lead
        Database.LeadConvert leadConvert = new Database.LeadConvert();
        leadConvert.setLeadId(testLead.Id);
        
        // Use a valid converted status that exists in your org
        leadConvert.setConvertedStatus('Closed - Converted'); // Replace with the correct status if needed

        // Attempt conversion in the same test context
        try {
            Database.convertLead(leadConvert);
            // If no exception is thrown, fail the test
            System.assert(false, 'Expected DmlException not thrown due to missing fields.');
        } catch (DmlException e) {
            // Check for the expected error message
            System.assert(e.getMessage().contains('Lead must have a valid Email, Phone, First Name, and Last Name before conversion.'),
                'Expected validation error message was not thrown.');
        }
        Test.stopTest(); // Stop the test context
    }
}
