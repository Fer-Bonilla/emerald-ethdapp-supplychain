<p align="center">
   <a href="https://docs.soliditylang.org/en/v0.7.4/">
      <img src="https://img.shields.io/badge/Solidity-0.7.4-green.svg?style=flat" alt="Solidity 0.7.4">
      <img src="https://img.shields.io/badge/Node.js-12.16.2-green.svg?style=flat" alt="Solidity 0.7.4">
      <img src="https://img.shields.io/badge/Truffle-5.1.58-green.svg?style=flat" alt="Solidity 0.7.4">
      <img src="https://img.shields.io/badge/Web3.js-0.7.4-green.svg?style=flat" alt="Solidity 0.7.4">
   </a>
</p>

# Emeralds supplychain Dapp

Smart contracts project with solidity for manage emeralds supply chain. 

In this project, We explore an Ethereum Dapp development for a decentralized emeralds supply chain. The main goal is reduce intermediaries from the miner to the final client. The project is developed incrementally following agile methodologies. We are going to update documents and code with each version. 

## Emeralds supply chain process

Colombia is the biggest emeralds producer worldwide; close to 60% of all emeralds production comes from there. Colombian emeralds are recognized for their quality and beautiful tones. The extraction process still handcrafts in many areas and has an extensive traders and intermediaries network. The next diagrams show a general view of actors, and steps involved in the emeralds production and trading:

![Emeralds supply chain process](https://github.com/Fer-Bonilla/emeralds-supplychain-dapp/blob/main/images/emeraldssuppychain.png)

The challenge is to apply blockchain to create a Decentralized App that helps trade emeralds in a trustworthy market supported by  Smart Contracts on the Ethereum platform. We start by simplifying the supply chain problem and breaking the trading cycle into two parts. The first one starts with the extraction and ends with the trading process of cut emeralds, and the second one starts with the cut emeralds and finishes when jewels with emeralds are sell to the final customer.

### Part1:

![Emeralds supply chain process](https://github.com/Fer-Bonilla/emeralds-supplychain-dapp/blob/main/images/part1emeraldsprocess.png)

### Part2

![Emeralds supply chain process](https://github.com/Fer-Bonilla/emeralds-supplychain-dapp/blob/main/images/part2emeraldsprocess.png)

### Part 1 description

We are focusing on process part 1 for the first Dapp version. In this version, the main goal is to reduce the intermediaries and offer a trustworthy supply chain where miners and clients (final clients or jewel producers) can trade easily with less risk. For this first Dapp version, we consider these actors:

 - **Miners:** Companies or people extracting emeralds from the mines.
 - **Laboratories:** Specialized laboratories that certify the quality grade and other emeralds properties
 - **Custodians:** Companies offering secure store for certified emeralds
 - **Manufacturers:** Companies offering cutting and polishing services transforming raw emeralds into shaped stones
 - **Jewelers:** Companies or people manufacturing jewels


### Part 2 description

Dapp's part 2 cover the process from de cut emerald to jewel creation and selling to final clients. In this part, we look for a way to directly connect the jewel makers with final clients in a trustworthy trading system. This part considers for example the transformation of a cut emerald to a luxury jewel that can use other materials (For example gold or other gems). The actors involved in this second part are:

 - **Material supplier:** Companies that provide other materials required for jewels manufacturing
 - **Jewels certifier:** Companies certifying the quality grade and jewels final properties
 - **Final client:** Final buyers of manufactured jewels

### Technical challenges

- **Contracts cost deployment:** We need to keep small contracts size and operations
- **Low storage capacity and cost:** The Ethereum networks are costly to save information, we need to Keep in the blockchain the minimum data
- **Transactions cost:** We need to minimize the transactions calls and data transfer on the network
- **Secutiry:** Managed users control and authorization for different actors involved and keep the accounts safe.


### Functional requirements

The process starts with the emerald extraction performed by the miner in the mine. The miner needs to scale the stone with information like weight, color, size, and clarity grade. These are technical parameters to a detailed description of each emerald. After scale, the emerald needs to be packeted to ship to the specialized laboratory authorized by the miner for trusted technical verifications and properties certification. Once emerald is shipped to Laboratory, this one needs to confirm the reception and do the certification process. The certified emerald is sent to a secure custodian storage service, authorized by the miner in the packaging process. The Custodian storage confirms reception, store the emerald and send a verification to the miner, who at this point, have a certified and secured emerald and can register for sale, setting up the price based on the certified properties. With the emeralds in the raw emerald in the market, the manufacturer can buy a raw emerald to cut and polish them to make a product able to be used in jewel manufacturing. The manufacturer buys the emerald, taking its ownership, and ships an order to the custodian to get the raw emerald to their processing factory. The Manufacturer process the emerald, pack for sale and register for a market sale with the new prices market. The jewel creators can search all the stones in the cut emeralds offer and buy them. When they transfer the amount to the manufacturer, they send the cut emerald to the customer location and confirm the final reception.


### Product roapmap:
![Product Roadmap](https://github.com/Fer-Bonilla/emeralds-supplychain-dapp/blob/main/images/product_roapmap.png)



### Blockchain architecture design:

To accomplish this task, we are going to use UML (Universal Modeling Language) to design architectural views of our system. The architectural views to use are:

-	**Activities model:** Describe the actor’s interactions and the flow of activities.
-	**Sequence model:** To help us to understand the actors and objects' message interchange.
-	**States diagram:** Used to let us understand emerald's state in each activity in the flow.
-	**Class model:** Express the data and functions needed in each contract.
 
### Activy diagram
![Emeralds supply chain process](https://github.com/Fer-Bonilla/emeralds-supplychain-dapp/blob/main/uml/Activity_diagram.png)
 
### Sequence diagram
 ![Emeralds supply chain process](https://github.com/Fer-Bonilla/emeralds-supplychain-dapp/blob/main/uml/Sequence_diagram.png)
  
### States diagram
![Emeralds supply chain process](https://github.com/Fer-Bonilla/emeralds-supplychain-dapp/blob/main/uml/States_diagram.png)

### Class diagram
![Emeralds supply chain process](https://github.com/Fer-Bonilla/emeralds-supplychain-dapp/blob/main/uml/Class_diagram.png)
 
### Contracts implementation

To understand project class organization and contract implementation we need to consider the external libraries and folders. This is presented in the next diagram:

![Emeralds supply chain process](https://github.com/Fer-Bonilla/emeralds-supplychain-dapp/blob/main/uml/Contracts_implementation.png)
 
## Project write-up - Libraries

We use openzeppely library to implements accesscontrol and ownable contracts for an easy role and authorization management. The development uses Truffle framework, web3 to interact with the contract and `truffle-hd-wallet-provider` to sign transactions for addresses.

![Oppenzeppelin]: https://docs.openzeppelin.com/openzeppelin/ 
![Truffle]: https://www.trufflesuite.com/
![web3]: https://web3js.readthedocs.io/en/v1.3.0/

## IPFS
IPFS is used as a decentralized repository to save the emeralds-related files.

![IPFS]: https://ipfs.io/


## Contracts deployment on the Rinkeby test network 

To deply the contratcs on Rinkeby network is neccessaty setup the 

The adress for the supplychaon contract on the rinkeby network is:








## Contract address on the (Etherscan):
https://rinkeby.etherscan.io/address/0x1d4396d3dfdfffb57e2ae580f175e7dfcf08759a

## Transaction ID and contract address

======================
> Network name:    'rinkeby'
> Network id:      4
> Block gas limit: 0x989677


1_initial_migration.js
======================

   Deploying 'Migrations'
   ----------------------
   > transaction hash:    0x1a02bb12fc80417e2ad1bd56250775110126d74e48fbb03041ae98b24ff92052
   > Blocks: 1            Seconds: 21
   > contract address:    0x302cfAe2e65F6651f3fDB5fAe6f635ca62CA567b
   > block number:        5625069
   > block timestamp:     1576515319
   > account:             0x1D4396D3DfdFFFB57e2Ae580f175E7DFCf08759A
   > balance:             0.97167573
   > gas used:            238594
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.00238594 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:          0.00238594 ETH


2_deploy_contracts.js
=====================

   Deploying 'FarmerRole'
   ----------------------
   > transaction hash:    0x79b84bba9672baeb0181fa97016e03510903903052a19f4a4a6f0168627ef9ca
   > Blocks: 1            Seconds: 12
   > contract address:    0xa041c902B5E6a8a83c9A3cf6D55C65183eb2462f
   > block number:        5625071
   > block timestamp:     1576515349
   > account:             0x1D4396D3DfdFFFB57e2Ae580f175E7DFCf08759A
   > balance:             0.96674205
   > gas used:            451020
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.0045102 ETH


   Deploying 'DistributorRole'
   ---------------------------
   > transaction hash:    0xf245353475ad170ce060d54680cb2003f8abf9ecdef52db245791b3ca9f79b41
   > Blocks: 0            Seconds: 9
   > contract address:    0xaf1624F9BA8972070eE42311684BE921000355b1
   > block number:        5625072
   > block timestamp:     1576515364
   > account:             0x1D4396D3DfdFFFB57e2Ae580f175E7DFCf08759A
   > balance:             0.96223113
   > gas used:            451092
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.00451092 ETH


   Deploying 'RetailerRole'
   ------------------------
   > transaction hash:    0xec3342fef968e5791df950cf6e1ba8b037d348b11f26e8f5a58f2cb41e6523fe
   > Blocks: 0            Seconds: 9
   > contract address:    0xaf4Cb7bb1ED23FA76f18E34261BE81584Bc6c792
   > block number:        5625073
   > block timestamp:     1576515379
   > account:             0x1D4396D3DfdFFFB57e2Ae580f175E7DFCf08759A
   > balance:             0.95772033
   > gas used:            451080
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.0045108 ETH


   Deploying 'ConsumerRole'
   ------------------------
   > transaction hash:    0x0346a0f1176aacbc2f70d695d25d3ff0bc2b2c5b7b29257e530a3c63510a595a
   > Blocks: 0            Seconds: 7
   > contract address:    0x59Fb032D660d3830Ec24729D6A57286c8Cef0dd8
   > block number:        5625074
   > block timestamp:     1576515394
   > account:             0x1D4396D3DfdFFFB57e2Ae580f175E7DFCf08759A
   > balance:             0.95320977
   > gas used:            451056
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.00451056 ETH


   Deploying 'SupplyChain'
   -----------------------
   > transaction hash:    0x33d25ff003526fa072304b4fcb2921d8e160c37b3cd70292d6a842cf6cecbb49
   > Blocks: 1            Seconds: 10
   > contract address:    0x66c0486577009EC26A9429B1E38657Ba0fa5c2B0
   > block number:        5625075
   > block timestamp:     1576515409
   > account:             0x1D4396D3DfdFFFB57e2Ae580f175E7DFCf08759A
   > balance:             0.92025103
   > gas used:            3295874
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.03295874 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:          0.05100122 ETH


Summary
=======
> Total deployments:   6
> Final cost:          0.05338716 ETH

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Please make sure you've already installed ganache-cli, Truffle and enabled MetaMask extension in your browser.

```
Give examples (to be clarified)
```

### Installing

A step by step series of examples that tell you have to get a development env running

Clone this repository:

```
git clone https://github.com/udacity/nd1309/tree/master/course-5/project-6
```

Change directory to ```project-6``` folder and install all requisite npm packages (as listed in ```package.json```):

```
cd project-6
npm install
```

Launch Ganache:

```
ganache-cli -m "spirit supply whale amount human item harsh scare congress discover talent hamster"
```

Your terminal should look something like this:

![truffle test](images/ganache-cli.png)

In a separate terminal window, Compile smart contracts:

```
truffle compile
```

Your terminal should look something like this:

![truffle test](images/truffle_compile.png)

This will create the smart contract artifacts in folder ```build\contracts```.

Migrate smart contracts to the locally running blockchain, ganache-cli:

```
truffle migrate
```

Your terminal should look something like this:

![truffle test](images/truffle_migrate.png)

Test smart contracts:

```
truffle test
```

All 10 tests should pass.

![truffle test](images/truffle_test.png)

In a separate terminal window, launch the DApp:

```
npm run dev
```

## Built With

* [Ethereum](https://www.ethereum.org/) - Ethereum is a decentralized platform that runs smart contracts
* [IPFS](https://ipfs.io/) - IPFS is the Distributed Web | A peer-to-peer hypermedia protocol
to make the web faster, safer, and more open.
* [Truffle Framework](http://truffleframework.com/) - Truffle is the most popular development framework for Ethereum with a mission to make your life a whole lot easier.


## Authors

See also the list of [contributors](https://github.com/your/project/contributors.md) who participated in this project.

## Acknowledgments

* Solidity
* Ganache-cli
* Truffle
* IPFS
