package fud.model;

public class CommentDTO {
    private String commentID;
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
}
