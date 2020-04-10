package com.lnmj.backManage.entity;

import javax.persistence.*;

@Table(name = "t_user")
public class TStoreUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String bz;

    private String password;

    @Column(name = "true_name")
    private String trueName;

    @Column(name = "user_name")
    private String userName;

    @Column(name = "store_id")
    private String storeId;

    private String remarks;

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }
    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return bz
     */
    public String getBz() {
        return bz;
    }

    /**
     * @param bz
     */
    public void setBz(String bz) {
        this.bz = bz == null ? null : bz.trim();
    }

    /**
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * @return true_name
     */
    public String getTrueName() {
        return trueName;
    }

    /**
     * @param trueName
     */
    public void setTrueName(String trueName) {
        this.trueName = trueName == null ? null : trueName.trim();
    }

    /**
     * @return user_name
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName
     */
    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    /**
     * @return remarks
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * @param remarks
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }



    @Transient
    private String roles;//zjt

    @Transient
    private String oldPassword;

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    @Override
    public String toString() {
        return "Tuser{" +
                "id=" + id +
                ", bz='" + bz + '\'' +
                ", password='" + password + '\'' +
                ", trueName='" + trueName + '\'' +
                ", userName='" + userName + '\'' +
                ", remarks='" + remarks + '\'' +
                ", roles='" + roles + '\'' +
                ", oldPassword='" + oldPassword + '\'' +
                '}';
    }
}