// SPDX-License-Identifier: MIT

pragma solidity 0.7.0;

contract Election {
    // Model a Candidate

    struct Candidate {
      uint id;
      string name;
      uint voteCount;
    }

    // Store Account that has voted
    mapping(address => bool) public votedornot;

    // Store Candidate
    // Fetch Candidate

    mapping(uint => Candidate) public candidates;

    uint public candidatesCount;

    // voted event
     event electionupdated(
       uint id,
       string name,
       uint votecount);

    constructor() {
      addCandidate("Donald Trump");
      addCandidate("Barack Obama");
    }

    function addCandidate(string memory name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, name, 0);
    }
    
    function Vote(uint _id) public {
        // the person has not Vote
        require(!votedornot[msg.sender], "You have voted for the participant");
        
        // Increase the vote count of the person
        
        candidates[_id].voteCount++;
        
        votedornot[msg.sender] = true;
        
        emit electionupdated(_id, candidates[_id].name, candidates[_id].voteCount);
        
    }
    
}
