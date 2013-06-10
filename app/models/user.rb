# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_name    :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :account_name, :password, :password_confirmation, :options
  has_secure_password

  has_one :google_account
  has_one :drop_box_account
  has_one :setting
  has_many :resources, order: 'id DESC'
  has_many :maps, order: 'id DESC'

  serialize :options, Hash

  before_save do |user|
    user.email = user.email.downcase
    user.account_name = user.account_name.downcase
  end

  before_save :create_remember_token
  before_create :default_values

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  VALID_ACCOUNT_NAME_REGEX = /\A[a-z]+\w*\z/i
  validates :account_name, presence: true,
                    length: { minimum: 5, maximum: 20 },
                    format: { with: VALID_ACCOUNT_NAME_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }, confirmation: true, if: :password_digest_changed?

  def has_google_account?
    !google_account.nil? and !google_account.folder_id.nil?
  end

  def has_drop_box_account?
    !drop_box_account.nil? and !drop_box_account.session_token.nil?
  end

  def to_param
    self.account_name
  end

  def request_key
    Digest::MD5.hexdigest(self.email + self.account_name + self.confirmed.to_s + self.password_digest + self.created_at.iso8601)
  end

  def total_resources_count
    Resource.where( user_id: self.id ).count
  end

  # Returns a number between 0-100 to define user's progress
  def calculate_progress
    completed = 0

    # Check confirm_email
    if self.confirmed?
      completed += TASKS[:confirm_email][:weight]
      self.options[:confirm_email] = :complete
    end

    # Check cloud_storage
    if self.has_google_account? or self.has_drop_box_account?
      completed += TASKS[:cloud_storage][:weight]
      self.options[:cloud_storage] = :complete
    end

    # Check create_map
    if Map.find_by_user_id(self.id).present?
      completed += TASKS[:create_map][:weight]
      self.options[:create_map] = :complete
    end

    self.save
  end

  # Returns the next task the user needs to complete
  def show_progress
    progress = {}
    tasks = {}
    completed = 0
    total = 0

    TASKS.reverse_each do |key, value|
      # Find next_task
      unless self.options[key] == :complete or self.options[key] == :ignored
        progress[:next_task] = key
      end

      # Add tasks to task list with status
      if self.options.has_key?(key)
        tasks[key] = self.options[key]
      else
        tasks[key] = :incomplete
      end

      # Calculate progress
      completed += TASKS[key][:weight] if self.options[key] == :complete
      total += value[:weight]
    end

    progress[:status] = 100 * completed / total
    progress[:tasks] = tasks

    return progress
  end

  # Shows all tasks with user's current progress towards each
  def show_tasks
    result = {}
    TASKS.each do |key, value|
      result[key] = value
      if self.options.has_key?(key)
        result[key][:status] = self.options[key]
      else
        result[key][:status] = :incomplete
      end
    end

    return result
  end

  private

  def default_values
    self.setting = Setting.new
  end

  def create_remember_token
    self.remember_token ||= SecureRandom.urlsafe_base64
  end
end
