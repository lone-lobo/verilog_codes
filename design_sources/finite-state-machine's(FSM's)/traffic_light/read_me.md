This represents the problem description of the traffic light problem 

Traffic Light (time triggered | sensor [event] triggered)

a.-> States: RED, YELLOW, GREEN 
b.-> Transitions: After a timer change RED to GREEN, GREEN to YELLOW, and YELLOW to RED.// Could also be triggered on sensing cars in various (more complicated) states.
c.-> The Time split ratio must be    RED:50%    YELLOW:10%  GREEN:40%  of the total time before the timer/counter resets

STEP 1 :
 try to implement a stateless system where it loops through states regardless of input and if reset is asserted it moves to default defined state
 
 STEP 2:
  try to implement a stateless machine where it responds to the input and changes only upon input and stays in the same state unless input or reset is asserted 
  
  STEP 3:
   Try to implement a stateful machine where the machine responds to the varying input at the same posedge clock and remembers the current state as to traverse to the consecutive    states untill a input in fed , the current state changes accordingly to the current input and consecutive states are loaded untill further change in input 
