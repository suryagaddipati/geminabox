$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "lib")))
require "geminabox"
class MyLoggerMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    p " REQUESTED: #{env['REQUEST_PATH']} "
    @app.call(env)
  end
end

use MyLoggerMiddleware

run Geminabox
