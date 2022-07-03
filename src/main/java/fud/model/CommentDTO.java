package fud.model;

public class CommentDTO {
    private String commentID;
    private String postID;
    private String commenterID;
    private String commenterName;
    private String commenterAvatarLink;
    private String commentContent;
    private String commentTime;

    public CommentDTO() {
    }

    public CommentDTO(String commentID, String commentContent, String commentTime) {
        this.commentID = commentID;
        this.commentContent = commentContent;
        this.commentTime = commentTime;
    }

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public String getPostID() {
        return postID;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public String getCommenterID() {
        return commenterID;
    }

    public void setCommenterID(String commenterID) {
        this.commenterID = commenterID;
    }

    public String getCommenterName() {
        return commenterName;
    }

    public void setCommenterName(String commenterName) {
        this.commenterName = commenterName;
    }

    public String getCommenterAvatarLink() {
        return commenterAvatarLink;
    }

    public void setCommenterAvatarLink(String commenterAvatarLink) {
        this.commenterAvatarLink = commenterAvatarLink;
    }
}
