//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Ownable {
    address owner = msg.sender;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "You must be the owner to call this function"
        );
        _;
    }
}

//Here will be secret code will go
contract SecretVault{
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view returns (string memory) {
        return secret;
    }

}


//So Inheritance contract will be act like a factory which will create the SecretVault
contract Inheritance is Ownable {

    //creating address for SecretVault smart contract
    address public secretVaultAddress;

    constructor(string memory _secret) {

        //creating a new smart contract here with out secret and storing its secret
         SecretVault _secretVault = new SecretVault(_secret);
         secretVaultAddress = address(_secretVault);
    }

    function getSecret() public view onlyOwner returns (string memory) {

        //Call another smart contract inside here
        //We have to pass the address so that it should know where it is and call its function
        return SecretVault(secretVaultAddress).getSecret();
    }
}
