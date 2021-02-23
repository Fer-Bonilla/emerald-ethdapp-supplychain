// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

// Import the library 'AccessControl' fron Openzeppelin
import "@openzeppelin/contracts/access/AccessControl.sol";

// Import the library 'Roles'
//import "./Roles.sol";

// Define a contract 'FarmerRole' to manage this role - add, remove, check
contract MinerRole is AccessControl{

  bytes32 public constant MINER_ROLE = keccak256("MINER_ROLE");

  // In the constructor make the address that deploys this contract the 1st miner
  constructor() {
    _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    _addMiner(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyMiner() {
    require(isMiner(msg.sender));
    _;
  }

  // Define a function 'isMiner' to check this role
  function isMiner(address account) public view returns (bool) {
    return hasRole(MINER_ROLE,account);
  }

  // Define a function 'addMiner' that adds this role
  function addMiner(address account) public onlyMiner {
    _addMiner(account);
  }

  // Define a function 'renounceMiner' to renounce this role
  function renounceMiner() public {
    _removeMiner(msg.sender);
  }

  // Define an internal function '_addMiner' to add this role, called by 'addFarmer'
  function _addMiner(address account) internal {
    grantRole(MINER_ROLE, account);
  }

  // Define an internal function '_removeMiner' to remove this role, called by 'removeFarmer'
  function _removeMiner(address account) internal {
    revokeRole(MINER_ROLE, account);
  }
}