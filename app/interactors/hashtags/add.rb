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
        create_new_hash(hash)
      else
        update_hash_info(hashtag) unless hashtag.pages.include?(id)
      end
    end

    def create_new_hash(hash)
      Hashtag.create(hashtag: hash, pages: [id]) || context.fail!(message: "Hashtag addition fail")
    end

    def update_hash_info(hashtag)
      hashtag.pages << id
      hashtag.save || context.fail!(message: "Hashtag addition fail")
    end
  end
end
