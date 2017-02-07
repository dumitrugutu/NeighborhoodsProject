require 'rails_helper'

describe EventsController do
  let(:group) { Group.create!(name: 'Greater Southwest Development Corporation', website: 'www.greatersouthwest.org', contact_info: '(773)436-1000', address: '2601 W. 63rd St.') }

  let(:group_rep) { GroupRep.create!(group_id: group.id, admin: true, name: "Bob A", email: "bob@yahoo.com", password: "kaboom") }

  let(:valid_event_params) { {group_rep_id: group_rep.id, name: "Test Uptown Rep Event", organizer_contact_info: group_rep.email, event_time: Faker::Time.forward(28, :morning), is_free: true, location: "6700 S. Kedzie Ave."} }

  let(:invalid_event_params) { {group_rep_id: group_rep.id, organizer_contact_info: group_rep.email, event_time: Faker::Time.forward(28, :morning), is_free: true, location: "6700 S. Kedzie Ave."} }

  let(:event) { Event.new }

  context '#index' do
    it 'renders the :index view' do
      get :index, params: { group_rep_id: group_rep.id }   # hardcode id value for now
      expect(response).to render_template(:index)
    end
  end

  context '#show' do
    it 'calls the model method that finds the specified event' do
      expect(Event).to receive(:find).and_return(event)

      get :show, params: { group_rep_id: group_rep.id, id: 1 }   # hardcode for now
    end

    it 'renders the :show view' do
      allow(Event).to receive(:find)

      get :show, params: { group_rep_id: group_rep.id, id: 1 }   # hardcode for now
      expect(response).to render_template :show
    end
  end

  context '#new' do
    it 'renders the :new view' do
      get :new, params: { group_rep_id: group_rep.id }  # hardcode for now
      expect(response).to render_template :new
    end
  end

  context '#create' do
    context 'given valid params' do
      it 'creates an event' do
        expect(event).to receive(:save).and_return(true)
        post :create, params: { group_rep_id: group.id, event: valid_event_params }
        event.save
      end

      it 'redirects to the "show" action for the new event' do
        post :create, params: { group_rep_id: group.id, event: valid_event_params }
        expect(response).to redirect_to group_rep_events_path
      end

      it 'gives the user a flash notice upon successful creation' do
        post :create, params: { group_rep_id: group.id, event: valid_event_params }
        expect(flash[:notice]).to be_present
      end
    end

    context 'given invalid params' do
      it 'does not create the event' do
        expect(event).to receive(:save).and_return(false)
        post :create, params: { group_rep_id: group.id, event: invalid_event_params }
        event.save
      end

      it 're-renders the "new" view' do
        post :create, params: { group_rep_id: group.id, event: invalid_event_params }
        expect(response).to render_template :new
      end
    end
  end

  context '#edit' do
    it 'calls the model method that finds the specified event' do
      allow(Event).to receive(:find).and_return(true)
      get :edit, params: { group_rep_id: group_rep.id, id: 1 }  # hardcode for now
    end

    it 'renders the :edit view' do
      allow(Event).to receive(:find)
      get :edit, params: { group_rep_id: group_rep.id, id: 1 }  # hardcode for now
      expect(response).to render_template :edit
    end
  end

  context '#update' do
    it 'calls the model method to find the specified event' do
      allow(Event).to receive(:find).and_return(event)
      expect(event).to receive(:update!)
      put :update, params: { group_rep_id: group_rep.id, id: 1, event: valid_event_params }   # hardcode for now
    end

    it 'updates the event attributes' do
      event = Event.create(valid_event_params)
      allow(Event).to receive(:find).and_return(event)
      expect(event).to receive(:update!)
      event.name = "Test"
      expect(event.name).to eq("Test")
      put :update, params: { group_rep_id: group_rep.id, id: event.id, event: valid_event_params }   # hardcode for now
    end

    it 'gives the user a flash notice upon successful update' do
      allow(Event).to receive(:find).and_return(event)
      allow(event).to receive(:update!)

      put :update, params: { group_rep_id: group_rep.id, id: 1, event: valid_event_params }   # hardcode for now
      expect(flash[:notice]).to be_present
    end

    it 'redirects to the events show' do
      allow(Event).to receive(:find).and_return(event)
      allow(event).to receive(:update!)

      put :update, params: { group_rep_id: group_rep.id, id: 1, event: valid_event_params }  # hardcode for now
      expect(response).to redirect_to group_rep_event_path
    end
  end

  context '#destroy' do
    it 'calls the model method to find the specified event' do
      event = Event.create(valid_event_params)
      allow(Event).to receive(:find).and_return(event)
      expect(event).to receive(:destroy)

      delete :destroy, params: { group_rep_id: group_rep.id, id: event.id }  # hardcode for now
    end

    it 'it deletes the event' do
      event = Event.create(valid_event_params)
      allow(Event).to receive(:find).and_return(event)
      expect { delete :destroy, params: { group_rep_id: group_rep.id, id: event.id }}.to change { Event.count }.from(1).to(0)
    end

    it 'gives the user a flash notice that the event was successfully deleted' do
      allow(Event).to receive(:find).and_return(event)
      allow(event).to receive(:destroy)

      delete :destroy, params: { group_rep_id: group_rep.id, id: 1 }  # hardcode for now
      expect(flash[:notice]).to be_present
    end

    it 'redirects to the events index' do
      allow(Event).to receive(:find).and_return(event)
      allow(event).to receive(:destroy)

      delete :destroy, params: { group_rep_id: group_rep.id, id: 1 }   # hardcode for now
      expect(response).to redirect_to group_rep_events_path
    end
  end
end
