module Pages
  class Submit
    include Interactor::Organizer

    organize Save, Hashtags::Add
  end
end
