uport.attestCredentials({
  sub: 'THE_RECEIVING_UPORT_ID',
  claim: { CUSTOM_PROPERTY: PROPERTY_VALUE },
  exp: new Date().getTime() + 30 * 24 * 60 * 60 * 1000,  // Optional expiration
})