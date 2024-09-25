trigger OpportunityStageUpdateTrigger on Opportunity (before insert, before update) {
    for (Opportunity opp : Trigger.new) {
        // Check if the CloseDate and Amount fields are populated and meet the criteria
        if (opp.CloseDate != null && opp.Amount > 10000 && opp.CloseDate <= System.today().addDays(30)) {
            opp.StageName = 'Closing';
        }
    }
}
