module lab_4 (A,B,C,D,O);
input A,B,C,D;
output [7:1]O;

assign O[1]=~((~B&~D)|(~A&C)|(B&C)|(A&~D)|(A&~B&~C)|(~A&B&D));
assign O[2]=~((~A&~B)|(~B&~D)|(~A&~C&~D)|(~A&C&D)|(A&~C&D));
assign O[3]=~((~A&~C)|(~A&D)|(~A&B)|(A&~B)|(~C&D));
assign O[4]=~((~A&~B&~D)|(B&C&~D)|(~B&C&D)|(B&~C&D)|(A&~C&~D));
assign O[5]=~((A&B)|(A&C)|(C&~D)|(~A&~B&~D)|(A&~D));
assign O[6]=~((A&C)|(A&~B)|(~C&~D)|(B&~D)|(~A&B&~C));
assign O[7]=~((C&~D)|(A&D)|(A&~B)|(~A&~B&C)|(~A&B&~C));

endmodule 
