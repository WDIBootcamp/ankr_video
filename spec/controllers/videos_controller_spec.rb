require 'spec_helper'

describe VideosController do 

	describe "GET index" do
		before(:each) do
			@videos = mock_model("Video")
			allow(Video).to receive(:all).and_return(@videos)

		end
		it "should assign @videos to all videos" do
			get :index
			expect(assigns(:video)).to eq(@videos)


		end

	end

	describe "GET new" do
		before(:each) do
			@video = mock_model("Video")
			allow(Video).to receive(:new).and_return(@video)

		end

		it "should assign @video" do
			get :new
			expect(assigns(:video)).to eq(@video)
			
		end

	end

	describe "POST upload" do
		before(:each) do
			@video = mock_model("Video")
			allow(Video).to receive(:create).and_return(@video)

		end

		it "should create a video" do
			expect(Video).to receive(:create).with({"title" => "Whatever the title is."})
			post :upload, {video: {title: "Whatever the title is."}}

		end

	end
	
end