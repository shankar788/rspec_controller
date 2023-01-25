require 'rails_helper'

RSpec.describe "Books", type: :request do
    describe 'GET /books' do
    
        it 'it return all' do
            get '/books'
            expect(response).to have_http_status(:success)
        end    

        it 'Checking all book is equal to Book.all' do
            get '/books'
            expect(assigns(:books_variable)).to eq(Book.all)
            # books_variable this is a varibale which we have defined in books_controllers index method
        end 
    end    

    describe 'POST /books' do
        
        it 'checking count of book' do 
            post '/books', params:{book: { name: 'goal'}}
            expect(JSON.parse(response.body)['name']).to eq('goal')
        end    
    end

    describe 'Delete /books/:id' do
        before(:each) do
            @book = create(:book)
        end
        it 'deleting perticuler book' do 
            delete "/books/#{@book.id}"
            expect(response).to have_http_status(200)
        end    
    end

end
