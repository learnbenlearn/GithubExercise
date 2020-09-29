///////////////////////////////////////////////////////////////// //
// Name: Project 0 Bravo
// Author: Taylor Cox(taylor.cox@revature.net)
// Date: 09/17/2020
// Description: Series of apex methods to demonstrate
// basic understanding of coding concepts.
// /////////////////////////////////////////////////////////////////
public class P0B {
	
    /*
    * 1. Return the nth Fibonacci number
    * Test Cases:
     * Input: 0
    * Input: 1
    * Input: 2
    * Input: 10
    * Output: 0
    * Output: 1
    * Output: 1
    *  Output: 55
    */
    public static Integer nFibonacci( Integer n ){
    	Integer firstInt = 0;	//first Integer that will be returned
        Integer secondInt = 1;	//Integer to be added to the first number
        						//in order to generate the fibonacci numbers
        Integer sumOfBoth = 0;	//Integer to hold the sum of the two numbers
     	
        //loops through the fibonacci sequence n number of times
        for(Integer i = 0; i < n; i++){
            
            sumOfBoth = firstInt + secondInt;	//adds secondInt to firstInt
            
            firstInt = secondInt;	//updates the value of firstInt
            secondInt = sumOfBoth;	//Updates the value of second Int
            
        }
        
        return firstInt;	//Returns the generated fibonacci number
    }
    
    /*
    * 2. Sort a list of integers.
    * Test Cases:
    * Input: [2,4,5,1,3,1] Output: [1,1,2,3,4,5]
    * Input: [5,4,3,2,1] Output: [1,2,3,4,5] *
    * Don't use the sort() method... that would be lame.
    */
    public static List<Integer> sortList( List<Integer> intList ) {
        
        List<Integer> sortedList = intList;	//Sorted list to return
        
        Integer listSize = intList.size();	//Integer that stores the size of the List parameter
        Integer tempInt;		//Temporary Integer variable
        Integer tempInt2;		//Temporary Integer variable
        
        //Outer loop that iterates through the inputted list
        for(Integer i = 0; i < listSize; i++){
            
            //Inner loop that iterates through the inputted list
            for(Integer x = i + 1; x < listSize; x++){
                
                //checks to see if the Integer at the next position is greater or not
            	if(sortedList.get(i) > sortedList.get(x)){
                
                    tempInt = intList.get(i);	//saves the Integer at position i temporarily
                    tempInt2 = intList.get(x);	//saves the Integer at the next position temporarily
                    sortedList.set(i, tempInt2);	//Sets the first position of the Integer List to the first
                                                    //Temporary Integer's value
                    sortedList.set(x, tempInt);	//sets the next position of the sorted List to the second
                                                        //temporary Integer's value
                
            	}
                
            }
     		
        }
            
        return sortedList;	//returns the sorted list
        
    }    
	
    /*
    * 3. Return the factorial of n.
    * Test Cases:
    * Input: 0
    * Input: 1
    * Input: 3
    * Output: 1
    * Output: 1
    * Output: 6
    */
    public static Integer nFactorial( Integer n) {
        
        Integer factorialOut = n;	//The variable that will be returned based on the passed Integer
        
        //checks to see whether or not n is equal to 0
        if(n == 0){
            factorialOut = 1;
        }
        else{
            //Loops through the different values of n as it changes over the calculations
            for(Integer i = (n-1); i > 0; i--){
                
                factorialOut *= i;	//multiplies the value of factorialOut by the temporary Integer
                
            }
        }
        
        return factorialOut;	//returns the factorial of the passed Integer
        
    }
    
    /*
     * 4. Rotate left
     * Given a list, list, and an integer, n, rotate the values in list left n times and return list
     * Test Cases:
     * Input: [1,2,3,4,5], 1 Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 6 Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 3 Output: [4,5,1,2,3]
     */
     public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n) {
         
         List<Integer> rotatedList = nList;	//List that will be returned
         
         Integer tempInt;	//temporary integer to hold a number stored from the List
         Integer tempInt2;	//temporary integer for storing a number from the list
         Integer listSize = nList.size();	//an integer to hold the size of the List
         
         //outer loop that iterates through the list based on the passed integer
         for(Integer x = 0; x < n; x++){
             
             tempInt = rotatedList.get(0);	//sets the temporary integer to the first
             								//item in the list             
             
             //inner loop that iterates through the passed List based on List size
             for(Integer i = 1; i < listSize; i++){
                 
                 tempint2 = rotatedList.get(i);	//temporarily stores the I'th place in the list 
                 rotatedList.set((i - 1), tempInt2);	//sets the (i - 1)'th place in the list 
                 										//to the second temporarily stored integer
                 
             }
             
             rotatedList.set((listsize - 1), tempInt);	//sets the last item's value in the
             											//list to the temporary integer
             
         }
         
         return rotatedList;	//returns rotatedList
         
     }
    
    /*
     * 5. Balanced Brackets
     * A bracket is any one of the following: (, ), {, }, [, or ]
     *
     * The following are balanced brackets:
     * ( )
     * ( ) ( )
     * ( ( ) )
     * ( { [ ] } )
     *
     * The following are NOT balanced brackets:
     * (
     * )
     * ( ( )
     * ( [ ) ]
     *
     * Return true if balanced
     * Return false if not balanced
     */
     public static Boolean bracketsAreBalanced( String s ) {
         
         boolean isBalanced;	//boolean to return
         boolean customImbalance = false;	//a boolean to detect the type of situation in negative test case 4
         String tempString;		//String for temporarily storing the String values found referenced
         						//in the loop
         Integer parenOpeningCounter = 0;	//counts the number of opening parenthesis
         Integer parenClosingCounter = 0;	//counts the number of closing parenthesis
         Integer squareOpeningCounter = 0;	//counts the number of opening square brackets
         Integer squareClosingCounter = 0;	//counts the number of closing square brackets
         Integer braceOpeningCounter = 0;	//counts the number of opening braces
         Integer braceClosingCounter = 0;	//counts the number of closing braces
         
         List<String> charList = new List<String>(); //a list of Strings for storing the string characters in order
         
         //loops through the passed String and seperates the characters into individual strings
         //I did this in order to make it easier to compare individual characters without 
         //having to compromise the correct order.
         for(Integer i = 0; i < s.length(); i++){
             
             charList.add(s.substring(i, (i + 1)));	//pulls each string character out of the passed string
             										//then stores them in charList
             
         }
         
         if(s.length() == 1){	//checks to see whether or not the inputted String is only 1 character long
             					//if it is only one character then brackets cannot be balanced
             					
             isBalanced = false;	//sets isBalanced to false
             
         }
         else if(charList.get(0) == ')' ||		//checks to see whether or not the string starts with a 
                 charList.get(0) == '}' ||		//closing bracket
                charList.get(0) == ']'){
             
             isBalanced = false;
             
         }
         else{
             
             for(Integer j = 0; j < charList.size(); j++){	//loops through charList
                 
                 String str = charList.get(j);
                 
                 switch on str{
                     when '('{
                         parenOpeningCounter += 1;
                         
                         //detects incorrect closing brackets
                         if(charList.get((j + 1)) == '}' ||
                            charList.get((j + 1)) == ']'){
                                customImbalance = true;
                            }
                     }
                     when ')'{
                         parenClosingCounter += 1;
                     }
                     when '{'{
                         braceOpeningCounter += 1;
                         
                         //detects incorrect closing brackets
                         if(charList.get((j + 1)) == ')' ||
                            charList.get((j + 1)) == ']'){
                                customImbalance = true;
                            }
                     }
                     when '}'{
                         braceClosingCounter += 1;
                     }
                     when '['{
                         squareOpeningCounter += 1;
                         
                         //detects incorrect closing brackets
                         if(charList.get((j + 1)) == ')' ||
                            charList.get((j + 1)) == '}'){
                                customImbalance = true;
                            }
                     }
                     when ']'{
                         squareClosingCounter += 1;
                     }
                 }  
             }
             
             //checks the number of opening and closing brackets
             if(parenOpeningCounter == parenClosingCounter &&
               braceOpeningCounter == braceClosingCounter && 
               squareOpeningCounter == squareClosingCounter){
                 
                 isBalanced = true;
                 
             }
             else {
                 isBalanced = false;
             }
             
             if(customImbalance == true){
                 isBalanced = false;
             }
             
         }
         
         return isBalanced;		//returns the boolean stating whether or
         						//not the brackets are balanced
         
     }
    
    /*
     * 6. Create a method that retrieves a list of all accounts and updates those accounts.
     * Create a custom field on the Account standard object called Size__c that will be a
     * picklist containing small/medium/large.
     * Create a method that retrieves a list of all accounts.
     * - If an account has between 1-1000 employees then it is classified as small.
     * - If an account has between 1001-10000 employees it is classified as medium.
     * - If an account has more than 10000 employees it is classified as large.
     * Update the Size__c field on each account to reflect the amount of employees in the Account.
     */
     public static void updateAccountSize( ) {
         
         //String queryString = SELECT NumberOfEmployees, size__c FROM Account;	//Query string for retrieving all accounts 
         
         List<Account> Accounts = [SELECT NumberOfEmployees, size__c FROM Account LIMIT 100]; //sends the query string
         																					//to the database and 
         														//saves the results to the Accounts list
         														
         List<Account> AccountsToUpdate = new List<Account>(); //list of account objects to update
         
         Object numEmployees;	//an object to hold the numberOfEmployees field
         Integer numberEmployees;	//Integer to hold the number of employees, based on value of numEmployees
         
         for(Account account : Accounts){
             
             numEmployees = account.get('NumberOfEmployees');	//gets the object value of numEmployees from the account objects
             numberEmployees = Integer.ValueOf(numEmployees);	//determines the value of number of Employees based on numEmployees
             
             //this is where the value of 'size__c' is determined
             if(numberEmployees >=1 && numberEmployees <= 1000){	//checks whether the account size is small (from 1 to 1000)
                 account.put('size__c', 'small');
             }
             else if(numberEmployees >=1001 && numberEmployees <= 10000){	//checks whether the account size is medium (from 1001 to 10000)
                 account.put('size__c', 'medium');
             }
             else if(numberEmployees > 10000){	//checks whether the account size is large (10000 or higher)
                 account.put('size__c', 'large');
             }
			
             
             AccountsToUpdate.add(account);	//adds updated account objects to the list of account objects used
             								//to update the database
			
         }
         
         update AccountsToUpdate;	//updates the database with a list of updated account objects
         
     } 
    
    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields.
     * If a lead is located in California(CA), change their Lead Status field to 'Closed - Not
     * Converted' and their description should display the message, "We are no longer doing
     * business in California."
     */
     public static void updateCALeads( ) {
         
         List<Lead> Leads = [SELECT Address, Status, Description
                             FROM Lead
                            LIMIT 100];							//List of Leads located in California
         
         List<Lead> LeadsToUpdate = new List<Lead>();	//List of leads to update
         
         Address LeadAddress;	//object to hold the Address
         Object AddressState;	//object to hold the Address State
         String addrState;	//String to hold the String value of AddressState
         
         //Loops through each Lead Retrieved from the Database
         for(Lead lead : Leads){
             
             LeadAddress = lead.Address;			//sets LeadAddress Value
             AddressState = LeadAddress.getState();	//sets the value of AddressState
             addrState = String.valueOf(AddressState);	//sets the String Value of the Addresses State
             
             //checks to see if the addrState variable is null
             //--This was to address an issue where one entry was null and couldn't be converted
             if(addrState != null){
             	//checks to see whether or not the Lead's state is California
                 if(addrState.equals('CA') == true){
                     
                     Lead.put('Status', 'Closed - Not Converted');	//sets Lead Status to 'Closed - Not Converted'
                     Lead.put('Description', 'We are no longer doing business in California.'); //adds the disclamer that
                                                                                        //the organization is not doing business
                                                                                        // in California, into their description
                     
                 }
             }
             
             LeadsToUpdate.add(lead);	//adds each updates lead to the LeadsToUpdate List
             
         }
         
         update LeadsToUpdate;	//Updates the Database using the LeadsToUpdate List
         
     }
    
    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
     public static void closePastDueOpportunities( ) {
         
         //Gets every Opportunity that has passed its closed date and whose status is not 'Closed Won'
         List<Opportunity> OpportunitiesList = [SELECT CloseDate, StageName 
                                               FROM Opportunity
                                               WHERE CloseDate <=: Date.today()
                                               AND StageName != 'Closed Won'
                                               LIMIT 100];
         
         List<Opportunity> OpportunitiesToUpdate = new List<Opportunity>(); //List of opportunities to update 
         
         //loops through each individual opportunity 
         for(Opportunity opp : OpportunitiesList){
             
             opp.put('StageName', 'Closed Lost'); //sets each individual opportunity's stageName to 'Closed Lost'
             
             OpportunitiesToUpdate.add(opp);
             
         }
         
         update OpportunitiesToUpdate;
         
     }
    
}