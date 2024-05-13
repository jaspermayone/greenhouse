# frozen_string_literal: true

module HasAttachments
  extend ActiveSupport::Concern

  included do
    private

    def set_attachments(include_body: true)
      files = mail.attachments.select { |a| valid_content_type(a.content_type) }.map do |atta|
        {
          io: StringIO.new(atta.decoded),
          content_type: atta.content_type,
          filename: atta.filename,
        }
      end

      return @attachments = files if files.any?
    end

    def valid_content_type(content_type)
      content_type.start_with?("application/pdf") || content_type.start_with?("image")
    end

  end

end
