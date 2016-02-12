module PostsHelper

	def post_style(post, current_user)
		content_tag(:div, id: "post-#{post.id}", class: "post") do
			content_tag(:a, "#{post.body}", href: post_path(post), class: "post-body") + 
			if post.picture?
			  image_tag(post.picture_url, :alt => post.body, class: "post-picture")
			end + 
			content_tag(:div, " ", class: "divider-line") +
			content_tag(:div, "", class: "votes") do
				link_to("This is Sad (#{post.sad_votes})", post_sad_vote_path(post.id), class: "sad-vote #{post.id}", method: :patch, remote: true)  +
				content_tag(:span, " | ") +
				link_to("This is Funny (#{post.funny_votes})", post_funny_vote_path(post.id), class: "funny-vote #{post.id}", method: :patch, remote: true)
			end +
			link_to("#{pluralize(post.comments_count, 'comment')}", post_path(post), class: "comments") +
			content_tag(:div, "| Posted by", class: "posted-by") +
			content_tag(:div, class: "post-user") do
				if post.user
					content_tag(:div, link_to(post.user.name, post.user, class: "user-profile-link"))
				else
					content_tag(:div, "Anonymous")
				end
			end + 
			content_tag(:div, "#{time_ago_in_words(post.created_at)} ago", class: "posted-when") +
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
					link_to(raw('<i class="fa fa-twitter"></i>'), "https://twitter.com/intent/tweet?text=#{post.body} - #{post_url(post)} via @sahdfunny")
				end +
				content_tag(:div, "", class: "fb-like pull-left", 
					data: { 
	                href: "#{post_url(post)}", 
	                action: "like", 
	                show_faces: "false", 
	                share: "false", 
	                layout: "button_count"
	              } )
			end +
			content_tag(:div, "", class: "clearfix")			
		end
	end

end
