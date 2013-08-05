require "tracer_bullets/version"

module TracerBullets

  module Methods
    def tracer_bullet
      if Rails.env.development?
        _tracer_bullets_log( "Elapsed: #{((Time.now - @tracer_bullet_start_time)*1000).to_i}ms #{caller(0)[1]}" )
        @tracer_bullet_start_time = Time.now
      end
    end
    alias_method :tb, :tracer_bullet

    private

    def _tracer_bullets_log(msg)
      log = Rails.logger
      if defined?(ActiveSupport::TaggedLogging)
        log.tagged("TracerBullets") { |l| l.debug(msg) }
      else
        log.debug(msg)
      end
    end
  end

  module Controller
    extend ActiveSupport::Concern
    include Methods

    included do
      before_filter :setup_tracer_bullet_start_time
    end

    def setup_tracer_bullet_start_time
      @tracer_bullet_start_time = Time.now
    end

  end

  module View
    extend ActiveSupport::Concern
    include Methods
  
  end


  class Railtie < Rails::Railtie
    initializer "tracer_bullet.action_controller" do
      ActiveSupport.on_load(:action_controller) do
        include TracerBullets::Controller
      end
    end

    initializer "tracer_bullet.action_view" do
      ActiveSupport.on_load(:action_view) do
        include TracerBullets::View
      end
    end
  end

end
