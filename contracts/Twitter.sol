// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Twitter {
    uint256 MAX_TWEET_LENGTH = 280;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not a owner!!");
        _;
    }

    function likeTweet(uint256 id, address author) external  {
        require(tweets[author][id].id == id,"Tweet does not exist!");
        tweets[author][id].likes++;
    }

    function unlikeTweet(uint256 id, address author) external  {
        require(tweets[author][id].id == id, "Tweet does not exist!");
        require(tweets[author][id].id > 0, "Tweet had no likes!");
        tweets[author][id].likes--;
    }

    function createTweet(string memory _tweet) public {
        require(
            bytes(_tweet).length <= MAX_TWEET_LENGTH,
            "Tweet is too long bro!!"
        );

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });
        tweets[msg.sender].push(newTweet);
    }

    function getTweet(uint256 _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }

    function changeTweetLength(uint256 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }
}
