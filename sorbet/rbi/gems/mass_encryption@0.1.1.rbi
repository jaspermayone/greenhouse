# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `mass_encryption` gem.
# Please instead update this file by running `bin/tapioca gem mass_encryption`.


# source://mass_encryption//lib/mass_encryption/version.rb#1
module MassEncryption
  # source://mass_encryption//lib/mass_encryption.rb#9
  def logger; end

  # source://mass_encryption//lib/mass_encryption.rb#9
  def logger=(val); end

  class << self
    # source://mass_encryption//lib/mass_encryption.rb#9
    def logger; end

    # source://mass_encryption//lib/mass_encryption.rb#9
    def logger=(val); end

    # source://railties/7.1.3.4/lib/rails/engine.rb#412
    def railtie_helpers_paths; end

    # source://railties/7.1.3.4/lib/rails/engine.rb#395
    def railtie_namespace; end

    # source://railties/7.1.3.4/lib/rails/engine.rb#416
    def railtie_routes_url_helpers(include_path_helpers = T.unsafe(nil)); end

    # source://railties/7.1.3.4/lib/rails/engine.rb#401
    def table_name_prefix; end

    # source://railties/7.1.3.4/lib/rails/engine.rb#408
    def use_relative_model_naming?; end
  end
end

class MassEncryption::ApplicationJob < ::ActiveJob::Base
  class << self
    # source://activejob/7.1.3.4/lib/active_job/queue_name.rb#55
    def queue_name; end
  end
end

# source://mass_encryption//lib/mass_encryption/batch.rb#1
class MassEncryption::Batch
  # @return [Batch] a new instance of Batch
  #
  # source://mass_encryption//lib/mass_encryption/batch.rb#8
  def initialize(klass:, from_id:, size: T.unsafe(nil), track: T.unsafe(nil), tracks_count: T.unsafe(nil)); end

  # source://mass_encryption//lib/mass_encryption/batch.rb#31
  def encrypt_later(auto_enqueue_next: T.unsafe(nil)); end

  # source://mass_encryption//lib/mass_encryption/batch.rb#20
  def encrypt_now; end

  # Returns the value of attribute from_id.
  #
  # source://mass_encryption//lib/mass_encryption/batch.rb#2
  def from_id; end

  # source://mass_encryption//lib/mass_encryption/batch.rb#16
  def klass; end

  # source://mass_encryption//lib/mass_encryption/batch.rb#6
  def logger(&block); end

  # source://mass_encryption//lib/mass_encryption/batch.rb#41
  def next; end

  # @return [Boolean]
  #
  # source://mass_encryption//lib/mass_encryption/batch.rb#35
  def present?; end

  # source://mass_encryption//lib/mass_encryption/batch.rb#45
  def records; end

  # Returns the value of attribute size.
  #
  # source://mass_encryption//lib/mass_encryption/batch.rb#2
  def size; end

  # source://mass_encryption//lib/mass_encryption/batch.rb#49
  def to_s; end

  # Returns the value of attribute track.
  #
  # source://mass_encryption//lib/mass_encryption/batch.rb#2
  def track; end

  # Returns the value of attribute tracks_count.
  #
  # source://mass_encryption//lib/mass_encryption/batch.rb#2
  def tracks_count; end

  # @raise [ActiveRecord::Encryption::Errors::Configuration]
  #
  # source://mass_encryption//lib/mass_encryption/batch.rb#27
  def validate_encrypting_is_allowed; end

  private

  # source://mass_encryption//lib/mass_encryption/batch.rb#77
  def determine_from_id; end

  # @raise [MassEncryption::BatchEncryptionError]
  #
  # source://mass_encryption//lib/mass_encryption/batch.rb#65
  def encrypt_record_by_record; end

  # source://mass_encryption//lib/mass_encryption/batch.rb#54
  def encrypt_records; end

  # source://mass_encryption//lib/mass_encryption/batch.rb#61
  def encrypt_using_upsert; end

  # source://mass_encryption//lib/mass_encryption/batch.rb#93
  def ids_in_the_same_track; end

  # source://mass_encryption//lib/mass_encryption/batch.rb#85
  def last_track_id; end

  # source://mass_encryption//lib/mass_encryption/batch.rb#97
  def next_track_records; end

  # source://mass_encryption//lib/mass_encryption/batch.rb#89
  def offset; end
end

# source://mass_encryption//lib/mass_encryption/batch.rb#4
MassEncryption::Batch::DEFAULT_BATCH_SIZE = T.let(T.unsafe(nil), Integer)

# source://mass_encryption//lib/mass_encryption/batch_encryption_error.rb#1
class MassEncryption::BatchEncryptionError < ::StandardError
  # @return [BatchEncryptionError] a new instance of BatchEncryptionError
  #
  # source://mass_encryption//lib/mass_encryption/batch_encryption_error.rb#4
  def initialize(errors_by_record); end

  # Returns the value of attribute errors_by_record.
  #
  # source://mass_encryption//lib/mass_encryption/batch_encryption_error.rb#2
  def errors_by_record; end
end

class MassEncryption::BatchEncryptionJob < ::MassEncryption::ApplicationJob
  def perform(batch, auto_enqueue_next: T.unsafe(nil)); end
end

# source://mass_encryption//lib/mass_encryption/batch_serializer.rb#1
class MassEncryption::BatchSerializer < ::ActiveJob::Serializers::ObjectSerializer
  # source://mass_encryption//lib/mass_encryption/batch_serializer.rb#16
  def deserialize(hash); end

  # source://mass_encryption//lib/mass_encryption/batch_serializer.rb#6
  def serialize(batch); end

  # @return [Boolean]
  #
  # source://mass_encryption//lib/mass_encryption/batch_serializer.rb#2
  def serialize?(argument); end
end

# source://mass_encryption//lib/mass_encryption/encryptor.rb#1
class MassEncryption::Encryptor
  # @return [Encryptor] a new instance of Encryptor
  #
  # source://mass_encryption//lib/mass_encryption/encryptor.rb#6
  def initialize(from_id: T.unsafe(nil), only: T.unsafe(nil), except: T.unsafe(nil), batch_size: T.unsafe(nil), tracks_count: T.unsafe(nil), silent: T.unsafe(nil)); end

  # source://mass_encryption//lib/mass_encryption/encryptor.rb#19
  def encrypt_all_later; end

  # source://mass_encryption//lib/mass_encryption/encryptor.rb#4
  def logger(&block); end

  private

  # source://mass_encryption//lib/mass_encryption/encryptor.rb#71
  def all_encryptable_classes; end

  # source://mass_encryption//lib/mass_encryption/encryptor.rb#57
  def all_records_for(klass); end

  # Returns the value of attribute batch_size.
  #
  # source://mass_encryption//lib/mass_encryption/encryptor.rb#24
  def batch_size; end

  # @return [Boolean]
  #
  # source://mass_encryption//lib/mass_encryption/encryptor.rb#78
  def encryptable_class?(klass); end

  # Returns the value of attribute encryptable_classes.
  #
  # source://mass_encryption//lib/mass_encryption/encryptor.rb#24
  def encryptable_classes; end

  # source://mass_encryption//lib/mass_encryption/encryptor.rb#51
  def enqueue_all_encryption_jobs_for(klass); end

  # source://mass_encryption//lib/mass_encryption/encryptor.rb#39
  def enqueue_encryption_jobs_for(klass); end

  # source://mass_encryption//lib/mass_encryption/encryptor.rb#63
  def enqueue_track_encryption_jobs_for(klass); end

  # @return [Boolean]
  #
  # source://mass_encryption//lib/mass_encryption/encryptor.rb#47
  def execute_in_sequential_tracks?; end

  # Returns the value of attribute from_id.
  #
  # source://mass_encryption//lib/mass_encryption/encryptor.rb#24
  def from_id; end

  # @return [Boolean]
  #
  # source://mass_encryption//lib/mass_encryption/encryptor.rb#82
  def has_encrypted_attributes?(klass); end

  # @return [Boolean]
  #
  # source://mass_encryption//lib/mass_encryption/encryptor.rb#86
  def has_encrypted_rich_text_attribute?(klass); end

  # source://mass_encryption//lib/mass_encryption/encryptor.rb#26
  def info_message; end

  # Returns the value of attribute silent.
  #
  # source://mass_encryption//lib/mass_encryption/encryptor.rb#24
  def silent; end

  # Returns the value of attribute tracks_count.
  #
  # source://mass_encryption//lib/mass_encryption/encryptor.rb#24
  def tracks_count; end
end

# source://mass_encryption//lib/mass_encryption/encryptor.rb#2
MassEncryption::Encryptor::DEFAULT_BATCH_SIZE = T.let(T.unsafe(nil), Integer)

# source://mass_encryption//lib/mass_encryption/engine.rb#2
class MassEncryption::Engine < ::Rails::Engine
  class << self
    # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#70
    def __callbacks; end
  end
end

# source://mass_encryption//lib/mass_encryption/version.rb#2
MassEncryption::VERSION = T.let(T.unsafe(nil), String)
