package model;

public class UserLoginError {

    private String userLoginErr;

    public UserLoginError() {
    }

    public UserLoginError(String userLoginErr) {
        this.userLoginErr = userLoginErr;
    }

    public String getUserLoginErr() {
        return userLoginErr;
    }

    public void setUserLoginErr(String userLoginErr) {
        this.userLoginErr = userLoginErr;
    }

}
