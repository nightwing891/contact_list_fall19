class Contact < ApplicationRecord
  # Data contraints 
    # Associations 
      # belongs_to
      # has_many
      # has_one
      # has_many :through
      # has_one :through
      # dependent
    has_many :notes, dependent: :destroy
    has_one :address, dependent: :destroy
    # has_one :note

    # Validations
      confirmations
        two fields that should receive exactly the same content

      inclusion
        validate the attr included in a given set
        
        class Coffee < ActiveRecord::Base
          validates :size, inclusion: { 
            in: %w(small medium large),
              message: "%{value} is not a valid size" 
          }
        end

      length
        the length of the attr value

        class User < ActiveRecord::Base
          validates :name, length: { minimum: 2 }
          validates :bio, length: { maximum: 500 }
          validates :password, length: { in: 6..20 }
          validates :registration_number, length: { is: 6 }
        end 

      numericality
        only accepts numbers
       
        class Player < ActiveRecord::Base
          validates :points, numericality: true
          validates :games_played, numericality: { only_integer: true }
          validates :golf_handicap, numericality: { less_than_or_equal_to: 40.4, greater_than_or_equal_to: 2 }
        end

      presence
        to make sure the attr not empty 

        validates :first_name, :last_name, presence: true

      uniqueness
        one verison is allowed, unique

        validates :email, uniqueness: true

      Options 
        allow_nil
          skip the validation when attr nil
          class Coffee < ActiveRecord::Base
            validates :size, inclusion: { in: %w(small medium large),
            message: "%{value} is not a valid size" }, allow_nil: true
          end
        allow_blank
          skip the validation when attr blank

          class Topic < ActiveRecord::Base
            validates :title, length: { is: 5 }, allow_blank: true
          end

        message
          display message when there is an error
        on
          when it should happen

            validates :email, uniqueness: true, on: :create
            validates :age, numericality: true, on: :update
            validates :name, presence: true, on: :save

    # callbacks - trigger logic at certain events 
      before_validations
      after_validations
      before_save
      after_save
      before_create
      after_create

      class CreditCard < ActiveRecord::Base
        before_save :encrypt_card_number
       
        private
       
          def encrypt_card_number
            self.card_number = bcrypt(self.card_number)
          end
      end

    # Attribute Serialization
    class CreatePeople < ActiveRecord::Migration
      def change
        create_table :people do |t|
          t.belongs_to :account
          t.text :hobbies
        end
      end
    end

    class Person < ActiveRecord::Base
      belongs_to :account
      serialize :hobbies, Array
    end

    # Class Methods - self has to do with all of the contacts

    def self.by_name
      order(:first_name)
    end

    # Instance Methods - a particular contact, records 

    def full_name
      "#{self.first_name} #{self.last_name}"
    end
end
