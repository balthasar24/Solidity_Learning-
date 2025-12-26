// SPDX-License-Identifier: MIT

pragma solidity ^0.8.31;

contract Twitter {

    mapping(address => string[]) public tweets;

    function createTweet(string memory a) public {
        tweets[msg.sender].push(a);
    }

    function getTweet(address a, uint i) public view returns (string memory) {
        return tweets[a][i];
    }

    function getAllTweet(address a) public view returns (string[] memory) {
        return tweets[a];
    }
}