VERSION 1.0

This Folder describes the basic and naive method of vedic multiplier 
    the basic 2_bit x 2_bit  vedic implementation both in combinational and sequential form
    the basic 4_bit x 4_bit  vedic implementation is done using two 2x2 vedic multipliers and using 4bit and 6bit adders (that is for n bit multiplier we use 1 n bit adder and 2 n+n/2 bit adder )
    the same we expand and iterate for successive 8_bit , 16_bit , 32_bit multiplier  
    
    =====================================================================================================================================================================
   
   VERSION 2.0
   
    Instead of using n bit along with (n+n/2) bit adders we use only n bit adders ..Since we reduce the two (n/2 bit adder) for each n bit multiplier we reduce the carry         propogation delay due to two (n/2 bit adders) 
    and hereby reducing the extra hardware and delay due to the n/2 adders 
    we apply the same to all 4x4 8x8 16x16 32x32 bit multipiers , as the N value increases more effecient the version 2.0 becomes
    
    
