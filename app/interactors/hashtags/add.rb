module Hashtags
  class Add
    include Interactor

    delegate :page, to: :context
    delegate :body, :id, to: :page

    def call
      hash_init unless hashes.nil?
    end

    private

    def hashes
      hashes = body.scan(/#\w+/)
      hashes.uniq
    end

    def hash_init
      hashes.each do |hash|
        @hashtag = Hashtag.where(hashtag: hash.slice(1..hash.length)).first
        if @hashtag.nil?
          Hashtag.create(hashtag: hash.slice(1..hash.length), pages: [id])
        else
          update_hash_info
        end
      end
    end

    def update_hash_info
      unless @hashtag.pages.include?(id)
        @hashtag.pages << id
        @hashtag.save
      end
    end
  end
end
