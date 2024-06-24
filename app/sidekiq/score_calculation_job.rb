class ScoreCalculationJob
  include Sidekiq::Job

  def perform(name,score)
    score = 
     puts "I am #{name}, and my score is #{score}"
    # Do something
  end
end
