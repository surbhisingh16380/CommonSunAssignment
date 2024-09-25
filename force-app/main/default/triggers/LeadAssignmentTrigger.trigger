trigger LeadAssignmentTrigger on Lead (before insert) {
    // Create a Map to store Sales Representatives based on their City
    Map<String, List<User>> salesRepMap = new Map<String, List<User>>();

    // Query active sales representatives based on predefined criteria (e.g., City and Department)
    for (User user : [SELECT Id, Name, City, Department FROM User WHERE IsActive = TRUE AND Department = 'Sales']) {
        if (user.City != null) {
            if (!salesRepMap.containsKey(user.City)) {
                salesRepMap.put(user.City, new List<User>());
            }
            salesRepMap.get(user.City).add(user);
        }
    }

    // Assign leads to sales representatives based on the Lead's City
    for (Lead lead : Trigger.new) {
        if (lead.City != null && salesRepMap.containsKey(lead.City)) {
            List<User> salesReps = salesRepMap.get(lead.City);
            if (!salesReps.isEmpty()) {
                // For even distribution (round-robin logic)
                Integer index = Math.mod(Trigger.new.indexOf(lead), salesReps.size());
                lead.OwnerId = salesReps[index].Id;
            }
        }
    }
}
