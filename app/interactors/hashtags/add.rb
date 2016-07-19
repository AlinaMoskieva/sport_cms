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
        init(Hashtag.where(hashtag: hash.slice(1..hash.length)).first, hash)
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
      Hashtag.create(hashtag: hash.slice(1..hash.length), pages: [id]) || context.fail!
    end

    def update_hash_info(hashtag)
      hashtag.pages << id
      hashtag.save || context.fail!
    end
  end
end
