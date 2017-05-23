class Article < ApplicationRecord

def self.search(search)
    where("title ILIKE ?" , "%#{search}%")
end
end
