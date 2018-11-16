/*
    Test Class:
        FreebieTest.cls
*/
trigger iCapNewLead on Lead (before insert, before update) {
    for (Lead lead : Trigger.new) {
        if (lead.Tracking_ID__c == null) {
            lead.Tracking_ID__c = Freebie.generateRandomString(8);
        }
    }
}