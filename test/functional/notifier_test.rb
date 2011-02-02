require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "email_friend" do
    article = articles(:welcome_to_rails)
    message = Notifier.email_friend(article, 'John Smith', "johnsayeau@gmail.com")


    assert_equal "Interesting Article", message.subject
    assert_equal ["johnsayeau@gmail.com"], message.to
    assert_equal ["johnsayeau@gmail.com"], message.from
    assert_match "Hi", message.body.encoded
  end

end
