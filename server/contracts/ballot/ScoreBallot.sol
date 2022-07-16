// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;
import './Ballot.sol';
import '../Candidate.sol';

/*

Voters can vote for 1 or more candidates (even all).
Each vote is a score in a given range - set when the contract is created

*/

contract ScoreBallot is Ballot{

    mapping(Candidate=>uint)scores;
    uint scoreRange;
    
    constructor(uint _scoreRange){
        scoreRange = _scoreRange;
    }
    
    function vote(Candidate _candidate, uint score) public override{
        scores[_candidate] += score;
    }

    function getVoteCount(Candidate _candidate, uint weight)public override view returns(uint){
        weight = 1;
        return scores[_candidate];
    }
}