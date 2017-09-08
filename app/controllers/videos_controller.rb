class VideosController < ApplicationController
	before_action :authenticate_user!, except: [:show]
	before_filter :require_permission
	before_action :find_video, only: [:show, :edit, :update, :destroy, :dashboard]

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

	def edit 
	end

	def update
		if @video.update video_params
			redirect_to video_path(@video, notice: "Video was succesfully updated!")
		else 
			render 'edit'
		end
	end

	def destroy
		@video.destroy
		redirect_to  root_path
	end

	def dashboard
	end

	private

	def find_video
		if params[:id].nil?
			@video = current_video
		else
			@video = Video.find(params[:id])
		end
	end

	def video_params
		params.require(:video).permit(:title,:description,:thumbnail)
	end

	def require_permission
		@video = Video.find(params[:user_id])
		if current_user != @user
			redirect_to root_path, notice: "Not your page"
		end
	end
end
