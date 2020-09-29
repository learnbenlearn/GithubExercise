public class P0B {
    
    ////////////////////////////////////////
    //
    //Name: Project 0 Bravo
    //Author: Matthew Coger (matthew.coger@revature.net)
    //Date: 9/17/2020
    //Description: Series of apex methods to demonstrate basic understanding
    //of coding concepts
    //
    ////////////////////////////////////////
    
    //returns the nth Fibonacci number
    public static Integer nFibonacci(Integer n){
        Integer prevNumber = 1;
        Integer currentNumber = 1;
        Integer nextNumber;
        if(n == 0){
                return 0;
        }else if(n == 1){
            return prevNumber;
        }else if(n == 2){
            return currentNumber;
        }else{
        	for(Integer i = 3; i <= n; i++){
           		nextNumber = prevNumber + currentNumber;
           		prevNumber = currentNumber;
           		currentNumber = nextNumber;
        	} 
        }   
        return currentNumber;
    }
    public static void trying(){
    	//Integer test = nFibonacci(3);
    	//system.debug(test);
    	
        //List<Integer> ints = new List<Integer>{2,4,5,1,3,1};
        //P0B.sortList(ints);
        //system.debug(ints);
    	
    }
    
    //Returns a sorted list
    public static List<Integer> sortList(List<Integer> intList){
        Integer check;
        for(Integer i = 0; i < intList.size(); i++){
            for(Integer j = i + 1; j < intList.size(); j++){
                if(intList[i] > intList[j]){
                    check = intList[i];
                    intList[i] = intList[j];
                    intList[j] = check;
                }
            }
        }
        system.debug(intList);
        return intList;
    }
    
    //Returns the factorial of n
    public static Integer nFactorial(Integer n) {
        Integer answer = 1;
        if(n == 0){
            system.debug(n);
            return 1;
        }
        for(Integer i = 2; i <= n; i++) {
            answer = answer * i;
        }
        system.debug(answer);
        return answer;
    }
    
    //Rotates a list to the left n times
    public static List<Integer> rotateLeftNTimes(List<Integer> nList, Integer n) {
        Integer temp;
        Integer j;
        for(Integer i = 0; i < n; i++){
            temp = nList[0];
            for(j = 0; j < nList.size()-1; j++){
                nList[j] = nList[j+1];
            }
            nList[j] = temp;
        }
        system.debug(nList);
        return nList;
    }
    
    //Checks balance of brackets
    public static Boolean bracketsAreBalanced( String s ) {
        if(math.mod(s.length(), 2) != 0){
            system.debug('is false');
            return false;
        }
        String holder;
        for(Integer i = 0; i < s.length(); i++){
            holder = holder + s.substring(i, i+1);
            system.debug(holder);
            if(s.substring(i, i+1) == ')'){
                if(holder.endsWith('()') == true){
                    holder = holder.removeEnd('()');
                }else{
                    system.debug('is false');
                    return false;
                }
            }
            if(s.substring(i, i+1) == ']'){
                if(holder.endsWith('[]') == true){
                    holder = holder.removeEnd('[]');
                }else{
                    system.debug('is false');
                    return false;
                }
            }
            if(s.substring(i, i+1) == '}'){
                if(holder.endsWith('{}') == true){
                    holder = holder.removeEnd('{}');
                }else{
                    system.debug('is false');
                    return false;
                }
            }
        }
        system.debug('is true');
        return true;
	}
    
    //Retrieves a list of all accounts and updates those accounts
    public static void updateAccountSize() {
        List<Account> accts = [SELECT Name, NumberOfEmployees FROM Account];
        for(Integer i = 0; i < accts.size(); i++){
            if(accts[i].NumberOfEmployees <= 100){
                accts[i].Size__c = 'small';
            }else if(accts[i].NumberOfEmployees >= 1001 && accts[i].NumberOfEmployees <= 10000){
                accts[i].Size__c = 'medium';
            }else{
                accts[i].Size__c = 'large';
            }
        }
        Update accts;
	}
    
    //Finds and manipulates California Leads
    public static void updateCALeads( ) {
        List<Lead> caLead = [SELECT Name, Description FROM Lead Where State = 'CA'];
        for(Integer i = 0; i<caLead.Size(); i++){
            	caLead[i].Description = 'We are no longer doing business in California';
            	caLead[i].Status = 'Closed - Not Converted';
        }
        Update caLead;
	}
    
    //Finds and fixes Opps that are passed their Close date
    public static void closePastDueOpportunities( ) {
        List<Opportunity> missedOpps = [SELECT Name FROM Opportunity WHERE StageName != 'Closed Won' AND CloseDate < TODAY];
        for(Integer i = 0; i < missedOpps.Size(); i++){
            missedOpps[i].StageName = 'Closed Lost';
        }
        Update missedOpps;
	}

    
    
    
    
    
    
    
    
}