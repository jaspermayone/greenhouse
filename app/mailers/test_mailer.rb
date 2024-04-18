class TestMailer < ApplicationMailer
  default from: "noreply@greenhouse.directory"

  def hello
    mail(
      subject: "Hello from Postmark",
      to: "quail@greenhouse.directory",
      from: "noreply@greenhouse.directory",
      html_body: "<strong>Hello</strong> dear Postmark user.",
      track_opens: "true",
      message_stream: "outbound"
    )
  end
end
