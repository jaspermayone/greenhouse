class TestMailer < ApplicationMailer
  default from: "noreply@greenhouse.obl.ong"

  def hello
    mail(
      subject: "Hello from Postmark",
      to: "jasper@greenhouse.obl.ong",
      from: "noreply@greenhouse.obl.ong",
      html_body: "<strong>Hello</strong> dear Postmark user.",
      track_opens: "true",
      message_stream: "outbound"
    )
  end
end
