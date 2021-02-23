// Contracts/EmeraldProperties.sol
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;    

contract EmeraldProperties {

    string cutType; //Emerald cut type
    string shape; // Emerald shape
    string size; // Lenght, width and depth in mm
    string color; // Emerald color [Hue, Tone, saturation]
    string clarityGrade; // Emerald clarity grade
    //string notes; // Notes about the emerald  
    uint weight; // Emerald weight in grams
 
    constructor() {   }

    function SetColor(string memory _color) public
        {
        color = _color;
        }

    function SetSize(string memory _size) public
        {
        size = _size;
        }        
    
    function SetCutType(string memory _cutType) public {
        cutType = _cutType;
    }

    function SetShape(string memory _cutType) public {
        cutType = _cutType;
    }

    function SetClarityGrade(string memory _clarityGrade) public {
        clarityGrade = _clarityGrade;
    }

    // function SetNotes(string memory _notes) public {
    //     notes = _notes;
    // }

    function SetWeight(uint _weight) public {
        weight = _weight;
    }
    
    
}