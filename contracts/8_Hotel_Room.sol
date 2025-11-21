//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract HotelRooom {
    //Ethers Payment
    //Modifiers
    //Visibility
    //Events
    //Enum

    address payable public owner;

    //Will create event that will trigger when something happened on blockchain
    //To check the logs of bookings
    event Occupy(address _occupant, uint _value);

    enum Statuses {
        Vacant,
        Occupied
    }

    Statuses public currentStatus;

    constructor() {
        // owner = msg.sender; is wrong as -> msg.sender is NOT payable by default
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    function changeBookingStatus() public {
        if(currentStatus == Statuses.Occupied){
            currentStatus = Statuses.Vacant;
        } else{
            currentStatus=Statuses.Occupied;
        }
    }

    //Create modifier to clean the code
    modifier onlyWhileVacant() {
        //Check status
        require(currentStatus == Statuses.Vacant, "Currently Occupied");
        _;
    }

    modifier priceValue(uint _amount) {
        //Check price
        require(
            msg.value >= _amount,
            "Not enough ethers provided, min 2 ethers"
        );
        //if true then code will execute to other lines, if false then code stop executing
        _;
    }

    function book() public payable onlyWhileVacant priceValue(2 ether) {
        currentStatus = Statuses.Occupied;

        //transer keyword or func here will transfer the crypto currency to the recipient here owner
        owner.transfer(msg.value);
        //and crypto currency will comes from the person who will call this book function

        //or we call also use the call function rather than using the transfer 
        // (bool _sent, bytes memory _data) = owner.call{value: msg.value}("");
        // require(true);

        emit Occupy(msg.sender, msg.value);
    }
}
