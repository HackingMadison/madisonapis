class Api::BcycleStationsController < ApiController

  def index
    kiosks = Bcycle.kiosks.select { |kiosk| kiosk.state == 'WI' and  kiosk.city == 'Madison' }
    render json: kiosks
  end

end