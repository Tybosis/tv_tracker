require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test 'send contact message' do
    email = ContactMailer.create('FakeUser', 'fake@example.com', 'This website sucks!').deliver_now
    ActionMailer::Base.deliveries.wont_be_empty
    email.must_deliver_to("tyler.pottle@gmail.com")
    email.must_have_body_text(/This website sucks!/)
  end
end
