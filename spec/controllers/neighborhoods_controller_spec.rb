require 'rails_helper'

describe NeighborhoodsController do
  describe '#new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe '#index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe '#search' do
    before do
      Neighborhood.create(name: "Uptown")
      Neighborhood.create(name: "Humbold Park")
      Neighborhood.create(name: "Rogers Park")
      Neighborhood.create(name: "Lincold Park")
    end
    context 'when given accurate name' do
      it 'renders the show template' do
        get :search, params: { query: "Uptown" }
        expect(response).to render_template('show')
      end
    end
    context 'when given inaccurate name' do
      it 'renders the multiple template' do
        get :search, params: { query: "Park" }
        expect(response).to render_template('multiple')
      end
    end
    context 'when given wrong name' do
      it 'renders the error template' do
        get :search, params: { query: "Test" }
        expect(response).to render_template('error')
      end
    end
  end

  describe '#show' do
    it 'renders the show template' do
      neighborhood = Neighborhood.create(name: "Uptown")
      get :show, params: { id: neighborhood.id  }
      expect(response).to render_template('show')
    end
  end

  describe '#show_all' do
    it 'renders the showall template' do
      get :show_all
      expect(response).to render_template('showall')
    end
    it 'shows all the neighborhoods' do
      n1 = Neighborhood.create(name: "Rogers Park")
      n2 = Neighborhood.create(name: "Lincold Park")
      get :show_all
      expect(Neighborhood.all).to contain_exactly(n1,n2)
    end
  end
end
