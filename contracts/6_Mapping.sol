//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Map {
    //map is datatype which helps us to store data on blockchain in key value objects
    mapping(uint => string) public names;

    //no need to write public in constructor
    constructor() {
        names[1] = "suanicks";
        names[2] = "chauhan";
    }

    //now we can create books mapping from book struct
    struct Book {
        uint page;
        string title;
        string author;
    }

    Book public myBook1 = Book(7, "finance", "Alex");
    
    //or we can do this by mapping
    mapping(uint => Book) public books;


    function AddBook(
        uint _id,
        uint _page,
        string memory _title,
        string memory _author
    ) public {
        books[_id] = Book(_page, _title, _author);
    }

    //we can also have mappings of mapping
    //common for nfts and tokens oe balance nested under a particular user account

    mapping(address => mapping(uint => Book)) public myAllBooks;

    function AddMyAllBooks(
        uint _id,
        uint _page,
        string memory _title,
        string memory _author
    ) public {
        myAllBooks[msg.sender][_id] = Book(_page, _title, _author);
    }

    //msg is a global variable -> msg.sender is address of person who call smart contract


}
