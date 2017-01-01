module Unidom
  module Order

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace ::Unidom::Order

      enable_initializer enum_enabled: true, migration_enabled: true

    end

  end
end
