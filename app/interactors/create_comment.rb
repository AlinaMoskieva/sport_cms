class CreateComment
  include Interactor::Organizer

  organize SaveComment, NotifyUser
end
