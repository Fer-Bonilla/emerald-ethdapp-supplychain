// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

// Import the library 'AccessControl' fron Openzeppelin
import "@openzeppelin/contracts/access/AccessControl.sol";

// Define a contract 'CustodianRole' to manage this role - add, remove, check
contract CustodianRole is AccessControl{
  
  //using Roles for Roles.Role;
  bytes32 public constant CUSTODIAN_ROLE = keccak256("CUSTODIAN_ROLE");

  // In the constructor make the address that deploys this contract the 1st custodian
  constructor () {
    _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    _addCustodian(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyCustodian() {
    require(isCustodian(msg.sender), "Caller is not a custodian.");
    _;
  }

  // Define a function 'isCustodian' to check this role
  function isCustodian(address account) public view returns (bool) {
    return hasRole(CUSTODIAN_ROLE, account);
  }

  // Define a function 'addCustodian' that adds this role
  function addCustodian(address account) public onlyCustodian {
    _addCustodian(account);
  }

  // Define a function 'renounceCustodian' to renounce this role
  function renounceCustodian() public {
    _removeCustodian(msg.sender);
  }

  // Define an internal function '_addCustodian' to add this role, called by 'addDistributor'
  function _addCustodian(address account) internal {
    grantRole(CUSTODIAN_ROLE, account);

  }

  // Define an internal function '_removeDistributor' to remove this role, called by 'removeDistributor'
  function _removeCustodian(address account) internal {
    revokeRole(CUSTODIAN_ROLE, account);

  }
}