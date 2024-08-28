const Signup = artifacts.require("Signup");
const Login = artifacts.require("Login");

module.exports = function (deployer) {
  deployer.deploy(Signup);
  deployer.deploy(Login);
};
