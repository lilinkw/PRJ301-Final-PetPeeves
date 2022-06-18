package fud.model;

import java.util.List;

public class PostDTO {
    private String postID;
    private String postContent;
    private List<String> imageLinks;

    public PostDTO() {
    }

    public PostDTO(String postID, String postContent, List<String> imageLinks) {
        this.postID = postID;
        this.postContent = postContent;
        this.imageLinks = imageLinks;
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
}
