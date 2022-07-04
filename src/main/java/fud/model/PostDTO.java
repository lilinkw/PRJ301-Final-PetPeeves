package fud.model;

import java.util.List;

public class PostDTO {
    private String postID;
    private String postTitle;
    private String postContent;
    private String categoryID;
    private String category;
    private String authorID;
    private String authorName;
    private String authorAvatarLink;
    private String postTime;
    private boolean postStatus;
    private List<String> imageLinks;

    public PostDTO() {
    }

    public PostDTO(String postID, String postContent, List<String> imageLinks) {
        this.postID = postID;
        this.postContent = postContent;
        this.imageLinks = imageLinks;
    }

    public PostDTO(String postID, String postTitle, String postContent,
                   String category, String authorID,
                   String authorName, String authorAvatarLink, String postTime,
                   boolean postStatus) {
        this.postID = postID;
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.category = category;
        this.authorID = authorID;
        this.authorName = authorName;
        this.authorAvatarLink = authorAvatarLink;
        this.postTime = postTime;
        this.postStatus = postStatus;
    }

    public String getPostID() {
        return postID;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public List<String> getImageLinks() {
        return imageLinks;
    }

    public void setImageLinks(List<String> imageLinks) {
        this.imageLinks = imageLinks;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAuthorID() {
        return authorID;
    }

    public void setAuthorID(String authorID) {
        this.authorID = authorID;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getAuthorAvatarLink() {
        return authorAvatarLink;
    }

    public void setAuthorAvatarLink(String authorAvatarLink) {
        this.authorAvatarLink = authorAvatarLink;
    }

    public String getPostTime() {
        return postTime;
    }

    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }

    public boolean getPostStatus() {
        return postStatus;
    }

    public void setPostStatus(boolean postStatus) {
        this.postStatus = postStatus;
    }
}
