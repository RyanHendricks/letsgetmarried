pragma solidity ^0.4.16;



contract PatientHx {

    struct BasicInformation {
        bytes32 firstName;
        bytes32 middleName;
        bytes32 lastName;
        bytes32 gender;
        bytes32 birthDate;
        bytes32 language;
        bytes32 emailAddress;
        bytes32 phoneNumber;
    }

    struct AddressInformation {
        bytes32 permanentAddress;
        bytes32 aptNumber;
        bytes32 city;
        bytes32 state;
        uint32 zipCode;
    }
    

    mapping(address => mapping(address => bool)) spouseswitnesses;
    mapping(address => BasicInformation) basicInfo;
    mapping(address => AddressInformation) addressInfo;



    mapping(address => bool) spouses;
    mapping(address => bool) witnesses;

    modifier newPatient() {
        require(doctors[msg.sender] == false && patients[msg.sender] == false);
        _;
    }

    modifier onlyPatients() {
        require(doctors[msg.sender] == false && patients[msg.sender] == true);
        _;
    }

    modifier doctorOfPatient(address addr) {
        require(doctors[msg.sender] == true && patientDoctors[addr][msg.sender] == true);
        _;
    }

    modifier onlyDoctors() {
        require(doctors[msg.sender] == true && patients[msg.sender] == false);
        _;
    }

    modifier onlyAuthorizedUsers(address addr) { // Modifier
        require(msg.sender == addr || doctors[msg.sender] == true);
        _;
    }

    modifier onlyOwner(address addr) {
        require(msg.sender == addr);
        _;
    }

    function getFirstName(address addr)
        returns (bytes32 firstName) {
            return basicInfo[addr].firstName;
    }

    function getLastName(address addr)
        returns (bytes32 lastName) {
            return basicInfo[addr].lastName;
    }

    function getMiddleName(address addr)
        returns (bytes32 middleName) {
            return basicInfo[addr].middleName;    
    }

    function getGender(address addr)
        returns (bytes32 gender) {
            return basicInfo[addr].gender;    
    }

    function getLanguage(address addr)
        returns (bytes32 language) {
            return basicInfo[addr].language;    
    }

    function getBirthDate(address addr)
        returns (bytes32 birthDate) {
            return basicInfo[addr].birthDate;    
    }


    function getPermanentAddress(address addr) onlyAuthorizedUsers(addr)
        returns (bytes32 permanentAddress) {
            return addressInfo[addr].permanentAddress;    
    }

    function getAptNumber(address addr) onlyAuthorizedUsers(addr)
        returns (bytes32 aptNumber) {
            return addressInfo[addr].aptNumber;    
    }

    function getCity(address addr) onlyAuthorizedUsers(addr)
        returns (bytes32 city) {
            return addressInfo[addr].city;    
    }

    function getState(address addr) onlyAuthorizedUsers(addr)
        constant returns (bytes32 state) {
            return addressInfo[addr].state;    
    }

    function getZipCode(address addr) onlyAuthorizedUsers(addr)
        returns (uint32 zipCode) {
            return addressInfo[addr].zipCode;    
    }


    function createSpouse() newSpouse {
        spouses[msg.sender] = true;
    }

    function createBasicInfo(bytes32 firstName, bytes32 middleName, bytes32 lastName, bytes32 gender, bytes32 birthDate, bytes32 language, bytes32 maritalStatus, bytes32 emailAddress, bytes32 phoneNumber) onlyPatients {
        basicInfo[msg.sender] = BasicInformation(firstName, middleName, lastName, gender, birthDate, language, maritalStatus, emailAddress, phoneNumber);
    }

    function createAddressInfo(bytes32 permanentAddress, bytes32 aptNumber, bytes32 city, bytes32 state, uint32 zipCode) onlyPatients {
        addressInfo[msg.sender] = AddressInformation(permanentAddress, aptNumber, city, state, zipCode);
    }

}