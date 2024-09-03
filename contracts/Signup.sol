// // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Signup {
    struct User {
        string name;
        string email;
        string password;
    }

    mapping(address => User) public users;

    function registerUser(string memory _name, string memory _email, string memory _password) public {
        require(bytes(users[msg.sender].email).length == 0, "User already exists!"); 

        users[msg.sender] = User(_name, _email, _password);
    }

    function userExists(address _address) public view returns (bool) {
        return bytes(users[_address].email).length > 0; 
    }
}
