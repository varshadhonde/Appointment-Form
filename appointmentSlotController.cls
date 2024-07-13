public with sharing class appointmentSlotController {
    @AuraEnabled
    public static List<Appointment_slot__c> getAppointmentSlots(DateTime dt){
        if(dt!=null){
            Date dt1=dt.date();
            Time tm1=dt.timeGmt();
            system.debug('Time from apex method::: '+tm1);
            return [SELECT Id, Name, Appointment_Date__c, Start_Time__c, End_Time__c, isActive__c from Appointment_slot__c 
            WHERE isActive__c=true AND Appointment_Date__c=:dt1 AND Start_Time__c<=:tm1 AND End_Time__c>:tm1];
        }
        return null;
    }
}