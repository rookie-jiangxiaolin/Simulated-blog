package com.hz.dao;

import com.hz.bean.Topic;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface TopicDao {
    List<Topic> quarrySelectAll();

    List<Topic> quarrySelectAllByKindId(Topic topic);

    Topic quarryTopicById(int id);

    List<Topic> quarrySelectAllByUserId(int id);

    int createTitle(Topic topic);

//    int selectAllTopic();
}
