// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

// Import the library 'AccessControl' fron Openzeppelin
import "@openzeppelin/contracts/access/AccessControl.sol";

// Define a contract 'RetailerRole' to manage this role - add, remove, check
contract LaboratoryRole is AccessControl {

  //using Roles for Roles.Role;
  bytes32 public constant LABORATORY_ROLE = keccak256("LABORATORY_ROLE");

  // Define 2 events, one for Adding, and other for Removing
  event LaboratoryAdded(address indexed account);
  event LaboratoryRemoved(address indexed account);

  // In the constructor make the address that deploys this contract the 1st retailer
  constructor() {
    _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    _addLaboratory(msg.sender); 
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyLaboratory() {
    require(isLaboratory(msg.sender), "Caller is not a Laboratory.");    
    _;
  }

  // Define a function 'isRetailer' to check this role
  function isLaboratory(address account) public view returns (bool) {
    return hasRole(LABORATORY_ROLE, account);
    //return laboratories.has(account);  
  }

  // Define a function 'addRetailer' that adds this role
  function addLaboratory(address account) public onlyLaboratory {
    _addLaboratory(account);
  }

  // Define a function 'renounceRetailer' to renounce this role
  function renounceLaboratory() public {
    _removeLaboratory(msg.sender);
  }

  // Define an internal function '_addRetailer' to add this role, called by 'addRetailer'
  function _addLaboratory(address account) internal {
    grantRole(LABORATORY_ROLE, account);
  }

  // Define an internal function '_removeRetailer' to remove this role, called by 'removeRetailer'
  function _removeLaboratory(address account) internal {
    revokeRole(LABORATORY_ROLE, account);
  }
}