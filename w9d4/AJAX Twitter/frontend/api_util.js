const APIUtil = {
    followUser: id => {
        return $.ajax({
            url: `/users/${id}/follow`,
            type: "POST",
            dataType: 'json'
        })
    },
    unfollowUser: id => {
        return $.ajax({
            url: `/users/${id}/follow`,
            type: "DELETE",
            dataType: 'json'
        })
    },
    searchUsers: queryVal => {
        return $.ajax({
            url: "/users/search",
            dataType: 'json',
            data: {query: queryVal}
        })
    },
    createTweet: data => {
        return $.ajax({
            url: "/tweets",
            dataType: 'json',
            type: 'POST',
            data: {tweet: data}
        })
    }
};

module.exports = APIUtil;



