pragma solidity ^0.5.1;

contract TruffleCrud {

    struct Truffle {
        uint id;
        string name;
    }
    
    Truffle[] public truffles;
    uint public nextId = 1; 
    
    function create(string memory _name) public {
        truffles.push(Truffle(nextId, _name));
        nextId++;
    }
    
    function read(uint id) public view returns (uint, string memory) {
        
        for (uint i = 0; i <= truffles.length; i++) {
            if (truffles[i].id == id) {
                return (truffles[i].id, truffles[i].name); 
            }
        }
    }
    
    function update(uint id, string memory name) public {
        uint i = find(id);
        truffles[i].name = name;
    }
    
    // costs more gas than the above...
    function updateTwo(uint id, string memory name) public {
        for (uint i = 0; i < truffles.length; i++) {
            if (truffles[i].id == id) {
                truffles[i].name = name;
            }
        }
    }
    
    function destroy(uint id) public {
        uint i = find(id);
        delete truffles[i];
    }
    
    function find(uint id) view internal returns(uint) {
        for (uint i = 0; i < truffles.length; i++) {
            if (truffles[i].id == id) {
                return i;
            }
        }
    }
}