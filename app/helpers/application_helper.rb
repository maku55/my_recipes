module ApplicationHelper
#def gravatar_for (chef, options={size: 80})
	#chef_id= Digest::MD5::hexdigest (chef.picture)
	#size=options [:size]
    #image_tag(chef.picture.url,size: "250x150",class: "gravatar") if chef.picture? 
#end
#end

	def gravatar_for (chef, options={size: 80})
		gravatar_id= Digest::MD5::hexdigest (chef.email.downcase)
		size=options [:size]
		gravatar_url="https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url,alt:chef.chefname,class:"gravatar")
	end
end
