pragma solidity ^0.4.16;


contract MarriageLicense {

    struct Credential {
        string name;
        string phone;
        address country;
        bytes32 avatar;
        address identity;
        bytes32 signature;
        uint256 timeStamp;
        bool signed;
    }



   // mapping (bytes32 => Credential) public credentials;
  //  mapping (bytes32 => Signer) public signs;

    
   /** struct RequiredSignatures {
        Signer[] signatures;
       
        uint256[] timeStamps;
        uint256[] spouses;
        uint256[] witnesses;
    }*/
     mapping (bytes32 => Credential) public credentials;
   // mapping (bytes32 => RequiredSignatures) public officialmarriages;
    
    function MarriageLicense() public {
        return;
    }

    function addSpouse (address _spouse) public returns (bool success) {
        Credential memory spouse;
        spouse[_spouse].name = _spouse.name;
        spouse[_spouse].phone = _spouse.phone;
        spouse[_spouse].country = _spouse.country;
        spouse[_spouse].avatar = _spouse.avatar;
        spouse[_spouse].identity = _spouse.identity;
        uint _timeStamp = block.number;

        spouse[_spouse].signature == keccak256(spouse.identity);
        spouse[_spouse].timeStamp == _timeStamp;
        spouse[_spouse].signed == true;
        
        credentials.push(spouse);
    }
}


pragma solidity ^0.4.16;


contract MarriageLicense {

    struct Credential {
        string name;
        string phone;
        address country;
        bytes32 avatar;
        address identity;
    }

    struct Signer {
        Credential identity;
        bytes32 signature;
        uint256 timeStamp;
        bool signed;
    }

    mapping (address => Credential[]) public credentials;
    mapping (bytes32 => Signer[]) public signers;

    Signer[] public signerindex;
    Credential[] public credentialindex;
    

    function addSpouse (Credential _spouse) public returns (bool success) {
        Credential memory spouse;
        spouse.name = _spouse.name;
        spouse.phone = _spouse.phone;
        spouse.country = _spouse.country;
        spouse.avatar = _spouse.avatar;
        spouse.identity = _spouse.identity;

        Credential.push(spouse);
        credentialindex[spouse].identity = Credential.push(spouse);
    }
}
    struct License {
        Credential[] spouses;
        Credential[] witnesses;

    }

    Credentials[] public credentials;



    
    struct 
        string public firstName;
        string public middleName;
        string public lastName;
        address public ethAddress;
        uint public spouseID;

        function setSpouseInfo (
            int _spouseID,
            string _firstName,
            string _middleName,
            string _lastName,
            address _ethAddress
        ) public payable
        {
            Spouses[_recID].spouseID = _SpouseID;
            Spouses[_recID].firstName = _studySubject;
            Spouses[_recID].initials = _initials;
            Spouses[_recID].birthDate = _birthDate;
            Spouses[_recID].gender = _gender;
            Spouses[_recID].studyID = _studyID;
        }
            

        function setSubjectInfo (
        int _recID,
        address _studySubject,
        string _initials,
        Date _birthDate,
        int _gender,
        int _studyID
    ) public payable
    {
        Spouses[_recID].recID = _recID;
        Spouses[_recID].studySubject = _studySubject;
        Spouses[_recID].initials = _initials;
        Spouses[_recID].birthDate = _birthDate;
        Spouses[_recID].gender = _gender;
        Spouses[_recID].studyID = _studyID;
}





contract Witness

    string public name
    string public ethAddress




contract SpouseFactory {
    

    
    
    function create() public returns(address ethAddress) {
        return address(new Spouse());
    }

    mapping (int => Spouse) spouseRegistry;

    function getSubjectInfo (int recID) public constant returns (
        address _studySubject,
        string _initials,
        Date _birthDate,
        int _gender,
        int _studyID
        ){
            _studySubject = Spouses[recID].studySubject;
            _initials = Spouses[recID].initials;
            _birthDate = Spouses[recID].birthDate;
            _gender = Spouses[recID].gender;
            _studyID = Spouses[recID].studyID;
    }

    function setSubjectInfo (
        int _recID,
        address _studySubject,
        string _initials,
        Date _birthDate,
        int _gender,
        int _studyID
    ) public payable
    {
        Spouses[_recID].recID = _recID;
        Spouses[_recID].studySubject = _studySubject;
        Spouses[_recID].initials = _initials;
        Spouses[_recID].birthDate = _birthDate;
        Spouses[_recID].gender = _gender;
        Spouses[_recID].studyID = _studyID;
}
