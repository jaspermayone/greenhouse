require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "verify" do
    mail = UserMailer.verify
    assert_equal "Verify", mail.subject
    assert_equal ["jasper@greenhouse.obl.ong"], mail.to
    assert_equal ["noreply@greenhouse.obl.ong"], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
