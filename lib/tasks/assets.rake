# frozen_string_literal: true

# Reduce slug size by deleting node_modules during assets clean
# https://blog.saeloun.com/2020/05/04/how-to-reduce-heroku-slug-size.html
# Adapted from https://github.com/heroku/heroku-buildpack-ruby/issues/792

namespace :assets do
  desc "Remove 'node_modules' folder"
  task rm_node_modules: :environment do
    Rails.logger.info "Removing node_modules folder"
    FileUtils.remove_dir("node_modules", true)
  end
end

skip_clean = %w(no false n f).include?(ENV["WEBPACKER_PRECOMPILE"])

unless skip_clean
  if Rake::Task.task_defined?("assets:clean")
    Rake::Task["assets:clean"].enhance do
      Rake::Task["assets:rm_node_modules"].invoke
    end
  else
    Rake::Task.define_task("assets:clean" => "assets:rm_node_modules")
  end
end
