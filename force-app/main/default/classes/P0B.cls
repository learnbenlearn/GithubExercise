public class P0B {
////////////////////////////////////////////////////////////
//
//Name: Project 0 Bravo
//Author: Wesley Williams, V "Quinn" (qwilliamsv@gmail.com)
//Date: 09/17/2020
//Description: Series of apex methods to demonstrate basic
//understanding of coding concepts.
//
////////////////////////////////////////////////////////////
    public static Integer nFibonacci(Integer n){
        ///////////
        //if n is 0, 1, or 2 the corresponding Fibonacci number is returned without any logic.
        //Otherwise, it runs through a for loop to calculate the proper Fibonacci number.
        //////////
        if(n<0){
            throw new nFibonacciException('Do not input negative numbers');
        }
        integer fib;
        if(n==0){
            fib = 0;
        }
        else if(n==1 || n==2){
            fib = 1;
        }
        else{
            integer hold1 = 2; //hold1 holds the last fibonacci number in the sequence, starting at 3's corresponding number of 2
            integer hold2 = 1; //hold2 holds the second to last fibonacci number, in this case corresponding to 2, which is 1.
            for(Integer i=3 ; i<n ; i++){
                fib = hold1+hold2;
                hold2 = hold1;
                hold1 = fib;
                //Debug and testing//system.debug(i + ' | ' +fib);
            }
        }
        return fib;
    }
    public static List<Integer> sortList(List<Integer> intList){
        ////////////
        //Input the list of integers to be sorted
        //runs through the size of the list moving the minimum value from the intList to the finalList
        ////////////
        List<Integer> finalList = new List<Integer>(); //Start building the final List
        Integer minimum; //minimum and indexed are used to keep track of placement in the loops
        Integer indexed; 
        Integer numOfSteps = intList.size(); //for use in the for loop
        Integer size = numOfSteps; //for the while loop
        while(size>0){
            minimum = intList[0];//starts off setting the minimum to the first value
            indexed = 0;//index of current minimum
        	for(Integer i=0 ; i<numOfSteps ; i++){
            	if(minimum > intList[i]){
                	minimum = intList[i];
                	indexed = i;
            	}
        	} 
        	intList.remove(indexed);
        	finalList.add(minimum);
            size--; //while loop shrinks by 1 each time, as each time one number is moved from the intList to the finalList.
            numOfSteps--; //number of steps decreases by 1 each time the while loop runs
        }
        return finalList;
    }
    public static Integer nFactorial(Integer n){
        /////////////
        //Calculates n-factorial
        ////////////
        Integer finalInt = 1;//finalInt starts at 1 so that a zero input would return 1.
        for(Integer i=1 ; i <= n ; i++){ //if n==0 for loop is skipped
            finalInt=finalInt*i; //factorial operation
        }
        return finalInt;
    }
    public static List<Integer> rotateLeftNTimes(List<Integer> nList, Integer n){
        //////////
        //Shifts integer list left n times
        /////////
        List<Integer> finalList = nList;
        while(n>0){ //outer loop ensures we go through n times
            Integer firstVal = finalList[0];//notes the value of the starting integer in the list
            for(Integer i=0 ; i<nList.size() ; i++){//inner loop handles individual instances of rotation, so rotates whole list left once
                if(i<(nList.size()-1)){//makes sure we are not near the last value of the list
                    finalList[i]=finalList[i+1];//takes value from the next index
                }
                else{
                    finalList[i]=firstVal;//sets value for final value in loop
                }
            }
            n--;//progression for the outmost loop
        }
        return finalList;
    }
    public static Boolean bracketsAreBalanced(String s){
        //////////
        //Takes input of a string and will check to see if the brackets are balanced.
        //Can also check if characters are mirrored (everything other than brackets)
        //Spaces are included and checked
        //Compares based on the character codes
        //Returns true for balanced, false for unbalanced
        //////////
        Integer length = s.length();
        Boolean status = True; //default status of if the brackets are balanced, looks to disprove
        Double lookForOdd = length/2.0; //checks the length to see if there will be a middle value to check
        Boolean isOdd = False;
        if(lookForOdd-(length/2) != 0){
            isOdd=True;
        }
        if(isOdd){
            Integer middleVal = s.charAt((length/2));
            if(middleVal != 32){
                if(middleVal==40 || middleVal==41 || middleVal==123 || middleVal==125 || middleVal==93 || middleVal==91){ //Checks for a bracket as the middle character
                    status = False;
                }
            }
        }
        for(Integer i=0 ; i<length/2 ; i++){//Starts checking both sides of the string and working to the middle, which was checked above
            Integer check1 = s.charAt(i);
            Integer check2 = s.charAt(length-1-i);
            if(check1==40 || check1==91 || check1==123){//checks if bracket is already facing same way at both sides, which would make the brackets unbalanced and return false
                if(check1 == check2){
                    status = False;
                }
            }
            if(check2 == 41){ //changes left facing bracket so that it is equal to right facing based on character codes
                check2 = 40;
            }
            else if(check2 == 125){//changes left facing bracket so that it is equal to right facing based on character codes
                check2 = 123;
            }
            else if(check2 == 93){//changes left facing bracket so that it is equal to right facing based on character codes
                check2 = 91;
            }
            if(check1!=check2){//checks to see if character codes are equivalent 
                status = False;
            }
        }
        return status;
    }
    public static void updateAccountSize(){
        //////////
        //Updates account sizes with values corresponding to the number of employees.
        //A company must have at least 1 employee for this to do anything to them.
        //////////
        List<Account> accountList = [SELECT Name, NumberOfEmployees FROM Account];
        for(Account acc : accountList){
            Integer numOfPeople = acc.NumberOfEmployees;
            if(numOfPeople >= 1 && numOfPeople <= 1000){
                   acc.Size__c = 'Small'; 
            }
            else if(numOfPeople >= 1001 && numOfPeople <= 10000){
                acc.Size__c = 'Medium'; 
            }
            else if(numOfPeople > 10000){
                acc.Size__c = 'Large'; 
            }
        }
        update accountList;
    }
    public static void updateCALeads(){
        //////////
        //This updates any leads out of California to close and changes their description to explain the closure
        //////////
        List<Lead> leadCAList = [SELECT Name, State FROM Lead WHERE State='CA'];
        for(Lead leadCA : leadCAList){
            leadCA.Status = 'Closed - Not Converted';
            leadCA.Description = 'We are no longer doing business in California';
        }
        update leadCAList;
    }
    public static void closePastDueOpportunities(){
        //////////
        //This updates Opportunities and closes past due ones. 
        //////////
        List<Opportunity> oldOppList = [SELECT Name, CloseDate, StageName FROM Opportunity WHERE CloseDate < TODAY AND StageName != 'Closed Won']; 
        for(Opportunity opp : oldOppList){
            opp.StageName = 'Closed Lost';
        }
        update oldOppList;
    }
}