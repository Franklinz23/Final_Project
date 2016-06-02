class Student < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :family
end
