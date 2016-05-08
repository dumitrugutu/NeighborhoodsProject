require 'rails_helper'

describe EventsController do
  describe '#index' do
    it 'renders the :index view' do
      get :index, :group_rep_id => '1'   # hardcode id value for now
      expect(response).to render_template :index
    end
  end
  
  describe '#show' do
    it 'calls the model method that finds the event' do
      fake_event = double('event')
      expect(Event).to receive(:find).and_return(fake_event)
      get :show, :group_rep_id => '1', :id => '1'   # hardcode for now
    end
    
    it 'renders the :show view' do
      allow(Event).to receive(:find)
      get :show, :group_rep_id => '1', :id => '1'   # hardcode for now
      expect(response).to render_template :show
    end
  end
  
  describe '#new' do
    it 'renders the :new view' do
      get :new, :group_rep_id => '1'   # hardcode for now
      expect(response).to render_template :new
    end
  end
end