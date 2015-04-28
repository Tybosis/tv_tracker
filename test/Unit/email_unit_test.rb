require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  test 'send contact message' do
    email = ContactMailer.contact_email('FakeUser', 'fake@example.com', 'This website sucks!').deliver_now
    ActionMailer::Base.deliveries.wont_be_empty
    email.must_deliver_to("tvtrackerapplication@gmail.com")
    email.must_have_body_text(/This website sucks!/)
  end
end
