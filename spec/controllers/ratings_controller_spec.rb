require 'spec_helper'

describe RatingsController do

  let(:instance) { mock_model(ActsAsStarrable::Rating) }

  describe '#create' do

    context 'success' do

      before do
        expect(ActsAsStarrable::Rating).to receive(:new).and_return(instance)
        expect(instance).to receive(:save).and_return(true)
        post :create, :format => 'json', :rating => { :id => '1',
                                                      :stype => 'Flick',
                                                      :value => '2.5'}
      end

      it { should respond_with 201 }
    end

    context 'failure' do

      before do
        expect(ActsAsStarrable::Rating).to receive(:new).and_return(instance)
        expect(instance).to receive(:save).and_return(false)
        post :create, :format => 'json', :rating => { :id => '1',
                                                      :stype => 'Flick',
                                                      :value => '2.5'}
      end

      it { should respond_with 422 }
    end
  end

  describe '#update' do

    context 'success' do

      before do
        expect(ActsAsStarrable::Rating).to receive(:find)
          .with("#{instance.id}").and_return(instance)
        expect(instance).to receive(:update_attributes)
          .and_return(true)
        put :update, :format => :json, :id => instance, :rating =>
          { :id => '1',
            :stype => 'Flick',
            :value => '3.5'
          }
      end

      it { should respond_with 204 }
    end

    context 'failure' do

      before do
        expect(ActsAsStarrable::Rating).to receive(:find)
          .with("#{instance.id}").and_return(instance)
        expect(instance).to receive(:update_attributes)
          .and_return(false)
          put :update, :format => :json, :id => instance, :rating =>
            { :id => '1',
              :stype => 'Flick',
              :value => '3.5'
            }
      end

      it { should respond_with 422 }
    end
  end

  describe '#destroy' do

    before do
      expect(ActsAsStarrable::Rating).to receive(:find)
        .with("#{instance.id}").and_return(instance)
      expect(instance).to receive(:destroy).and_return(instance)
      delete :destroy, :format => 'json', :id => instance
    end

    it { should respond_with 204 }
  end
end