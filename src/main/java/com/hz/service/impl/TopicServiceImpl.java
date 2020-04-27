package com.hz.service.impl;

import com.hz.bean.Topic;
import com.hz.dao.TopicDao;
import com.hz.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TopicServiceImpl implements TopicService {
    @Autowired
    TopicDao topicDao;

    @Override
    public List<Topic> quarrySelectAll() {

        return topicDao.quarrySelectAll();
    }

    @Override
    public List<Topic> quarrySelectAllByKindId(Topic topic) {
        return topicDao.quarrySelectAllByKindId(topic);
    }

    @Override
    public Topic quarryTopicById(int id) {
        return topicDao.quarryTopicById(id);
    }

    @Override
    public int createTitle(Topic topic) {
        if(topicDao.createTitle(topic)>0){
            return 1;
        }
        else {
            return 0;
        }
    }

    @Override
    public List<Topic> quarrySelectAllByUserId(int id) {
        return topicDao.quarrySelectAllByUserId(id);
    }

//    @Override
//    public int selectAllTopic() {
//        return topicDao.selectAllTopic();
//    }
}
