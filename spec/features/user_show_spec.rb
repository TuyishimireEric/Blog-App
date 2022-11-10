require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Users Show', type: :request do
  subject { page }

  before(:each) do
    User.create(name: 'John Doe', posts_counter: 5, id: 352, photo: '/assets/icon-c651a4f23e11b63bbbeb45a4ddb3d3a52ec3cc1f40969a503c8f86f0b3ee1962.jpg',
                bio: 'I am John Doe')
    Post.create(title: 'title1', text: 'text1', comments_counter: 0, likes_counter: 0, author_id: 352, id: 1)
    Post.create(title: 'title2', text: 'text2', comments_counter: 0, likes_counter: 0, author_id: 352, id: 2)
    Post.create(title: 'title3', text: 'text3', comments_counter: 0, likes_counter: 0, author_id: 352, id: 3)
    Post.create(title: 'title4', text: 'text4', comments_counter: 0, likes_counter: 0, author_id: 352, id: 4)
    Post.create(title: 'title5', text: 'text5', comments_counter: 0, likes_counter: 0, author_id: 352, id: 5)
  end
  it 'renders the name of the user' do
    get user_path(352)
    expect(response.body).to include('John Doe')
  end
  it 'renders the bio of the user' do
    get user_path(352)
    expect(response.body).to include('I am John Doe')
  end
  it 'renders the number of posts of the user' do
    get user_path(352)
    expect(response.body).to include('5')
  end
  it 'renders the profile picture of the user' do
    get user_path(352)
    expect(response.body).to include('/assets/icon-c651a4f23e11b63bbbeb45a4ddb3d3a52ec3cc1f40969a503c8f86f0b3ee1962.jpg')
  end
  it "renders the first 3 of title of the user's posts" do
    get user_path(352)
    expect(response.body).to include('text1', 'text2', 'text3')
  end
  it 'there is button to see all posts' do
    get user_path(352)
    expect(response.body).to include('See all posts')
  end
end