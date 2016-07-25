# encoding: utf-8
# frozen_string_literal: true
#
# TODO: Add documentation.
#
# == Schema Information
#
# Table name: service_offerings
#
#  id                :integer          not null, primary key
#  title             :string
#  description       :text
#  public_service_id :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  postal_address    :string
#  email             :string
#  phone             :string
#  url               :string
#  external          :boolean
#
# Indexes
#
#  index_service_offerings_on_public_service_id  (public_service_id)
#
# Foreign Keys
#
#  fk_rails_0e3762aded  (public_service_id => public_services.id)
#
class ServiceOffering < ApplicationRecord
  include Admin

  belongs_to :public_service

  validates :title, presence: true
end
