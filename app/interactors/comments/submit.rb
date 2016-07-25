module Comments
  class Submit
    include Interactor::Organizer

    organize Save, Notifications::Notify
  end
end
