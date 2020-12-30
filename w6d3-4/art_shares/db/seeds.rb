# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([                 {username: 'joejoejoe'}, 
                                      {username: 'janejanejane'}, 
                                      {username: 'somecoolusername'}
                    ])
artworks = Artwork.create([           {artist_id: 1,title:'bananas', image_url:'bananans.com'},
                                      {artist_id: 2,title:'banana-split', image_url:'bananansplit.com'}, 
                                      {artist_id: 3,title:'banana', image_url:'banana.com'}
                          ])
artwork_shares = ArtworkShare.create([{artwork_id: 1, viewer_id: 2}, 
                                      {artwork_id: 1, viewer_id: 3}, 
                                      {artwork_id: 2, viewer_id: 3}, 
                                      {artwork_id: 3, viewer_id: 1}
                                    ])
comments = Comment.create ([          {author_id: 1, artwork_id: 1, body: "a"},
                                      {author_id: 1, artwork_id: 2, body: "b"},
                                      {author_id: 1, artwork_id: 2, body: "c"},
                                      {author_id: 1, artwork_id: 3, body: "d"},
                                      {author_id: 1, artwork_id: 2, body: "e"},
                                      {author_id: 2, artwork_id: 1, body: "f"},
                                      {author_id: 2, artwork_id: 3, body: "g"},
                                      {author_id: 3, artwork_id: 1, body: "h"}
                            ])
                                    