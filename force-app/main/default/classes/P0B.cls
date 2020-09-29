/////////////////////////////////////////////////////////////////
 //
 // Name: Project 0 Bravo
 // Author: Celena Lipscomb (celena.lipscomb@revature.net)
 // Date: 09/17/2020
 // Description: Series of apex methods to demonstrate
 // basic understanding of coding concepts.
 //
 /////////////////////////////////////////////////////////////////

public class P0B
{
    /*
 	* 1. Return the nth Fibonacci number
 	* Test Cases:
 	* Input: 0 Output: 0
 	* Input: 1 Output: 1
 	* Input: 2 Output: 1
 	* Input: 10 Output: 55
 	*/
 	public static Integer nFibonacci(Integer n)
    {
        //need to keep track of the two preceding numbers as well as the current number
        Integer fa = 0, fb = 1, f = 0;
        
        if (n < 0)
        {
            //negative numbers not allowed!
            system.debug('negative numbers are bad mmk');
            return -1;
        }
        else if(n == 0)
        {
            //base case: when n=0, f=0
            system.debug('Input: ' + n + ' Output: ' + fa);
            return fa;
        }
        else if (n == 1)
        {
            //base case: when n=1, f=1
            system.debug('Input: ' + n + ' Output: ' + fb);
            return fb;
        }
        else
        {
            //each number is the sum of the two preceding numbers, starting at 2
            for (Integer i = 2; i <= n; i++)
            {
                f = fa + fb;
                fa = fb;
                fb = f;
            }
        }
        system.debug('Input: ' + n + ' Output: ' + f);
        return f;
 	}
    
 	/*
 	* 2. Sort a list of integers.
 	* Test Cases:
 	* Input: [2,4,5,1,3,1] Output: [1,1,2,3,4,5]
 	* Input: [5,4,3,2,1] Output: [1,2,3,4,5]
 	*
 	* Don't use the sort() method... that would be lame.
 	*/
 	public static List<Integer> sortList( List<Integer> intList )
    {
        Integer temp = intList[0], minIndex = 0;
        system.debug('temp equals ' + temp);
        List<Integer> sorted = new List<Integer>();
        Integer j = 0;
        do
        {
        	//find the smallest value in intList using temp to compare
        	for(Integer i = 0; i<intList.size(); i++)
        	{
                if (intList[i] < temp)
        	    {
                    //save the index of the smallest value
        	        temp = intList[i];
        	        minIndex = i;
        	    }
        	}
            //add the smallest value to sorted and remove it from intList
        	sorted.add(intList[minIndex]);
        	intList.remove(minIndex);
            
            //reset the variables to the starting variables
            temp = intList[0];
            minIndex = 0;
        	
        } while (intList.size() > 1);	//continue until there is only 1 value left in intList
        
        //add the last value to the sorted list
         sorted.add(intList[0]);
        
        //return sorted list
        system.debug('Sorted list: ' + sorted);
        return sorted;
 	}
    
 	/*
 	* 3. Return the factorial of n.
 	* Test Cases:
 	* Input: 0 Output: 1
 	* Input: 1 Output: 1
 	* Input: 3 Output: 6
 	*/
 	public static Integer nFactorial( Integer n)
    {
        //base case
        if (n == 0)
        {
            return 1;
        }
        
        //recursively call factorial function. n! = n*(n-1)! = n*(n-1)*(n-2)!=....
        return (n * nFactorial(n-1));
 	}
    
 	/*
 	* 4. Rotate left
 	* Given a list, list, and an integer, n, rotate the values in list left n times and return list
 	* Test Cases:
 	* Input: [1,2,3,4,5], 1 Output: [2,3,4,5,1]
 	* Input: [1,2,3,4,5], 6 Output: [2,3,4,5,1]
 	* Input: [1,2,3,4,5], 3 Output: [4,5,1,2,3]
 	*/
 	public static List<Integer> rotateLeftNTimes(List<Integer> nList, Integer n)
    {
        Integer temp = 0;
        
        //the smallest number of rotations needed is (n % nList.size())
        Integer r = Math.mod(n, nList.size());
        
        //repeat r times
        for (Integer i = 0; i < r; i++)
        {
            //to rotate 1 time: store the first value, then copy each value to the left from 0 to (size - 1), then copy first value over last value
            temp = nList[0];
            for (Integer j = 0; j < (nList.size() - 1); j++)
            {
                nList[j] = nList[j+1];
            }
            nList[nList.size() - 1] = temp;
        }
                
        //return list, rotated
        system.debug('Rotated list: ' + nList);
        return nList;
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
 	public static Boolean bracketsAreBalanced( String s )
    {
        //list of brackets
        List<String> bracketsOnly = new List<String>();
        for (Integer i = 0; i < s.length(); i++)
        {
            //if the character is a beginning bracket, add it to the list of brackets
            if ('({['.contains(s.substring(i, i + 1)))
            {
            	bracketsOnly.add(s.substring(i, i + 1));
            }
            //if the character is ']', need to check if the last bracket was '['
            else if (']'.contains(s.substring(i, i + 1)))
            {
                if(bracketsOnly[bracketsOnly.size()-1] == '[')
                {
                    //if the last character was '[' then remove it and move on
                    bracketsOnly.remove(bracketsOnly.size()-1);
                }
                else
                {
                    //if the last character was not '[' then return false
                    //system.debug('dangerously unbalanced! []');
            		return false;
                }
            }
            //if the character is '}', need to check if the last bracket was '{'
            else if ('}'.contains(s.substring(i, i + 1)))
            {
                if(bracketsOnly[bracketsOnly.size()-1] == '{')
                {
                    //if the last character was '[' then remove it and move on
                    bracketsOnly.remove(bracketsOnly.size()-1);
                }
                else
                {
                    //if the last character was not '[' then return false
                    //system.debug('dangerously unbalanced! {}');
            		return false;
                }
            }
            //if the character is ')', need to check if the last bracket was '('
            else if (')'.contains(s.substring(i, i + 1)))
            {
                if(bracketsOnly[bracketsOnly.size()-1] == '(')
                {
                    //if the last character was '(' then remove it and move on
                    bracketsOnly.remove(bracketsOnly.size()-1);
                }
                else
                {
                    //if the last character was not '(' then return false
                    //system.debug('dangerously unbalanced! ()');
            		return false;
                }
            }
        }
        
        //check if list is empty
        if (bracketsOnly.size() == 0)
        {
            //if it is, we good
            //system.debug('balance has been achieved!!');
        	return true;
        }
        else
        {
            //there are brackets left open!
            //system.debug('dangerously unbalanced! missing close for an open ' + bracketsOnly[0]);
            return false;
        }
        
        
        
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
 	public static void updateAccountSize( )
    {
        //select the relevant fields from the Account object
        List<Account> sizeUpdate = [SELECT NumberOfEmployees, Size__c FROM Account];
        
        //iterate through the list of returned Account objects
        for (Account a : sizeUpdate)
        {
            //check the number of employees to determine that value of the size__c field
            if ((a.NumberOfEmployees > 1) && (a.NumberOfEmployees < 1000))
            {
                a.Size__c = 'small';               
            }
            else if (a.NumberOfEmployees < 10000)
            {
                a.Size__c = 'medium';
            }
            else if (a.NumberOfEmployees > 10000)
            {                
                a.size__c = 'large';
            }
        }
        
        //update fields of accounts
        update sizeUpdate;
        
 	}
 
    /* 
 	* 7. Create a method that will find all leads that contain 'ca' in their fields.
 	* If a lead is located in California(CA), change their Lead Status field to 'Closed - Not
 	* Converted' and their description should display the message, "We are no longer doing
 	* business in California."
 	*/
 	public static void updateCALeads( )
    {
        //select the relevant fields from the Lead object: Address. Only the records in the state of CA
        List<Lead> CAUpdate = [SELECT Address, Status, Description FROM Lead WHERE State = 'CA'];
        
        //iterate through the list of returned Lead objects
        for (Lead l : CAUpdate)
        {
            //if the lead is located in CA, update the Status and Description fields
            l.Status = 'Closed - Not Converted';
            l.Description = 'We are no longer doing business in California.';
        }
        
        //update fields of Leads
        update CAUpdate;
 	}
    
 	/*
 	* 8. Create a method that will find all Opportunities which have already passed their Close Date
 	* and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and
 	* they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
 	*/
 	public static void closePastDueOpportunities( )
    {
        //select the relevant fields from the Opportunity object: Close Date, Stage
        List<Opportunity> pastDue = [SELECT CloseDate, StageName, Name FROM Opportunity WHERE CloseDate < TODAY AND StageName != 'Closed Won'];
        
        //iterate through the returned Opportunity objects
        for (Opportunity o : pastDue)
        {
            //check if Close Date is before today and if Stage is not marked 'Closed Won/Lost'. if so, change stage to 'Closed Lost'
            //if((o.CloseDate < Date.today()) && ((o.StageName != 'Closed Won') && (o.StageName != 'Closed Lost')))
            //{
                o.StageName = 'Closed Lost';
            //}
        }
        
        //update fields of Opportunities
        update pastDue;
        
 	}
	
}