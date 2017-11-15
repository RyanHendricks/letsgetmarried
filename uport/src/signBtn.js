import { web3, uport } from './uportSetup.js'
import { waitForMined, pollingLoop } from './contractHandeling.js'
import { getCurrentDataFromChain } from './utilities.js'

import { MyContractSetup } from './contractSetup.js'
const MyContract = MyContractSetup()

window.signBtn = () => { 
    // Transaction signing (that will fire a QR to scan or card in the mobile app)
    MyContract.updateShares('10', (error, txHash) => {
      if (error) { throw error }
        waitForMined(txHash, { blockNumber: null }, // see next area
        function pendingCB () {
          // Signal to the user you're still waiting
          // for a block confirmation
          document.querySelectorAll('.signMessage')[0].style.display = 'block';
        },
        function successCB (data) {
          // Great Success!
          // Likely you'll call some eventPublisherMethod(txHash, data)
          document.querySelectorAll('.signComplete')[0].style.display = 'block';
          getCurrentDataFromChain(window.loggedInUser.rinkebyID)
          document.querySelectorAll('.updated')[0].style.display = 'inlin{e';
        }
      )
    })
    
    document.querySelectorAll('.signMessage')[0].style.display = 'block'; 
}