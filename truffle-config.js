require('babel-register');
require('babel-polyfill');
const HDWalletProvider = require("@truffle/hdwallet-provider");
const infuraRinkeby = "https://rinkeby.infura.io/v3/461fe2e08f10462fb1cd44dad2127063"
const infuraKovan = "https://kovan.infura.io/v3/461fe2e08f10462fb1cd44dad2127063"
const mnemonicPhrase = "spirit supply whale amount human item harsh scare congress discover talent hamster";


module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      // must be a thunk, otherwise truffle commands may hang in CI
      provider: () =>
        new HDWalletProvider({
          mnemonic: {
            phrase: mnemonicPhrase
          },
          providerOrUrl: infuraRinkeby,
          gas: 6721975,
          gasPrice: 10000000000,
          networkCheckTimeout: 10000000,
          confirmations: 2,    
          timeoutBlocks: 200,  
          skipDryRun: true            
        }),
      network_id: '4',
    },
    kovan: {
      // must be a thunk, otherwise truffle commands may hang in CI
      provider: () =>
        new HDWalletProvider({
          mnemonic: {
            phrase: mnemonicPhrase
          },
          providerOrUrl: infuraKovan,
          gas: 5500000,    
          confirmations: 2,
          timeoutBlocks: 200,
          skipDryRun: true, 
          shareNonce: true
        }),
      network_id: '42',
    }
  },
  contracts_directory: './src/contracts/',
  contracts_build_directory: './src/abis/',
  compilers: {
    solc: {
      version: "0.7.6",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        }
      }
    }
  }
}
