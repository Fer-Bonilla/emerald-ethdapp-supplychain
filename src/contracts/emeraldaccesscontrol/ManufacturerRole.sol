// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

// Import the library 'AccessControl' fron Openzeppelin
import "@openzeppelin/contracts/access/AccessControl.sol";

// Define a contract 'RetailerRole' to manage this role - add, remove, check
contract ManufacturerRole is AccessControl {

  //using Roles for Roles.Role;
  bytes32 public constant MANUFACTURER_ROLE = keccak256("MANUFACTURER_ROLE");

  // In the constructor make the address that deploys this contract the 1st retailer
  constructor() {
    _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    _addManufacturer(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyManufacturer() {
      require(isManufacturer(msg.sender), "Caller is not a Manufacturer.");
    _;
  }

  // Define a function 'isRetailer' to check this role
  function isManufacturer(address account) public view returns (bool) {
    return hasRole(MANUFACTURER_ROLE, account);
    //return manufacturers.has(account);
  }

  // Define a function 'addRetailer' that adds this role
  function addManufacturer(address account) public onlyManufacturer {
    _addManufacturer(account);
  }

  // Define a function 'renounceRetailer' to renounce this role
  function renounceManufacturer() public {
    _removeManufacturer(msg.sender);
  }

  // Define an internal function '_addRetailer' to add this role, called by 'addRetailer'
  function _addManufacturer(address account) internal {
    grantRole(MANUFACTURER_ROLE, account);

  }

  // Define an internal function '_removeRetailer' to remove this role, called by 'removeRetailer'
  function _removeManufacturer(address account) internal {
    revokeRole(MANUFACTURER_ROLE, account);

  }
}