// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title SimpleVoting
 * @dev Implements a basic voting mechanism for on-chain governance.
 */
contract SimpleVoting {
    struct Proposal {
        string description;
        uint256 voteCountYes;
        uint256 voteCountNo;
        bool exists;
    }

    mapping(uint256 => Proposal) public proposals;
    mapping(uint256 => mapping(address => bool)) public hasVoted;
    uint256 public proposalCount;

    event ProposalCreated(uint256 id, string description);
    event VoteCast(address indexed voter, uint256 proposalId, bool support);

    /**
     * @dev Creates a new proposal to be voted on.
     * @param _description The text describing the proposal.
     */
    function createProposal(string memory _description) external {
        proposalCount++;
        proposals[proposalCount] = Proposal(_description, 0, 0, true);
        emit ProposalCreated(proposalCount, _description);
    }

    /**
     * @dev Casts a vote on a specific proposal.
     * @param _proposalId The ID of the proposal.
     * @param _support True for Yes, False for No.
     */
    function vote(uint256 _proposalId, bool _support) external {
        require(proposals[_proposalId].exists, "Proposal does not exist.");
        require(!hasVoted[_proposalId][msg.sender], "Address has already voted.");

        if (_support) {
            proposals[_proposalId].voteCountYes++;
        } else {
            proposals[_proposalId].voteCountNo++;
        }

        hasVoted[_proposalId][msg.sender] = true;
        emit VoteCast(msg.sender, _proposalId, _support);
    }

    /**
     * @dev Returns the current results of a proposal.
     */
    function getResults(uint256 _proposalId) external view returns (uint256 yes, uint256 no) {
        Proposal storage p = proposals[_proposalId];
        return (p.voteCountYes, p.voteCountNo);
    }
}
