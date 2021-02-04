const FollowToggle = require("./follow_toggle.js");
const UsersSearch = require("./users_search.js");


$(() => {
  $("button.follow-toggle").each((_, button)=>{
    new FollowToggle(button);
  });
  $("nav.users-search").each((_, ele)=>{
    new UsersSearch(ele);
  });
});

