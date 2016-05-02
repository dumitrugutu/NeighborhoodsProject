require 'rails_helper'

describe NeighborhoodsController do
  describe '#index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
  
  describe '#search' do
    it 'renders the show template' do
      get :search
      expect(response).to render_template('show')
    end
  end
  
  describe '#show' do
    it 'renders the show template' do
      get :show, {:id => '1'}
      expect(response).to render_template('show')
    end
  end
end