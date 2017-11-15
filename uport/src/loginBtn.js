import { uport, MNID } from './uportSetup.js'
import kjua from 'kjua'
import { togglePostLoggedInUI, toggleExistingDataLoad } from './uiToggles.js'
import { setUser } from './setUser.js'
import { getCurrentDataFromChain } from './utilities.js'

import { MyContractSetup } from './contractSetup.js'
const MyContract = MyContractSetup()

// Simple button onclick handler
window.loginBtn = () => {
  
  // Only allow button click once
  document.querySelectorAll('.loginBtn')[0].disabled = true
  
  // uport based login with...
  // specific credential requests
  // notifcations
  // custom QR
  // Clickable as a link for mobile
  uport.requestCredentials(
    {
      requested: ['name', 'avatar', 'phone', 'country'],
      notifcations: true
    },
    (uri) => {
      
      const qr = kjua({
        text: uri,
        fill: '#0619ac',
        size: 300,
        back: 'rgba(255,255,255,1)'
      })

      // Create wrapping link for mobile touch
      let aTag = document.createElement('a')
      aTag.href = uri

      // Nest QR in <a> and inject
      aTag.appendChild(qr)
      document.querySelector('#kqr').appendChild(aTag)
      
    }).then((userProfile) => {
      setUser(userProfile)
      togglePostLoggedInUI()
      getCurrentDataFromChain(window.loggedInUser.rinkebyID)
  })

}