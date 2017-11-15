import { uport } from './uportSetup.js'

// We are setting ourselves to receive the attestation
// via window.attestationReceiver

window.attestationBtn = () => {
  if(window.attestationReceiver){
    uport.attestCredentials({
      sub: window.attestationReceiver,
      claim: { "Docs Demo": "Unlocked Achievement" },
      exp: new Date().getTime() + 30 * 24 * 60 * 60 * 1000
    })
    document.querySelectorAll('.attestMessage')[0].style.display = 'block'; 
  }
}