module Hashtags
  class Add
    include Interactor

    delegate :page, to: :context
    delegate :body, :id, to: :page

    def call
      hash_init
    end

    private

    def hashes
      hashes = body.scan(/#\w+/)
      hashes.uniq
    end

    def hash_init
      hashes.each do |hash|
        hash = hash.slice(1..hash.length)
        init(Hashtag.where(hashtag: hash).first, hash)
      end
    end

    def init(hashtag, hash)
      if hashtag.nil?
        create_new_tag(create_new_hash(hash))
      else
        create_new_tag(hashtag) unless PagesHashtag.where(hashtag_id: hashtag.id, page_id: id).exists?
      end
    end

    def create_new_hash(hash)
      Hashtag.create(hashtag: hash) || context.fail!(message: "Hashtag addition fail")
    end

    def create_new_tag(hashtag)
      PagesHashtag.create(hashtag_id: hashtag.id, page_id: id) || context.fail!(message: "Hashtag addition fail")
    end
  end
end
