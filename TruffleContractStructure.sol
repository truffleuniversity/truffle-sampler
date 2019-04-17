pragma solidity ^0.5.1;

// contract definition
contract ContractStructure {
    
    // state variables
    int public truffleTrayCount;
    string truffleTrayName;
    address truffleTrayOnwer;
    Truffle[] truffles;
    
    // enum definition
    enum Shape { Circle, Square, Diamond, Rectangle }
    
    // struct definition
    struct Truffle {
        string name;
        string description;
        uint weightInGrams;
        bool containsNuts;
        Shape shape;
    }
    
    // function modifier
    modifier ownsTruffle(){
        if (msg.sender == truffleTrayOnwer) {
            _;
        }
    }
    
    // constructor
    constructor(string memory _name) public {
        truffleTrayName = _name;
    }
    
    // event declaration
    event TruffleCreated(string);
    
    // function definition
    function createTruffle() ownsTruffle() payable external returns (bool) {
       
        Truffle memory truffle = Truffle({
           name: "",
           description: "",
           weightInGrams: 15,
           containsNuts: false,
           shape: Shape.Circle
        });
        
        truffles.push(truffle);
       
        emit TruffleCreated(truffle.name);
       
        return true;
    }
    
}