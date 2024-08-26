# frozen_string_literal: true

module ApplicationHelper
  include ActionView::Helpers

  def current_page?(path)
    request.path == path
  end

  def relative_timestamp(time, options = {})
    content_tag :span, "#{options[:prefix]}#{time_ago_in_words time} ago#{options[:suffix]}", options.merge(title: time)
  end

  def help_message
    content_tag :span, "Email #{help_email} for support.".html_safe
  end

  def help_email
    mail_to "help@greenhouse.directory"
  end

  def commit_name
    @short_hash ||= commit_hash[0...7]
    @commit_name ||= begin
      if commit_dirty?
        "#{@short_hash}-dirty"
      else
        @short_hash
      end
    end
  end

  def commit_dirty?
    ::Util.commit_dirty?
  end

  def commit_hash
    ::Util.commit_hash
  end

  def commit_time
    @commit_time ||= begin
      git_time = `git log -1 --format=%at`.chomp

      return nil if git_time.blank?

      Time.at(git_time.to_i) rescue nil # Convert the Unix epoch time to a Time object, handle error gracefully
    end

    @commit_time
  end

  def commit_duration
    @commit_duration ||= begin
      return nil if commit_time.nil?

      distance_of_time_in_words(commit_time, Time.now)
    end

    @commit_duration
  end


  module_function :commit_hash, :commit_time

  def greenhouse_version
    @greenhouse_version ||= begin
      if Rails.env.development?
        "DEVELOPMENT"
      else
        env = Rails.env.upcase
        time = Time.now.utc.strftime("%Y-%m-%d %H-%M UTC")
        "#{env} @ #{time} (#{commit_name})"
      end
    end
  end

  def rails_version
    Rails::VERSION::STRING
  end

  def ruby_version
    RUBY_VERSION
  end

  def agent_codename(agent_id)
    return "N/A" if agent_id.blank?

    agent = Agent.find_by(id: agent_id)
    agent ? "Agent #{agent.codename}" : "N/A"
  end

  def agent_codename_min(agent_id)
    return "N/A" if agent_id.blank?

    agent = Agent.find_by(id: agent_id)
    agent ? agent.codename : "N/A"
  end

  def agent_email(agent_id)
    return "N/A" if agent_id.blank?

    agent = Agent.find_by(id: agent_id)
    agent ? agent.agent_email : "N/A"
  end

  # def supported_browser?
  #   @browsers ||= JSON.parse(File.read("../../browsers.json"))
  #   matcher = BrowserslistUseragent::Match.new(@browsers, request.user_agent)
  #   matcher.browser? && matcher.version?(allow_higher: true)
  # end
end
