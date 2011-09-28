module HoptoadNotifier
  class Middleware
    include Catcher

    def initialize(app, options = {})
      @app, @options = app, options

      HoptoadNotifier.configure do |config|
        options.each{ |key, value| config.send "#{key}=", value }
      end
    end

    def call(env)
      @app.call(env)
    rescue Exception => exception
      handle exception
      raise exception
    end
  
  end
end