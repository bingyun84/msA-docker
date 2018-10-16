package com.idig8.course.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.idig8.course.dto.CourseDTO;
import com.idig8.course.mapper.CourseMapper;
import com.idig8.thrift.user.UserInfo;
import com.idig8.thrift.user.dto.TeacherDTO;
import org.apache.thrift.TException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Michael on 2017/11/3.
 */
@Service
public class CourseServiceImpl implements ICourseService {


    @Autowired
    private CourseMapper courseMapper;

    @Autowired
    private ServiceProvider serviceProvider;



    private TeacherDTO trans2Teacher(UserInfo userInfo) {
        TeacherDTO teacherDTO = new TeacherDTO();
        BeanUtils.copyProperties(userInfo, teacherDTO);
        return teacherDTO;
    }

    public List<CourseDTO> courseList() {
        List<CourseDTO> courseDTOS = courseMapper.listCourse();
        if(courseDTOS!=null) {
            for(CourseDTO courseDTO : courseDTOS) {
                Integer teacherId = courseMapper.getCourseTeacher(courseDTO.getId());
                if(teacherId!=null) {
                    try {
                        UserInfo userInfo = serviceProvider.getUserService().getTeacherById(teacherId);
                        courseDTO.setTeacherDTO(trans2Teacher(userInfo));
                    } catch (TException e) {
                        e.printStackTrace();
                        return null;
                    }
                }
            }
        }
        return courseDTOS;
    }

}
