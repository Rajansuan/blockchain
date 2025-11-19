//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    //Code for counter
    //state variable is that which we write in a contract and that goes to the blockchain
    uint public count = 0;

    //special function called constructor function, and it runs only once when smart contract is deployed
    // constructor() {
    //     count = 0;
    // }
    //already assigned count = 0

    //public is a modifier which we use to get the function accessible outside this contract
    // function getCount() public view returns(uint) {
    //     return count;
    // } 
    //Above fnx is commented out as solidity gives us the public keyword to the variable which auto gives fnx

    //this function is write function and we have to pay the gas fee
    function incrementCount () public {
        count = count + 1; //will get count value from the blockchain
    }


}

