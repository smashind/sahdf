module CommentsHelper
	def comment_style(comment)
    content_tag(:div, id: "comment-#{comment.id}", class: "comment") do
      content_tag(:div, "#{comment.body}", class: "comment-body") +
      content_tag(:div, "", class: "divider-line") +
      content_tag(:div, class: "post-user") do
      	link_to comment.user.name, comment.user, class: "user-profile-link"
      end +
      content_tag(:div, "#{time_ago_in_words(comment.created_at)} ago", class: "posted-when") +
      content_tag(:div, "", class: "clearfix")
    end
	end
end
