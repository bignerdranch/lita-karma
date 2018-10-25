module Lita::Handlers::Karma
  class Config < Lita::Handler
    namespace "karma"

    default_term_normalizer = proc do |term|
      term.to_s.downcase.strip
    end

    config :reply_in_thread, default: true
    config :thread_exceptions, default: []
    config :thread_threshold, default: 200
    config :cooldown, types: [Integer, nil], default: 300
    config :link_karma_threshold, types: [Integer, nil], default: 10
    config :term_pattern, type: Regexp, default: /[\[\]\p{Word}\._|\{\}]{2,}/
    config :term_normalizer, default: default_term_normalizer do
      validate do |value|
        t("callable_required") unless value.respond_to?(:call)
      end
    end
  end
end

Lita.register_handler(Lita::Handlers::Karma::Config)
