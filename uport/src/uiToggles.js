function togglePostLoggedInUI () {
  document.querySelectorAll('.signBtn')[0].style.display = 'block'
  document.querySelectorAll('.loginBtn')[0].style.display = 'none'
  document.querySelector('#kqr').style.display = 'none'
}

function toggleExistingDataLoad (data) {
  document.querySelectorAll('.currentShares')[0].textContent = data
  document.querySelectorAll('.sharesArea')[0].style.display = 'block'
}

export { togglePostLoggedInUI, toggleExistingDataLoad }