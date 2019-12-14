# Battleship
Battleship built on a DE1-Cyclone II using Verilog in Quartus 13.0sp1 
 
 
This project used code for the vga from https://timetoexplore.net/blog/arty-fpga-vga-verilog-01
and borrowed a debouncer from a given exam file for Dr. Peter Jamieson's ECE287.


The project is not completed, in it's current state, and will need a signifcant amount of logic control to function properly. 
It currently exists in a state about 12 hours away from being finished, but given that I had to restart my entire project 32 
hours before it was demoed, this is as far as I got. I will be working on it gradually over the next six weeks just to prove
I can finish it myself.


The initial idea was to have a start screen diplayed on the vga until the start switch was turned on. 
At this point the screen generates a five by five grid for each player in blue. At this point each player were supposed to 
place two four piece ships in there selected places. Then each player would take their turns taking shots at the other board.
Since there are only eight pieces of the ships on either board, then whenever the other person made eight succesful hits, 
they would win the game. At any point the game could be reset with the reset button. The vga was supposed to update each shot by 
changing the selected shot square with either a yellow for a miss or a red for a hit. Then lastly, the game would have an
endgame screen displaying which person won the game



# /*Things I actually accomplished*/

State Table:
    
start 		  the only thing that changes the state from here is the start switch
                vga initialzed and stays on the start screen until it leaves the start state
                
p1select		Here player one has to turn on the fire switch and the input value from the coordinate switches must be
                greater than zero, and less than twenty, because there are only twenty different ways place a 4x1 ship on a 5x5 grid
                Once the fire switch goes high, the state moves to p1placed. 
                
p1placed		This state is just checking for the instant that the fire button goes low. Once that happens the state returns 
                to p1select. If it returns to p1select and p1 already has two ships placed, then it goes to p2select
    
p2select		The same principles apply here and in p2placed except that 
p2placed		if p2 has two ships then the next state will be p1shot.
    
p1shot		  At this moment, the only way that I knew that I got to this state was that the screen turned a square in the 
                bottom left to red 
                
miss1			  
hit1			  
p2shot		  
miss2			  
hit2			  
p1win			  
p2win 		  
endgame	    
    
At this moment, this is as far as I progressed my project.
