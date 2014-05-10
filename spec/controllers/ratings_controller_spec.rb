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
end