class ParchaseRecordsController < ApplicationController
  def index
    @records = PurchaseRecord.all
  end
end
