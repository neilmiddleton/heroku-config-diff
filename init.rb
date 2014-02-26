class Heroku::Command::Config < Heroku::Command::Base

  def diff
    unless target = shift_argument
      error("Usage: heroku config:diff TARGET_APP\nMust specify TARGET_APP to compare to.")
    end
    validate_arguments!
    target_keys = config_keys(target)
    source_keys = config_keys(app)

    display_keys target, keys_addition(target_keys, source_keys), true
    display_keys app, keys_addition(source_keys, target_keys)
  end

  private

    def config_keys(target_app)
      config = api.get_config_vars(target_app).body
      config.keys
    end

    def keys_addition(first, second)
      first.reject{|k| second.include? k}
    end

    def display_keys(app, keys, newline=false)
      if keys.size
        display_header "The following keys exist only in #{app}"
        puts keys
        puts "" if newline
      else
        display_header "There are no extra keys in #{app}"
      end
    end

end
