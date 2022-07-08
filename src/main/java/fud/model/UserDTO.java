package fud.model;

public class UserDTO {
    private String userID;
    private String password;
    private String username;
    private String fullname;
    private String avatarLink;
    private String dateOfBirth;
    private String gender;
    private String location;
    private boolean isAdmin;
    private boolean status;
    private int followerAmount;
    private int followeeAmount;

    public UserDTO() {
    }

    public UserDTO(String password, String username, boolean status) {
        this.password = password;
        this.username = username;
        this.status = status;
    }

    public UserDTO(String userID, String password, String username, String avatarLink,
                   String dateOfBirth, String gender, String location, boolean isAdmin) {
        this.userID = userID;
        this.password = password;
        this.username = username;
        this.avatarLink = avatarLink;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.location = location;
        this.isAdmin = isAdmin;
    }

    public UserDTO(String userID, String password,
                   String username, String fullname,
                   String avatarLink, String dateOfBirth,
                   String gender, String location,
                   boolean isAdmin, boolean status) {
        this.userID = userID;
        this.password = password;
        this.username = username;
        this.fullname = fullname;
        this.avatarLink = avatarLink;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.location = location;
        this.isAdmin = isAdmin;
        this.status = status;
    }

    public UserDTO(String userID, String password,
                   String username, String fullname,
                   String avatarLink, String dateOfBirth,
                   String gender, String location,
                   boolean isAdmin, boolean status,
                   int followerAmount, int followeeAmount) {
        this.userID = userID;
        this.password = password;
        this.username = username;
        this.fullname = fullname;
        this.avatarLink = avatarLink;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.location = location;
        this.isAdmin = isAdmin;
        this.status = status;
        this.followerAmount = followerAmount;
        this.followeeAmount = followeeAmount;
    }

    // This Construct user to get User Info only. Not include password
    public UserDTO(String userID, String username,
                   String fullname, String avatarLink,
                   String dateOfBirth, String gender,
                   String location, boolean isAdmin, boolean status,
                   int followerAmount, int followeeAmount) {
        this.userID = userID;
        this.username = username;
        this.fullname = fullname;
        this.avatarLink = avatarLink;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.location = location;
        this.isAdmin = isAdmin;
        this.status = status;
        this.followerAmount = followerAmount;
        this.followeeAmount = followeeAmount;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAvatarLink() {
        return avatarLink;
    }

    public void setAvatarLink(String avatarLink) {
        this.avatarLink = avatarLink;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getFollowerAmount() {
        return followerAmount;
    }

    public void setFollowerAmount(int followerAmount) {
        this.followerAmount = followerAmount;
    }

    public int getFolloweeAmount() {
        return followeeAmount;
    }

    public void setFolloweeAmount(int followeeAmount) {
        this.followeeAmount = followeeAmount;
    }
}
