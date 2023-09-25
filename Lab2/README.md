# Lab 2

## Instructions
1. Write a function to check whether a contract has code or not. Hint: Use assembly function. 
2. Implement a smart contract that interacts with another contract via delegate calls to update state variables. Note: Do not use the same example from class. 
3. Explain advantages and disadvantages of using atomic swaps and cross-chain bridges. 

#### Check for code
![image](https://github.com/EmanElsefy/BCDV-4028/assets/113483167/aba300bb-53c5-46a9-b0f0-b1d3bfc15df9)
So first I tried an empty contract as shown above
The size however was greater than zero (62 to be exact)
![image](https://github.com/EmanElsefy/BCDV-4028/assets/113483167/b664328b-be20-4aac-a8fa-b71ede16f6a8)
That's why it's showing that contract has code = True
So I tried a taking an account address that doesn't have any contracts deployed to it:
![image](https://github.com/EmanElsefy/BCDV-4028/assets/113483167/efead9cb-4b2a-42ff-91da-b538dd2ef04e)
So now it's showing False. So there is a check that's happening.

#### Contract delegate calls
![image](https://github.com/EmanElsefy/BCDV-4028/assets/113483167/2356336d-fdb9-4805-8c2b-fdab9cd5fdf5)
![image](https://github.com/EmanElsefy/BCDV-4028/assets/113483167/7747f10b-b460-4f92-a6f1-51b39612b4a3)
![image](https://github.com/EmanElsefy/BCDV-4028/assets/113483167/ef7af44c-1378-40fc-9cce-a39a9bc5039e)
for some reason, I wasn't able to debug why whenever I delegate call it actually updates the address of the called contract and not the value.

#### Advantages of Atomic Swaps:
   - Peer-to-peer trading
   - Lower costs
   - Security
   - Decentralized nature
   - Altcoin exchange

#### Disadvantages of Atomic Swaps:
   - Complexity and conditions
   - Privacy issues

#### Advantages of Cross-Chain Bridges:
   - Interoperability
   - Flexibility

#### Disadvantages of Cross-Chain Bridges:
   - Centralization
   - Security
   - Complexity
