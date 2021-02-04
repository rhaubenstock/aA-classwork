const APIUtil = require('./api_util');

class TweetCompose{
  constructor(){
    this.$form = $('form.tweet-compose');
    this.$form.on("submit", e => this.submit(e));
  }
  submit(e){
    e.preventDefault();
    // want to pass in {content: , mentioned_user_ids: }
    //request => get back json -> json.content, json.m
    APIUtil.createTweet();
  }
}

module.exports = TweetCompose;