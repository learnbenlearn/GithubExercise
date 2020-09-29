@isTest(SeeAllData=false)
public class CalcTest {
    
    //
    //What makes Good tests
    //We need 75% test coverage
    //Testing Best practices
    //Positive and negative testing
    //	You shouldn't only test for what you want to happen, because you need to make sure your code has no unexpected
    //	side effects going on
    //	Positive testing is testing for the correct response
    //	Negative testing is testing for incorrect responses and incorrect behavior
    //	Make sure you are handling errors and recovering gracefully
    //
    //Single and Bulk ACtions
    //	Test to make sure we can work on both single records and a list/bulk of records
    //	You need to make sure if something happens once it has the same response if it happens 200 times
    //	or is there  a point to which you shouldn't be operating
    //	
    //Restricted Users Testing
    //	Are we sharing, or not sharing, access as appropriate. We need to make sure our security is enforced inside
    //	of our org
    	
    @TestSetup
    public static void makeTestData(){
        //logic to create data here
    }
    
    @isTest
    public static void addTest(){
        Test.startTest();
        Integer one = Calc.add(2,2);
        Test.stopTest();
        Integer two = Calc.add(2,3);
        Integer three = Calc.add(2,4);
        
        
        //Ok so how do we actually analyze the results
        //We will use some system asserts, assert equals and assert not equals
        //System.assert(condition), it evaluates the condition, given if true the test passes, if false the test fails
        System.assert(one == 4);
        System.assert(two != 6);
        System.assert(three != 16);
    }
    
    @isTest
    public static void subTest(){
        Integer one = Calc.sub(2,2);
        Integer two = Calc.sub(2,3);
        Integer three = Calc.sub(2,4);
        Integer four = Calc.add(2,2);
        //AssertEquals - it takes in two values (expected, actual) if they are the same, the test passes, if not it fails
        System.assertEquals(0, one);
        System.assertEquals(-1, two);
        //System.assertNotEquals - takes in two paramaters (not expected, actual) if they are not the same the test passes
        //if they are the same the test fails
        System.assertNotEquals(6, three);
        System.assertNotEquals(one, four);
        
    }
    
    //How data is used in test classes
    //By default we cannot access org data
    //Tests are isolated from the database... usually
    //
    //Testsetup
    //Data created in a test will not persist to the database
    //We can however create data that is isolated for our tests and only  exists for the period
    //of our test transaction
    //How do we create data that can be used for out entire test class/transaction
    //We will create a test setup method
    //A Test Setup method is a method dedicated to creating test data/dummy data
    //it is executed before each test method
    //It has the @testsetup annotations above it
    //@isTest(SeeAllData=true|false) if this is set to true it can in fact see the org data
    //If seealldata is true you cannot have a testsetup method
    //To use a csv to load test data 
    //you can load the test data in a csv to a static resource
    //To do this use the Test.loadData(Case.sObjectType,'CSV')
    //
    //
    //SOQL and SOSL
    //We have governor limits to consider
    //we have data limits
    //WE would have to use a testsetup or have seealldata=true
    //SOSL - you can use Test.setFixedSearchResults, forces your query to return a specified
    //list of data
    //
    //Test Utility Classes
    //These are test classes that have reusable code that can be called on by multiple test classes
    //It is basically like a test data factory
    //A test utility class must still have the @isTest annotation above it
    //But their other methods do not and can only be called by test classes
    //
    //
    //Test visibility 
    //How can we test private variables and methods if they can only be accessed inside of their class?
    //We give them the @TestVisible annotation above that variable or method
    //
    //
    //
    //
    //Test.startTest() and the Test.stopTest()
    //These methods provide us new governmor limits for our tests,
    //also they allow us to test asynchronous code by forcing it to 
    //run synchronously
    //
    //Testing Security
    //We have a System method called runas() this method allows us to run code/tests as a specific user
    //This runas method looks like
    //System.RunAs(user){
    //whatever code you want to run as a specific user
    //}
    //
    


}