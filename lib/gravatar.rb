class Gravatar
  def self.for(email, size = 48)
     gravatar_id = Digest::MD5.hexdigest(email.downcase)
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
