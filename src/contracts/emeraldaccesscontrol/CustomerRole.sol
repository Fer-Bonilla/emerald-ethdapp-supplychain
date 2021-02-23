// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

// Import the library 'AccessControl' fron Openzeppelin
import "@openzeppelin/contracts/access/AccessControl.sol";

// Define a contract 'ConsumerRole' to manage this role - add, remove, check
contract CustomerRole is AccessControl {
  
  //using Roles for Roles.Role;
  bytes32 public constant CUSTOMER_ROLE = keccak256("CUSTOMER_ROLE");

  // In the constructor make the address that deploys this contract the 1st consumer
  constructor() {
    _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    _addCustomer(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyCustomer() {
    require(isCustomer(msg.sender), "Caller is not a customer.");
    _;
  }

  // Define a function 'isConsumer' to check this role
  function isCustomer(address account) public view returns (bool) {
    return hasRole(CUSTOMER_ROLE, account);
    //return customers.has(account);
  }

  // Define a function 'addConsumer' that adds this role
  function addCustomer(address account) public onlyCustomer {
    _addCustomer(account);
  }

  // Define a function 'renounceConsumer' to renounce this role
  function renounceCustomer() public {
    _removeCustomer(msg.sender);
  }

  // Define an internal function '_addConsumer' to add this role, called by 'addConsumer'
  function _addCustomer(address account) internal {
    grantRole(CUSTOMER_ROLE, account);

  }

  // Define an internal function '_removeConsumer' to remove this role, called by 'removeConsumer'
  function _removeCustomer(address account) internal {
    revokeRole(CUSTOMER_ROLE, account);

  }
}