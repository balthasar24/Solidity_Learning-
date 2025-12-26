// SPDX-License-Identifier: MIT

pragma solidity ^0.8.31;

contract Twitter {

    uint16 public MaxTweetAllowed = 280;

    struct Tweet{
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping(address => Tweet[]) public tweets;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "YOU ARE NOT THE OWNER");
        _;
    }

    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        MaxTweetAllowed = newTweetLength;
    }

    function createTweet(string memory a) public {
        require(bytes(a).length <= MaxTweetAllowed, "Tweet is too long bro!");

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: a,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function likeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");
        
        tweets[author][id].likes++;
    }

    function unlikeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");
        require(tweets[author][id].likes > 0, "TWEET HAS NO LIKE");
        tweets[author][id].likes--;
    }

    function getTweet(uint i) public view returns (Tweet memory) {
        return tweets[msg.sender][i];
    }

    function getAllTweet(address a) public view returns (Tweet[] memory) {
        return tweets[a];
    }
}