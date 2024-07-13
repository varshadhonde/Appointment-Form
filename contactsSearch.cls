public with sharing class contactsSearch {
    public contactsSearch() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(string searchTerm){
       List<Contact> conList=new List<Contact>(); 
   
           if(searchTerm!=''){
            string str='%'+ searchTerm + '%';
            conList= Database.query('SELECT Id, Name FROM Contact WHERE Name LIKE: str LIMIT 5');

           }
           else{
             conList= Database.query('SELECT Id, Name FROM Contact LIMIT 5');
           }
       return conList;
    }
}