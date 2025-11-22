//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Ownable {
    address owner = msg.sender; //no need to put public keyword here, do not want to show it to other

    constructor() {
        owner = msg.sender; //person who deploys the contract
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "You must be the owner to call this function"
        );
        _;
    }
}


// contract Child is Parent1, Parent2 { } - To do multiple inheritances

contract Inheritance is Ownable {

    //Inheritance -Inheritance means one contract can use the properties and functions of another contract
    // just like classes in Java, JS, or Python - Make your code cleaner & modular (DRY Principle)

    //Factories - A factory is a contract that creates other contracts.

    //Interaction - Interaction means one contract calls a function of another contract.

    string secret; //storing on chain

    // address owner;

    constructor(string memory _secret) {
        secret = _secret;
        // owner = msg.sender; //person who deploys the contract
        //We do not need this line as we are calling this on other contract under constructor func

        //super; //this will call the other contract constructor
        // No need for super; Solidity automatically calls Ownable constructor
    }

    //now i can put this owner modifier in the ownable contract
    // modifier onlyOwner(){
    //     require(msg.sender==owner,"Must be owner to call this function");
    //     _;
    // }

    function getSecret() public view onlyOwner returns (string memory) {
        return secret;
    }
}
