// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.0/governance/Governor.sol";
import "@openzeppelin/contracts@4.7.0/governance/extensions/GovernorSettings.sol";
import "@openzeppelin/contracts@4.7.0/governance/extensions/GovernorCountingSimple.sol";
import "@openzeppelin/contracts@4.7.0/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts@4.7.0/governance/extensions/GovernorVotesQuorumFraction.sol";

contract HeartDao is Governor, GovernorSettings, GovernorCountingSimple, GovernorVotes, GovernorVotesQuorumFraction {
    constructor(IVotes _token)
        Governor("Heart Dao")
        GovernorSettings(0 /* 0 block */, 45818 /* 1 week */, 1e18)
        GovernorVotes(_token)
        GovernorVotesQuorumFraction(1)
    {}

    // The following functions are overrides required by Solidity.

    function votingDelay()
        public
        view
        override(IGovernor, GovernorSettings)
        returns (uint256)
    {
        return super.votingDelay();
    }

    function votingPeriod()
        public
        view
        override(IGovernor, GovernorSettings)
        returns (uint256)
    {
        return super.votingPeriod();
    }

    function quorum(uint256 blockNumber)
        public
        view
        override(IGovernor, GovernorVotesQuorumFraction)
        returns (uint256)
    {
        return super.quorum(blockNumber);
    }

    function proposalThreshold()
        public
        view
        override(Governor, GovernorSettings)
        returns (uint256)
    {
        return super.proposalThreshold();
    }
}
