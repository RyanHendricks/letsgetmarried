pragma solidity ^0.4.16;


contract Subject {

    struct Date {
        uint mm;
        uint dd;
        uint yyyy;
    }

    struct StudySubject {
        int recID;
        address studySubject;
        string initials;
        Date birthDate;
        int gender;
        int studyID;
        
    }

    mapping (int => StudySubject) StudySubjects;

    function getSubjectInfo (int recID) public constant returns (
        address _studySubject,
        string _initials,
        Date _birthDate,
        int _gender,
        int _studyID
        ){
            _studySubject = StudySubjects[recID].studySubject;
            _initials = StudySubjects[recID].initials;
            _birthDate = StudySubjects[recID].birthDate;
            _gender = StudySubjects[recID].gender;
            _studyID = StudySubjects[recID].studyID;
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
        StudySubjects[_recID].recID = _recID;
        StudySubjects[_recID].studySubject = _studySubject;
        StudySubjects[_recID].initials = _initials;
        StudySubjects[_recID].birthDate = _birthDate;
        StudySubjects[_recID].gender = _gender;
        StudySubjects[_recID].studyID = _studyID;
        
    }


}