import { toggleExistingDataLoad } from './uiToggles.js'

import { MyContractSetup } from './contractSetup.js'
const MyContract = MyContractSetup()

function getCurrentDataFromChain (userID) {
  MyContract.getShares.call(userID, (error, response) => {
    if (error) { throw error }
    console.log(response.c)
    toggleExistingDataLoad(response.c)
  })  
}

export { getCurrentDataFromChain }