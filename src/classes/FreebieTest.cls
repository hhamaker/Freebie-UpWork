@isTest
private class FreebieTest {
	static testMethod void testLeadCreation() {
		//test the insertion
		Lead testLead = new Lead(LastName = 'testLead', Company = 'testCompany');
		INSERT(testLead);

		testLead = [SELECT Id, Tracking_Id__c FROM Lead WHERE Id =: testLead.Id];
		System.assertNotEquals('', testLead.Tracking_Id__c);

		//test the update
		String oldValue = testLead.Tracking_Id__c;
		testLead.Tracking_Id__c = '';
		UPDATE(testLead);

		testLead = [SELECT Id, Tracking_Id__c FROM Lead WHERE Id =: testLead.Id];
		System.assertNotEquals('', testLead.Tracking_Id__c);
		//making sure the value changed
		System.assertNotEquals(oldValue, testLead.Tracking_Id__c);
	}
}