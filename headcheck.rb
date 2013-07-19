require 'sinatra'

class String
  def possessive
    suffix = self.split('').last == "s" ? "'" : "'s"
    self + suffix
  end
end

def check
  time = Time.now
  work = (1..5).include?(time.wday) && (9..18).include?(time.hour)
  pool = time.hour == 3 && time.minute < 30
  work && !pool ? :down : :up
end

get '/:name' do
  name = params[:name].split(/\s+/).map(&:capitalize).join(' ')
  erb :show, locals: { name: name, check: check }
end
