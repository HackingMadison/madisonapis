namespace :reimport do
  task :all => :environment do
    Library.reimport
    Park.reimport
    PoliceCall.reimport
    PoliceReport.reimport
    PollingPlace.reimport
    Property.reimport
    PublicSafetyLocation.reimport
    CityEvent.reimport
    CommercialLandSale.reimport
    VacanLandSale.reimport
    BusStop.reimport
    ReportAProblem.reimport
  end
end

namespace :import do
  task :all => :environment do
    Library.import
    Park.import
    PoliceCall.import
    PoliceReport.import
    PollingPlace.import
    Property.import
    PublicSafetyLocation.import
    CityEvent.import
    CommercialLandSale.import
    VacanLandSale.import
    BusStop.import
    ReportAProblem.reimport
  end
end