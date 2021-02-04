const APIUtil = require("./api_util.js");
const FollowToggle = require("./follow_toggle.js");

class UsersSearch{
  constructor(ele){
    this.$el = $(ele);
    this.$input = this.$el.find('input');
    this.$ul = this.$el.find('ul.users');
    this.$input.on("input", (e) => {this.handleInput(e)});
  }

  handleInput(e){
    APIUtil.searchUsers(this.$input.val()).then(users => this.renderResults(users))
  }

  renderResults(users){
    this.$ul.empty();
    users.forEach(user => {
      const $li = $(`<li><a href="/users/${user.id}">${user.username}</a></li>`);
      const $button = $(`<button class="follow-toggle"></button>`);
      const options = { userId: user.id, followState : user.followed ? "followed" : "unfollowed"} ;
      new FollowToggle($button,options);
      $li.append($button);
      this.$ul.append($li);
    })
  }
}

module.exports = UsersSearch;