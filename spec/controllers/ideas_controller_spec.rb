require 'rails_helper'

RSpec.describe IdeasController, type: :controller do


############
# NEW
############
describe "#new" do
 it 'renders the new template' do
        get :new

        expect(response).to redirect_to(new_idea_path)
      end

it "creates a new article" do 
        
    get :new

    expect(assigns(:ideas_article)).to (be_a_new(Idea))
end 


end

############
# CREATE
############
describe "#create" do

context "without user signed in" do

    it "redirects to the sign in page" do
        get(:new)
        expect(response).to redirect_to(new_sessions_path)
    end 
end # end of withOUT User Signed In 

context "with user signed in" do

   
    def valid_request
            post(:create, params: { idea: FactoryBot.attributes_for(:idea) })   
    end
    context "with valid parameters" do
        it 'creates a new instance Idea in the db' do
        
            count_before = Idea.count
            valid_request
            count_after = Idea.count
            
            expect(count_after).to eq(count_before + 1)
        
          end
    
          it "redirects to the show page" do 
            valid_request
            idea = Idea.last
            expect(response).to(redirect_to(idea_path(idea)))
    
            
           end 
    
        end # end with valid parameters
        end # end of WITH user signed in
    end 
    





end
