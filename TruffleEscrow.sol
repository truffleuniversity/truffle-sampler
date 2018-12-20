pragma solidity ^0.5.1;

contract TruffleEscrow {
	address public arbiter;
	address payable public beneficiary;
	address public depositor;

	event Approved(uint);

	constructor(address _arbiter, address payable _beneficiary) payable public {
		arbiter = _arbiter;
		beneficiary = _beneficiary;
		depositor = msg.sender;
	}

	function approve() public {
		require(msg.sender == arbiter);
		beneficiary.transfer(address(this).balance);
		emit Approved(address(this).balance);
	}
}