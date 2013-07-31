require "tracer_bullet/version"

module TracerBullet

  module Methods
    def tracer_bullet
      if Rails.env.development?
        Rails.logger.debug( "Elapsed: #{(Time.now - @tracer_bullet_start_time)*1000.00}ms #{caller(0)[1]}" ) 
        @tracer_bullet_start_time = Time.now
      end
    end
    alias_method :tb, :tracer_bullet
  end

  module Controller
    extend ActiveSupport::Concern

    included do
      before_filter :setup_tracer_bullet_start_time
    end

    module InstanceMethods
      include Methods

      def setup_tracer_bullet_start_time
        @tracer_bullet_start_time = Time.now
      end
    end
  end

  module View
    extend ActiveSupport::Concern

    module InstanceMethods
      include Methods
    end
  end


  class Railtie < Rails::Railtie
    initializer "tracer_bullet.action_controller" do
      ActiveSupport.on_load(:action_controller) do
        include TracerBullet::Controller
      end
    end

    initializer "tracer_bullet.action_view" do
      ActiveSupport.on_load(:action_view) do
        include TracerBullet::View
      end
    end
  end

end
