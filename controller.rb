require_relative 'view.rb'
require_relative 'model.rb'

include View # View is a module since it doesn't have anything other than methods

class Controller

  def initialize
    @model = Model.new #you'll usually do this because the Model involves at least one class
    run_tests
  end

  def run_tests
    send_greeting
    results = get_work
    send_report(results)
  end

  private

  attr_reader :model

  #key is that all interactions with model and and view are
  #encapsulated within private methods to make them easy to change

  def send_greeting
    View.say_hello
  end

  def send_report(topic)
    View.report(topic)
  end

  def get_work
    model.do_some_thinking
  end

end

go = Controller.new
