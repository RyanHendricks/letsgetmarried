import { web3, uport } from './uportSetup.js'
import kjua from 'kjua'

// Simple button onclick handler
window.loginBtn = () => {
  
  // Only allow button click once
  document.querySelectorAll('.loginBtn')[0].disabled = true;
  
  // uport based login with
  // specific credential requests
  // notifcations
  // custom QR
  // Clickable as a link for mobile
  uport.requestCredentials({
    requested: ['name', 'phone', 'country'],
    notifcations: true },
    (uri) => {
      
      const qr = kjua({
        text: uri,
        fill: '#0619ac',
        size: 400,
        back: 'rgba(255,255,255,1)'
      })

      // Create wrapping link for mobile touch
      let aTag = document.createElement('a')
      aTag.href = uri

      // Nest QR in <a> and inject
      aTag.appendChild(qr)
      document.querySelector('#kqr').appendChild(aTag)
    
      console.log(aTag)
    }).then((credentials) => {
    // Do something after they have disclosed credentials
    console.log({credentials})
    window.attestationReceiver = credentials.address
  })

}