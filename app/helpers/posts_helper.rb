module PostsHelper
	def post_style(post, current_user)
		content_tag(:div, id: "post-#{post.id}", class: "post") do
			content_tag(:div, "#{post.body}", class: "post-body") +
			content_tag(:div, class: "post-user") do
				if post.user
					content_tag(:div, link_to(post.user.name, post.user, class: "user-profile-link"))
				else
					content_tag(:div, "Anonymous")
				end
			end + 
			content_tag(:div, class: "post-sharing pull-right") do
				content_tag(:div, class: "pull-left") do
					if user_signed_in? && post.user != current_user
						unless current_user.favorite_posts.exists?(id: post.id)
							link_to(raw('<i class="fa fa-star favorite"></i>'), favorite_posts_path(post_id: post.id), 
							method: :post, remote: true, class: "favorite-button", title: "Favorite!")
						else	
							link_to(raw('<i class="fa fa-star unfavorite"></i>'), favorite_post_path(post), 
							method: :delete, remote: true, class: "favorite-button", title: "Unfavorite.")
				    end
				  end
				end +
				content_tag(:div, class: "pull-left") do
					link_to(raw('<i class="fa fa-twitter"></i>'), "https://twitter.com/intent/tweet?text=#{post.body} - via @sahdfunny")
				end +
				content_tag(:div, "", class: "fb-like pull-left", 
					data: { 
	                href: "#{request.original_url}/posts/#{post.id}", 
	                action: "like", 
	                show_faces: "false", 
	                share: "false", 
	                layout: "button_count"
	              } )
			end +
      content_tag(:div, "", class: "clearfix")
		end
		# display = %{
		# 	<div class="post" id="post-#{post.id}">
		# 	  <div class="post-body">#{post.body}</div>
		# 	  <div class="post-user">
		# 	    #{ if post.user ; link_to post.user.name, post.user, class: "user-profile-link" ; else "Anonymous" ; end }
		# 	  </div>
		# 	  #{ if user_signed_in? && post.user != current_user ; 
		# 	    unless current_user.favorite_posts.exists?(id: post.id) ;
		# 	      link_to raw('<i class="fa fa-star favorite"></i>'), favorite_posts_path(post_id: post.id), method: :post, remote: true, class: "favorite-button", title: "Favorite!" ;
		# 	    else
		# 	      link_to raw('<i class="fa fa-star unfavorite"></i>'), favorite_post_path(post), method: :delete, remote: true, class: "favorite-button", title: "Unfavorite." ;
		# 	    end ;
		# 	  end }
		# 	</div>
		# }
		# display.html_safe
	end
end
