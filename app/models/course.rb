class Course < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  #############  VALIDATIONS ##############
  validates :title, length: { minimum:10, maximum: 150,
            message:"Verifiez que le titre n'est pas trop long. la longueur du titre est limité 150 caracteres"}
    validates  :content, presence: { message: "Le nom est obligatoire" }
    validates :user_id, presence: { message: "Le createur est obligatoire" }
    validates :level_name, presence: { message: "Le niveau est obligatoire" }
    validates :material_name, presence: { message: "La matiere est obligatoire" }
    
    
  #############  SLUGGED ##############
  include ItemsSlugged

end
