// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// contract Signup {
//     struct User {
//         string name;
//         string email;
//         string password;
//     }

//     mapping(address => User) public users;

//     function registerUser(string memory _name, string memory _email, string memory _password) public {
//         users[msg.sender] = User(_name, _email, _password);
//     }

//     function getUser(address _address) public view returns (string memory, string memory, string memory) {
//         User memory user = users[_address];
//         return (user.name, user.email, user.password);
//     }

    
// }


pragma solidity ^0.8.0;

contract Signup {
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

    // Function to get user details by address
    function getUser(address _address) public view returns (string memory, string memory, string memory) {
        User memory user = users[_address];
        return (user.name, user.email, user.password);
    }

    // Function to check if a user exists by address
    function userExists(address _address) public view returns (bool) {
        return bytes(users[_address].email).length > 0; // Check if the email field is not empty
    }
}
