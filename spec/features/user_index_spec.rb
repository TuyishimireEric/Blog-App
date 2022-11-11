require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Users Index', type: :request do
  subject { page }

  before(:each) do
    User.create(name: 'John Doe', posts_counter: 5, id: 352, photo: 'https://i.imgur.com/1J3wZQx.jpg')
    User.create(name: 'Jane Doe', posts_counter: 2, id: 353, photo: 'https://i.imgur.com/1J3wZQx.jpg')
    User.create(name: 'John Smith', posts_counter: 9, id: 354, photo: 'https://i.imgur.com/1J3wZQx.jpg')
    User.create(name: 'Jane Smith', posts_counter: 4, id: 355, photo: 'https://i.imgur.com/1J3wZQx.jpg')
  end
  it 'assigns all users to @users' do
    get users_path
    expect(assigns(:users)).to eq(User.all)
  end
  it 'renders the name of the users' do
    get users_path
    expect(response.body).to include('John Doe', 'Jane Doe', 'John Smith', 'Jane Smith')
  end
  it 'shows number of posts of user' do
    get users_path
    expect(response.body).to include('Number of posts: 5')
  end
  it 'renders the profile picture of the users' do
    get users_path
    expect(response.body).to
    include('/assets/icon-c651a4f23e11b63bbbeb45a4ddb3d3a52ec3cc1f40969a503c8f86f0b3ee1962.jpg')
  end
end
