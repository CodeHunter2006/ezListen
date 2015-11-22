class Article < ActiveRecord::Base
	mount_uploader :local_audio, AudioFileUploader
end
