package com.sy.model.ztw;

public class UserAddressInfoZtw {
    private Integer id;
    private Integer baseBalance;
    private String username;
    private String userAddress;
    private String postCode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBaseBalance() {
        return baseBalance;
    }

    public void setBaseBalance(Integer baseBalance) {
        this.baseBalance = baseBalance;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    @Override
    public String toString() {
        return "UserAddressInfoZtw{" +
                "id=" + id +
                ", baseBalance=" + baseBalance +
                ", username='" + username + '\'' +
                ", userAddress='" + userAddress + '\'' +
                ", postCode='" + postCode + '\'' +
                '}';
    }
}
