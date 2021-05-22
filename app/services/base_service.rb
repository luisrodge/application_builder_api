class BaseService
  def self.call(...)
    new(...).call
  end

  # Generic service result class
  class Result
    attr_reader :record, :errors

    def initialize(record:, success:)
      @record = record
      @success = success
      @errors = errors
    end

    def success?
      @success
    end
  end
end
