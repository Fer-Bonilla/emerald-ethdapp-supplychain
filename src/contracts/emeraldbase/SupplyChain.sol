// Contracts/SupplyChain.sol
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "../emeraldaccesscontrol/MinerRole.sol";
import "../emeraldaccesscontrol/LaboratoryRole.sol";
import "../emeraldaccesscontrol/CustodianRole.sol";
import "../emeraldaccesscontrol/ManufacturerRole.sol";
import "../emeraldaccesscontrol/CustomerRole.sol";
import "./EmeraldStates.sol";
import "./Emerald.sol";

// Define a contract 'Supplychain'
contract SupplyChain is Ownable, AccessControl, MinerRole, LaboratoryRole, CustodianRole, ManufacturerRole, CustomerRole{

  // Define a variable called 'upc' for Universal Product Code (UPC)
  uint upc;

  // Define a variable called 'sku' for Stock Keeping Unit (SKU)
  uint sku;

  // Define a public mapping 'emeralds' that maps the UPC to an Emerald.
  mapping (uint => Emerald) emeralds;

  // Define a public mapping 'emeraldHistory' that maps the UPC to an array of TxHash, 
  // that track its journey through the supply chain -- to be sent from DApp.
  mapping (uint => string[]) emeraldsHistory;

  EmeraldStates.State constant defaultState = EmeraldStates.State.Mined;

  // Define 17 events with the same 17 state values and accept 'upc' as input argument
  event Mined(uint upc);
  event Scaled(uint upc);
  event PackedForLab(uint upc);
  event ShipedToLab(uint upc);
  event LabReceived(uint upc);
  event Certified(uint upc);
  event ShippedToStore(uint upc);
  event StorageReceived(uint upc);
  event Stored(uint upc);
  event ForSale(uint upc);
  event Sold(uint upc);
  event ShipToManufacture(uint upc);
  event ManufacturerReceived(uint upc);
  event Manufactured(uint upc);
  event PackedForSale(uint upc);
  event Published(uint upc);
  event Buyed(uint upc);
  event ShippedToCustomer(uint upc);
  event Delivered(uint upc);

  // Define a modifer that verifies the Caller
  modifier verifyCaller (address _address) {
    require(msg.sender == _address); 
    _;
  }

  // Define a modifier that checks if the paid amount is sufficient to cover the price
  modifier paidEnough(uint _price) { 
    require(msg.value >= _price,"Not enought paid amount"); 
    _;
  }
  
  // Define a modifier that checks the price and refunds the remaining balance
  modifier checkValue(uint _upc) {
    _;
    uint _price = emeralds[_upc].GetMarketPrice();
    uint amountToReturn = msg.value - _price;
    msg.sender.transfer(amountToReturn);
  }

  // Define a modifier that checks if an item.state of a upc is Mined
  modifier mined(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.Mined);
    _;
  }

  //Define a modifier that checks if an item.state of a upc is Processed
  modifier scaled(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.Scaled);
    _;
  }
  
  //Define a modifier that checks if an item.state of a upc is Packed
  modifier packedForLab(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.PackedForLab);
    _;
  }

  // Define a modifier that checks if an item.state of a upc is ForSale
  modifier shipedToLab(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.ShipedToLab);
    _;
  }

  // Define a modifier that checks if an item.state of a upc is Sold
  modifier labReceived(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.LabReceived);
    _;
  }
  
  // Define a modifier that checks if an item.state of a upc is Shipped
  modifier certified(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.Certified);
    _;
  }

  // Define a modifier that checks if an item.state of a upc is Received
  modifier shippedToStore(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.ShippedToStore);
    _;
  }

  // Define a modifier that checks if an item.state of a upc is Received
  modifier storageReceived(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.StorageReceived);
    _;
  }  

  // Define a modifier that checks if an item.state of a upc is Purchased
  modifier stored(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.Stored);
    _;
  }

  // Define a modifier that checks if an item.state of a upc is Mined
  modifier forSale(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.ForSale);
    _;
  }

  // Define a modifier that checks if an item.state of a upc is Processed
  modifier sold(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.Sold);
    _;
  }
  
  // Define a modifier that checks if an item.state of a upc is Packed
  modifier shiptoManufacture(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.ShipToManufacture);
    _;
  }

  // Define a modifier that checks if an item.state of a upc is Packed
  modifier manufacturerReceived(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.ManufacturerReceived);
    _;
  }

  // Define a modifier that checks if an item.state of a upc is ForSale
  modifier manufactured(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.Manufactured);
    _;
  }

  //Define a modifier that checks if an item.state of a upc is Sold
  modifier packedForSale(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.PackedForSale);
    _;
  }
  
  // Define a modifier that checks if an emerald.state of a upc is ShPublishedipped
  modifier published(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.Published);
    _;
  }

  // Define a modifier that checks if an emerald.state of a upc is Buyed
  modifier buyed(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.Buyed);
    _;
  }

  // Define a modifier that checks if an emerald.state of a upc is ShippedToClient
  modifier shippedToCustomer(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.ShippedToCustomer);
    _;
  }

  // Define a modifier that checks if an emerald.state of a upc is Delivered
  modifier delivered(uint _upc) {
    require(emeralds[_upc].GetEmeraldState() == EmeraldStates.State.Delivered);
    _;
  }

  // In the constructor set 'owner' to the address that instantiated the contract
  // and set 'sku' to 1
  // and set 'upc' to 1
  constructor() {
    //owner = msg.sender;
    sku = 1;
    upc = 1;
    _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
  }

  // Define a function 'kill' if required
  function kill() public onlyOwner{
    selfdestruct(msg.sender);
  }

  // Define a function 'extractItem' that allows a farmer to mark an item 'Harvested'
  function extractEmerald(
    uint _sku,
    uint _upc,
    address payable _originMinerID,
    string memory _originMineName,
    string memory _originMineInformation, 
    string memory _originMineLatitude, 
    string memory _originMineLongitude  
    )
    public
    onlyMiner

    {

    //add emerald to emeralds list in the contract
    Emerald emerald = new Emerald();
    emerald.SetExtractionInfo(
      _sku,
      _upc,
      _originMinerID,
      _originMineName,
      _originMineInformation, 
      _originMineLatitude, 
      _originMineLongitude      
    );

    emerald.SetEmeraldState(EmeraldStates.State.Mined);

    emeralds[_upc] = emerald;

    //Increment sku
    sku = sku + 1;

    // Emit the appropriate event
    emit Mined(_upc);
    
  }

  // Define a function 'scaleItem' that allows a Miner to mark an item 'Processed'
  function scaleEmerald(
    uint _upc,
    string memory _scaleInfo 
    ) 
    public
    // Call modifier to check if upc has passed previous supply chain stage
    mined(_upc)
    // Call modifier to verify caller of this function
    verifyCaller(emeralds[_upc].GetOwnerID())
    
    onlyMiner 
  
  {
    // Update the appropriate fields
    emeralds[_upc].SetScaleInfo(
      _scaleInfo 
    );

    emeralds[_upc].SetEmeraldState(EmeraldStates.State.Scaled);

    // Emit the appropriate event
    emit Scaled(_upc);  
  }

  //Define a function 'packScaledItem' that allows a Miner to mark an item 'Packed'
  function packScaledEmerald(uint _upc, address _laboratoryID, address _custodianID)
    public 
    // Call modifier to check if upc has passed previous supply chain stage
    scaled(_upc)
    // Call modifier to verify caller of this function
    verifyCaller(emeralds[_upc].GetOwnerID())
    
    onlyMiner 
  
  {
    // Update the appropriate fields
    emeralds[_upc].AuthorizeLab(_laboratoryID);
    emeralds[_upc].AuthorizeCustodian(_custodianID);
    
    // Update Emerald state
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.PackedForLab);

    // Emit the appropriate event
    emit PackedForLab(_upc);
  }

  // Define a function 'shipToLaboratory' that allows a Miner to mark an item 'ShipToLab'
  function shipToLaboratory(uint _upc)
    public 
    // Call modifier to check if upc has passed previous supply chain stage
    packedForLab(_upc)
    // Call modifier to verify caller of this function
    verifyCaller(emeralds[_upc].GetOwnerID())
    
    onlyMiner 
  
  {
    // Update the appropriate fields
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.ShipedToLab);

    // Emit the appropriate event
    emit ShipedToLab(_upc);
  }

  // Define a function 'shipToLaboratory' that allows a Miner to mark an item 'ShipToLab'
  function laboratoryReceived(uint _upc)
    public 
    // Call modifier to check if upc has passed previous supply chain stage
    shipedToLab(_upc)
    // Call modifier to verify caller of this function
    verifyCaller(emeralds[_upc].GetLaboratoryID())
    
    onlyLaboratory
  
  {
    // Update the appropriate fields
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.LabReceived);

    // Emit the appropriate event
    emit LabReceived(_upc);
  }

  // Define a function 'scaleItem' that allows a Miner to mark an item 'Processed'
  function certifyEmerald(
    uint _upc,
    string memory _certifiedProperties
    ) 
    public
    // Call modifier to check if upc has passed previous supply chain stage
    labReceived(_upc)
    // Call modifier to verify caller of this function
    verifyCaller(emeralds[_upc].GetLaboratoryID())
    
    onlyLaboratory 
  
  {
    // Update the appropriate fields
    emeralds[_upc].SetCertifiedInfo(_certifiedProperties);
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.Certified);

    // Emit the appropriate event
    emit Certified(_upc);  
  }

  // Define a function 'shipToLaboratory' that allows a Miner to mark an item 'ShipToLab'
  function shipToSecureStore(uint _upc)
    public 
    // Call modifier to check if upc has passed previous supply chain stage
    certified(_upc)
    // Call modifier to verify caller of this function
    verifyCaller(emeralds[_upc].GetLaboratoryID())
    
    onlyLaboratory
  
  {
    // Update the appropriate fields
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.ShippedToStore);

    // Emit the appropriate event
    emit ShippedToStore(_upc);
  }

  // Define a function 'shipToLaboratory' that allows a Miner to mark an item 'ShipToLab'
  function SecureStorageReceived(uint _upc)
    public 
    // Call modifier to check if upc has passed previous supply chain stage
    shippedToStore(_upc)
    // Call modifier to verify caller of this function
    verifyCaller(emeralds[_upc].GetCustodianID())    
    
    onlyCustodian
  
  {
    // Update the appropriate fields
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.StorageReceived);

    // Emit the appropriate event
    emit StorageReceived(_upc);
  }

  // Define a function 'shipToLaboratory' that allows a Miner to mark an item 'ShipToLab'
  function StoreEmerald(uint _upc)
    public 
    // Call modifier to check if upc has passed previous supply chain stage
    storageReceived(_upc)
    // Call modifier to verify caller of this function
    verifyCaller(emeralds[_upc].GetCustodianID())
    
    onlyCustodian
  
  {
    // Update the appropriate fields
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.Stored);

    // Emit the appropriate event
    emit Stored(_upc);
  }

  // Define a function 'shipToLaboratory' that allows a Miner to mark an item 'ShipToLab'
  function registerForSale(uint _upc, uint _marketPrice)
    public 
    // Call modifier to check if upc has passed previous supply chain stage
    stored(_upc)
    // Call modifier to verify caller of this function
    verifyCaller(emeralds[_upc].GetOwnerID())
    
    onlyMiner
  
  {
    //Setup market price  
    emeralds[_upc].SetMarketPrice(_marketPrice);
    // Update the appropriate fields
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.ForSale);

    // Emit the appropriate event
    emit ForSale(_upc);
  }

  // Define a function 'buyItem' that allows the disributor to mark an item 'Sold'
  // Use the above defined modifiers to check if the item is available for sale, if the buyer has paid enough, 
  // and any excess ether sent is refunded back to the buyer
  function buyFromMiner(uint _upc) public payable 
    // Call modifier to check if upc has passed previous supply chain stage
    forSale(_upc)
    // Call modifer to check if buyer has paid enough
    paidEnough(emeralds[_upc].GetMarketPrice())
    // Call modifer to send any excess ether back to buyer
    checkValue(_upc)
    
    onlyManufacturer
  
  {
    // Transfer money to Miner
    (bool success, ) = emeralds[_upc].getOriginMinerID().call{value: emeralds[_upc].GetMarketPrice()}("");
    require(success, "Transfer failed");

    // Tranfer emerald ownership
    emeralds[_upc].SetOwnerID(msg.sender);

    emeralds[_upc].SetManufacturerID(msg.sender);

    // Update emerald state
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.Sold);

    // Emit the appropriate event
    emit Sold(_upc);
    
  }

  // Define a function 'shipItem' that allows the distributor to mark an item 'Shipped'
  // Use the above modifers to check if the item is sold
  function shipToManufacturer(uint _upc) public 
    // Call modifier to check if upc has passed previous supply chain stage
    sold(_upc)
    // Call modifier to verify caller of this function
    onlyCustodian
    {
    // Update the appropriate fields
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.ShipToManufacture);

    // Emit the appropriate event
    emit ShipToManufacture(_upc);    
  }

  // Define a function 'receiveItem' that allows the retailer to mark an item 'Received'
  // Use the above modifiers to check if the item is shipped
  function receiveFromStorage(uint _upc) public 
    // Call modifier to check if upc has passed previous supply chain stage
    shiptoManufacture(_upc)
    // Access Control List enforced by calling Smart Contract / DApp
    onlyManufacturer
    {
    // Update the appropriate fields - ownerID, retailerID, itemState
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.ManufacturerReceived);

    // Emit the appropriate event
    emit ManufacturerReceived(_upc);    
  }

  // Define a function 'purchaseItem' that allows the consumer to mark an item 'Purchased'
  // Use the above modifiers to check if the item is received
  function manufactureEmerald(
    uint _upc,
    string memory _manofactureInfo
    )    
    public 
    // Call modifier to check if upc has passed previous supply chain stage
    manufacturerReceived(_upc)
    // Access Control List enforced by calling Smart Contract / DApp
    onlyManufacturer
    {
    // Update the appropriate fields
    emeralds[_upc].SetManufacturedInfo(_manofactureInfo);

    // Update the appropriate fields - ownerID, consumerID, itemState
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.Manufactured);
    // Emit the appropriate event
    emit Manufactured(_upc);    
  }

  // Define a function 'purchaseItem' that allows the consumer to mark an item 'Purchased'
  // Use the above modifiers to check if the item is received
  function packCutEmerald(uint _upc) public 
    // Call modifier to check if upc has passed previous supply chain stage
    manufactured(_upc)
    // Access Control List enforced by calling Smart Contract / DApp
    onlyManufacturer
    {
    // Update the appropriate fields - ownerID, consumerID, itemState
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.PackedForSale);
    // Emit the appropriate event
    emit PackedForSale(upc);    
  }

  // Define a function 'purchaseItem' that allows the consumer to mark an item 'Purchased'
  // Use the above modifiers to check if the item is received
  function publishEmerald(uint _upc, uint _marketPrice) public 
    // Call modifier to check if upc has passed previous supply chain stage
    packedForSale(_upc)
    // Access Control List enforced by calling Smart Contract / DApp
    onlyManufacturer
    {

    //Setup market price  
    emeralds[_upc].SetMarketPrice(_marketPrice);
    // Update the appropriate fields - ownerID, consumerID, itemState
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.Published);
    // Emit the appropriate event
    emit Published(_upc);    
  }

  // Define a function 'purchaseItem' that allows the consumer to mark an item 'Purchased'
  // Use the above modifiers to check if the item is received
  function buyFromManufacturer(uint _upc) public payable
    // Call modifier to check if upc has passed previous supply chain stage
    published(_upc)
    // Call modifer to check if buyer has paid enough
    paidEnough(emeralds[_upc].GetMarketPrice())
    // Call modifer to send any excess ether back to buyer
    checkValue(_upc)
    
    onlyCustomer
    {
    // Update the appropriate fields - ownerID, consumerID, itemState
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.Buyed);
    
    // Transfer money to Manufacturer
    (bool success, ) = emeralds[_upc].getManufacturerID().call{value: emeralds[_upc].GetMarketPrice()}("");
    require(success, "Transfer failed");
    
    // Set the customerID value
    emeralds[_upc].SetCustomerID(msg.sender);

    // Transfer ownership
    emeralds[_upc].SetOwnerID(msg.sender);

    // Emit the appropriate event
    emit Buyed(_upc);    
  }

  // Define a function 'purchaseItem' that allows the consumer to mark an item 'Purchased'
  // Use the above modifiers to check if the item is received
  function shipEmeraldToCustomer(uint _upc) public 
    // Call modifier to check if upc has passed previous supply chain stage
    buyed(_upc)
    // Access Control List enforced by calling Smart Contract / DApp
    onlyManufacturer

    {
    // Update the appropriate fields - ownerID, consumerID, itemState
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.ShippedToCustomer);
    // Emit the appropriate event
    emit ShippedToCustomer(_upc);    
  }

  // Define a function 'purchaseItem' that allows the consumer to mark an item 'Purchased'
  function deliverToCustomer(uint _upc) public 
    // Call modifier to check if upc has passed previous supply chain stage
    shippedToCustomer(_upc)
    // Access Control List enforced by calling Smart Contract / DApp
    onlyCustomer
    {
    // Update the appropriate fields - ownerID, consumerID, itemState
    emeralds[_upc].SetEmeraldState(EmeraldStates.State.Delivered);
    // Emit the appropriate event
    emit Delivered(_upc);    
  }

  // Define a function 'fetchItemBufferOne' that fetches the data
  function fetchItemBufferOne(uint _upc) public view returns (bytes memory) 
  {
    return (emeralds[_upc].GetBasicInfo());
  }

  // Define a function 'fetchItemBufferTwo' that fetches the data
  function fetchItemBufferTwo(uint _upc) public view returns (bytes memory) 
  {
    return (emeralds[_upc].GetDetailedInfo());
  }
}
