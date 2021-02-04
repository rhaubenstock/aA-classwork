const APIUtil = require("./api_util.js");

class FollowToggle{
    constructor(el, options){
        this.$el = $(el);
        this.userId = this.$el.data('user-id') || options.userId;
        this.followState = this.$el.data('initial-follow-state') || options.followState;
        this.render();
        this.$el.on("click", (e) => {
            this.handleClick(e);
        });
    }
    render(){
        if (this.followState === "following" || this.followState === "unfollowing"){
            this.$el.prop("disabled", true);
        } else {
            this.$el.prop("disabled", false);
            this.$el.text(this.followState === "unfollowed" ? "Follow!" : "Unfollow!");
        }
    }
    handleClick(e){
        e.preventDefault();
        if(this.followState === "followed"){
            this.followState = "unfollowing";
            this.render();
            APIUtil.unfollowUser(this.userId).then(()=>{
                this.followState = "unfollowed";
                this.render();
            });  
        }
        else{
            this.followState = "following";
            this.render();
            APIUtil.followUser(this.userId).then(() => {
                this.followState = "followed";
                this.render();
            });
            
        }
    }
}

module.exports = FollowToggle;