// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Login {
    struct User {
        string name;
        string email;
        string password;
    }

    mapping(address => User) public users;

    function loginUser(string memory _email, string memory _password) public view returns (bool) {
        
        require(bytes(users[msg.sender].email).length > 0, "User does not exist!");

        User memory user = users[msg.sender];
        require(keccak256(abi.encodePacked(user.email)) == keccak256(abi.encodePacked(_email)), "Invalid email!");
        require(keccak256(abi.encodePacked(user.password)) == keccak256(abi.encodePacked(_password)), "Invalid password!");

        return true;
    }
}
