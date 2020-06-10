# VADER-EEE4120f
This project aims to create an add-on device which will speed up recovery of passwords for forensic purposes while being computationally inexpensive. The recovery of the password will require a hashing function and a hashed password.

Petersen Phihlela (PHHPET001) | Itumeleng Malemela (MLMITU002) | Albert Ojo-Aromokudu (OJRALB001)

//////////////////////////////////////////////////////////////////////////////////////////////////
# Instructions for using uart_program

# In the project repository do the following: 
   - navigate to src/ 
   - add the uart_test.v and  uart_tx_rx.v files to vivado design sources in Xilinx-vivado
   
   - change line 48 of uart_pc.cpp to the  port_name that can be found in the Device Manager in windows where the nexys 4 board      is connected
   
   - Then type "make" in the project repo to create the program execution file   
   - run the uart program: ./uart
   - run the vivado program
