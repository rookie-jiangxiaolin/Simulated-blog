package com.hz.service;

import com.hz.bean.Topic;

import java.util.List;

public interface TopicService {
    List<Topic> quarrySelectAll();

    List<Topic> quarrySelectAllByKindId(Topic topic);

    Topic quarryTopicById(int id);
//创建新帖子
    int createTitle(Topic topic);
//查询同一用户发的帖子
    List<Topic> quarrySelectAllByUserId(int id);
//查询贴子总数
//    int selectAllTopic();
}
