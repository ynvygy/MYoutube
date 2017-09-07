class VideosController < ApplicationController
	before_action :find_video, only: [:show]

	def new
		@video = @video.new
	end

	def create
		@video = @episode.new(video_params)
		if @video.save
			redirect_to video_path(@video)
		else
			render 'new'
		end
	end

	def index
		@videos = Video.all.order("created_at DESC")
	end
	
	def show
		@videos = Video.find(params[:id])
		#@videos = Video.where(user_id: @user).order("created_at DESC")
	end

	private

	def find_video
		@video = Video.find(params[:id])
	end

	def video_params
		params.require(:video).permit(:title,:description)
	end
end
