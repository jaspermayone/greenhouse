require "administrate/base_dashboard"

class MessageDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    agent: Field::BelongsTo,
    archived: Field::Boolean,
    attachments: Field::String,
    attachments_attachments: Field::HasMany,
    attachments_blobs: Field::HasMany,
    bcc: Field::String,
    body: Field::Text,
    cc: Field::String,
    from: Field::String,
    mailbox: Field::BelongsTo,
    read: Field::Boolean,
    received_at: Field::DateTime,
    sent_at: Field::DateTime,
    starred: Field::Boolean,
    subject: Field::String,
    to: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    agent
    archived
    attachments
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    agent
    archived
    attachments
    attachments_attachments
    attachments_blobs
    bcc
    body
    cc
    from
    mailbox
    read
    received_at
    sent_at
    starred
    subject
    to
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    agent
    archived
    attachments
    attachments_attachments
    attachments_blobs
    bcc
    body
    cc
    from
    mailbox
    read
    received_at
    sent_at
    starred
    subject
    to
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how messages are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(message)
  #   "Message ##{message.id}"
  # end
end
