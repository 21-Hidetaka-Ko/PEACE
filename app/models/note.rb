class Note < ActiveRecord::Base

  belongs_to :user
  validates :image, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
 


def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/user_images/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end


end