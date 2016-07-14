class Event
  attr_reader :user, :id, :type, :payload

  def initialize(user,event_hash)
    @user = user
    @id = event_hash[:id]
    @type = event_hash[:type]
    @payload = event_hash[:payload]
  end

  def self.all(user)
    service = UsersService.new
    raw_events = service.get_events(user)
    raw_events.map do |event|
      Event.new(user, event)
    end
  end

  def self.push_events(user)
    all_events = all(user)
    all_events.find_all do |event|
      event.type == "PushEvent"
    end
  end

  def self.payload_commit_data(user)
    push_events(user).map do |event|
      event.payload[:commits]
    end
  end

  def self.commits(user)
    payload_commit_data(user).map do |data|
      data.map do |commit|
        OpenStruct.new(commit)
      end
    end.flatten
  end

end
