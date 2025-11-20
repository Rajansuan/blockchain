//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    //State Variables
    uint public counter = 7; //this stored to blockchain, and we can update it but have to pay

    //Local Variables - basically function scoped //can not read value other than its own function

    uint8 public uintOf8 = 10; //means 8 bits = 1byte can store 0 to 255 means –128 to +127 integers
    //uint8 can have 255 but int8 can have maximum 127

    int public signerInteger = -1;

    //strings
    string public stringExample = "My first string";
    bytes32 public myBytes32 = "Hello, World!"; //Cannot store more than 32 characters and cheap in gas

    address public myAddress = 0x0fC5025C764cE34df352757e82f7B5c4Df39A836;
    //address is basically like a username of a blockchain
    //Without addresses, contracts cannot interact with the blockchain or with users like a bank account

    struct Structure {
        uint myUint;
        string myString;
    }

    Structure public myStruck = Structure(1, "Hello, Struct!!");

    //have to write pure as it does not mutate state variable , just fetches the data
    function getValue() public pure returns (uint) {
        uint value = 7;
        return value;
    }

    //Arrays
    uint[] public uintArray = [1, 2, 41];

    string[] public stringArray = ["Rajan", "Suan"];

    string[] public myArray;

    //memory keyword is used here because we need the "value" for temporary period
    //once the "value" string is added to myArray, then we can just remove it and its copy is stored on blockchain
    function addString(string memory value) public {
        // value is temporary
        myArray.push(value); // we store a copy of value in myArray which is stored permanently on blockchain
    }
    function arrayCount() public view returns (uint) {
        return myArray.length;
    }

    //2D Array - Arrays of an array
    uint256[][] public my2DArray = [[1, 2, 3], [5, 6, 7]];
}
