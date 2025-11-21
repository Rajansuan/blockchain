//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Loops {

    //address of the owner
    address public Owner;
    constructor(){
        Owner = msg.sender;
    }

    // function isOwner(address CheckOwner) public view returns(bool){
    //     if(CheckOwner == Owner){
    //         return true;
    //     } else {
    //         return false;
    //     }
    // }

    function isOwner() public view returns(bool){
        return(msg.sender == Owner);
    }

    //conditionals
    //loops
    uint[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12];

    function isEven(uint _number) public pure returns (bool) {
        if (_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    //for loop
    function countEven() public view returns (uint) {
        uint count = 0;
        for (uint i = 0; i < numbers.length; i++) {
            if(numbers[i]%2==0){
                count++;
            }
        }
        return count;
    }
}
