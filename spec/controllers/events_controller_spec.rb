require 'rails_helper'

describe EventsController do
  describe '#index' do
    it 'renders the :index view' do
      get :index, params: { group_rep_id: 10 }   # hardcode id value for now
      expect(response).to render_template(:index)
    end
  end

  describe '#show' do
    it 'calls the model method that finds the specified event' do
      fake_event = double('event')
      expect(Event).to receive(:find).and_return(fake_event)

      get :show, params: { group_rep_id: 10, id: 1 }   # hardcode for now
    end

    it 'renders the :show view' do
      allow(Event).to receive(:find)

      get :show, params: { group_rep_id: 10, id: 1 }   # hardcode for now
      expect(response).to render_template :show
    end
  end

  describe '#new' do
    it 'renders the :new view' do
      get :new, params: { group_rep_id: 1 }  # hardcode for now
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    before do
      @event_params = FactoryGirl.attributes_for(:event)
      @event = instance_double('Event')
    end

    it 'calls the model method that creates an event in the database' do
      expect(Event).to receive(:create!).with(@event_params).and_return(@event)
      allow(@event).to receive(:name).and_return('good time')

      post :create, params: { group_rep_id: 1, event: @event_params }  # hardcode for now
    end

    it 'gives the user a flash notice upon successful creation' do
      allow(Event).to receive(:create!).with(@event_params).and_return(@event)
      allow(@event).to receive(:name).and_return('good time')

      post :create, params: { group_rep_id: 1, event: @event_params }  # hardcode for now
      expect(flash[:notice]).to be_present
    end

    it 'redirects to the events index' do
      allow(Event).to receive(:create!).with(@event_params).and_return(@event)
      allow(@event).to receive(:name).and_return('good time')

      post :create, params: { group_rep_id: 1, event: @event_params }   # hardcode for now
      expect(response).to redirect_to group_rep_events_path
    end
  end

  describe '#edit' do
    it 'calls the model method that finds the specified event' do
      expect(Event).to receive(:find)
      get :edit, params: { group_rep_id: 10, id: 1 }  # hardcode for now
    end

    it 'renders the :edit view' do
      allow(Event).to receive(:find)

      get :edit, params: { group_rep_id: 10, id: 1 }  # hardcode for now
      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    before do
      @event_params = FactoryGirl.attributes_for(:event)
      @event = instance_double('Event')
    end

    it 'calls the model method to find the specified event' do
      expect(Event).to receive(:find).and_return(@event)
      allow(@event).to receive(:update!)
      allow(@event).to receive(:name)

      put :update, params: { group_rep_id: 10, id: 1, event: @event_params }   # hardcode for now
    end

    it 'calls the model method to update the events attributes' do
      allow(Event).to receive(:find).and_return(@event)
      expect(@event).to receive(:update!)
      allow(@event).to receive(:name)

      put :update, params: { group_rep_id: 10, id: 1, event: @event_params }   # hardcode for now
    end

    it 'gives the user a flash notice upon successful update' do
      allow(Event).to receive(:find).and_return(@event)
      allow(@event).to receive(:update!)
      allow(@event).to receive(:name)

      put :update, params: { group_rep_id: 10, id: 1, event: @event_params }   # hardcode for now
      expect(flash[:notice]).to be_present
    end

    it 'redirects to the events show' do
      allow(Event).to receive(:find).and_return(@event)
      allow(@event).to receive(:update!)
      allow(@event).to receive(:name)

      put :update, params: { group_rep_id: 10, id: 1, event: @event_params }  # hardcode for now
      expect(response).to redirect_to group_rep_event_path
    end
  end

  describe '#destroy' do
    before do
      @event = instance_double('Event')
    end

    it 'calls the model method to find the specified event' do
      expect(Event).to receive(:find).and_return(@event)
      allow(@event).to receive(:destroy)
      allow(@event).to receive(:name)

      delete :destroy, params: { group_rep_id: 10, id: 1 }  # hardcode for now
    end

    it 'calls the model method to delete the event' do
      allow(Event).to receive(:find).and_return(@event)
      expect(@event).to receive(:destroy)
      allow(@event).to receive(:name)

      delete :destroy, params: { group_rep_id: 10, id: 1 }  # hardcode for now
    end

    it 'gives the user a flash notice that the event was successfully deleted' do
      allow(Event).to receive(:find).and_return(@event)
      allow(@event).to receive(:destroy)
      allow(@event).to receive(:name)

      delete :destroy, params: { group_rep_id: 10, id: 1 }  # hardcode for now
      expect(flash[:notice]).to be_present
    end

    it 'redirects to the events index' do
      allow(Event).to receive(:find).and_return(@event)
      allow(@event).to receive(:destroy)
      allow(@event).to receive(:name)

      delete :destroy, params: { group_rep_id: 10, id: 1 }   # hardcode for now
      expect(response).to redirect_to group_rep_events_path
    end
  end
end
