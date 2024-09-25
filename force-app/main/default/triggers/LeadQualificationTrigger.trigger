trigger LeadQualificationTrigger on Lead (before insert, before update) {
    for (Lead lead : Trigger.new) {
        // Only check for conversion on update
        if (Trigger.isUpdate && lead.IsConverted) {
            // Check for required fields
            if (lead.Email == null || lead.Phone == null || lead.FirstName == null || lead.LastName == null) {
                lead.addError('Lead must have a valid Email, Phone, First Name, and Last Name before conversion.');
            }
        }
    }
}
