class Task < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }
    has_one_attached :image

    # オリジナル検証コード
    validate :validate_name_not_include_comma

    belongs_to :user

    private

    def validate_name_not_include_comma
        errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
    end

    def self.ransackable_attributes(auth_object = nil)
        %w(name created_at)
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end
