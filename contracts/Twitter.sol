// SPDX-License-Identifier: MIT

pragma solidity ^0.8.31;

contract Twitter {

    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;

    function createTweet(string memory a) public {
        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: a,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function getTweet(address a, uint i) public view returns (Tweet memory) {
        return tweets[a][i];
    }

    function getAllTweet(address a) public view returns (Tweet[] memory) {
        return tweets[a];
    }
}