package com.idig8.thrift.user.dto;

public class TeacherDTO extends  UserDTO{
    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    private  String intro;
    private  int stars;

}
