// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Login {
    struct User {
        string name;
        string email;
        string password;
    }

    mapping(address => User) public users;

    // Function to register a new user
    function registerUser(string memory _name, string memory _email, string memory _password) public {
        require(bytes(users[msg.sender].email).length == 0, "User already exists!"); // Check if user already exists

        users[msg.sender] = User(_name, _email, _password);
    }

    // Function to get user details
    function getUser(address _address) public view returns (string memory, string memory, string memory) {
        User memory user = users[_address];
        return (user.name, user.email, user.password);
    }

    // Function to check if a user exists
    function userExists() public view returns (bool) {
        return bytes(users[msg.sender].email).length > 0;
    }

    // Function to log in a user
    function loginUser(string memory _email, string memory _password) public view returns (bool) {
        // Check if the user exists
        require(bytes(users[msg.sender].email).length > 0, "User does not exist!");

        // Check if the email and password match
        User memory user = users[msg.sender];
        require(keccak256(abi.encodePacked(user.email)) == keccak256(abi.encodePacked(_email)), "Invalid email!");
        require(keccak256(abi.encodePacked(user.password)) == keccak256(abi.encodePacked(_password)), "Invalid password!");

        return true; // Login successful
    }
}
