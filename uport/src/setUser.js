import { Connect, SimpleSigner, MNID } from 'uport-connect'

function setUser (credentials) {

  window.loggedInUser = credentials
  
  // uPort addresses are a hash of all
  // its different network identities

  // We must grab the explicit address 
  // of the ID to match the network the contract is on!
  
  const decodedId = MNID.decode(window.loggedInUser.address)
  window.loggedInUser.rinkebyID = decodedId.address
  
  console.log(window.loggedInUser)
  
  // The networks are identified as such
  // Mainnet (network: 0x1)
  // Ropsten (network: 0x3)
  // Rinkeby (network: 0x4)
  // Kovan   (network: 0x42)
  
  console.log("uPort master address: " + window.loggedInUser.address)
  console.log("uPort Rinkeby address: " + window.loggedInUser.rinkebyID)
}

export { setUser }