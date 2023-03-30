Feature: run js file inside feature file

  Background:

  Scenario: Testing a POST api of process payment
  Given url baseurl+'/api/v1/bnpl/processPayment'
  Then status 200

  * def myFun1 = function(){return hellow}
  * def 'returnedData1' = call myFun1
  Then print 'returnedData1---',returnedData1


  * def myFun2 = 
  """
    function(){
      return 'myData'
    }
  """
  * def 'returnedData2' = call myFun2
  Then print 'returnedData2---',returnedData2




  
  