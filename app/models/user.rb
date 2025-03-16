class User < ApplicationRecord
    has_secure_password
    has_many :sent_messages, class_name: 'Message', foreign_key: 'user_sender_id'
    has_many :received_messages, class_name: 'Message', foreign_key: 'user_receiver_id'
    has_many :messages, foreign_key: 'user_receiver_id'
end
