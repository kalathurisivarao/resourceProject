public with sharing class DemoInsertionClass {
    @AuraEnabled(cacheable=false)
    public static Resource__c insertResourceRecord(Resource__c resourceData){
        try {
            system.debug('resourceData '+resourceData);
            insert resourceData;
        } catch (Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    return resourceData;
    }

    @AuraEnabled
    public static List<Resource_Detail__c> insertResourceDetailRecord(List<Resource_Detail__c> rdDataList, Id resDetId){
        try {
            system.debug(rdDataList);
            system.debug(resDetId);
            for (Resource_Detail__c rdData : rdDataList){
                rdData.Resource__c = resDetId;
            }

            insert rdDataList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    return rdDataList;
    }
}