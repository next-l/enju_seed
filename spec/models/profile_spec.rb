require 'rails_helper'

describe Profile do
  #pending "add some examples to (or delete) #{__FILE__}"
  fixtures :all

  it 'should create a profile' do
    FactoryBot.create(:profile)
  end

  it 'should destroy a profile' do
    profile = FactoryBot.create(:profile)
    profile.destroy.should be_truthy
  end

  it 'should not set expired_at if its user group does not have valid period' do
    profile = FactoryBot.create(:profile)
    profile.expired_at.should be_nil
  end

  it 'should set expired_at if its user group has valid period' do
    profile = FactoryBot.build(:profile)
    user_group = FactoryBot.create(:user_group, valid_period_for_new_user: 10)
    user_group.profiles << profile
    profile.user_group.valid_period_for_new_user.should eq 10
    profile.expired_at.should eq 10.days.from_now.end_of_day
  end

  it "should create profile" do
    profile = FactoryBot.create(:profile)
    assert !profile.new_record?, "#{profile.errors.full_messages.to_sentence}"
  end

  it "should create profile with empty user_number" do
    profile1 = FactoryBot.create(:profile, user_number: "")
    profile2 = FactoryBot.create(:profile, user_number: "")
    profile1.should be_valid
    profile2.should be_valid
  end

  if defined?(EnjuQuestion)
    it "should reset answer_feed_token" do
      profiles(:user1).reset_answer_feed_token
      profiles(:user1).answer_feed_token.should be_truthy
    end

    it "should delete answer_feed_token" do
      profiles(:user1).delete_answer_feed_token
      profiles(:user1).answer_feed_token.should be_nil
    end
  end

  if defined?(EnjuCirculation)
    it "should reset checkout_icalendar_token" do
      profiles(:user1).reset_checkout_icalendar_token
      profiles(:user1).checkout_icalendar_token.should be_truthy
    end

    it "should delete checkout_icalendar_token" do
      profiles(:user1).delete_checkout_icalendar_token
      profiles(:user1).checkout_icalendar_token.should be_nil
    end
  end

  if defined?(EnjuCirculation)
    it "should send_message" do
      assert profiles(:librarian1).user.send_message('reservation_expired_for_patron', manifestations: profiles(:librarian1).user.reserves.not_sent_expiration_notice_to_patron.collect(&:manifestation))
      profiles(:librarian1).reload
      profiles(:librarian1).user.reserves.not_sent_expiration_notice_to_patron.should be_empty
    end
  end
end

# == Schema Information
#
# Table name: profiles
#
#  id                      :bigint           not null, primary key
#  locale                  :string
#  user_number             :string
#  full_name               :text
#  note                    :text
#  keyword_list            :text
#  required_role_id        :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  expired_at              :datetime
#  full_name_transcription :text
#  date_of_birth           :date
#  full_name_translations  :jsonb            not null
#  user_group_id           :bigint
#  library_id              :bigint
#  zip_code                :string
#  address                 :string
#
