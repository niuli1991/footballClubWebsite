class UploadController < ApplicationController
	before_action :authenticate_user!

	def image
		@picture = Picture.new
		@picture.image = params[:upload_file]
		@picture.user_id = current_user.id
		success = true
		msg = '上传成功'
		if @picture.save!
			success = true
			render json: {:success=> success, :msg=> msg, :file_path=> @picture.image.url}
		else
			success = false
			render json: {:success=> false}
		end
	end
end
