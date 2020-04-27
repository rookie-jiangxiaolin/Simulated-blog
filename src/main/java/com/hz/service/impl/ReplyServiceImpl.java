package com.hz.service.impl;

import com.hz.bean.Reply;
import com.hz.dao.ReplyDao;
import com.hz.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    private ReplyDao replyDao;
    @Override
    public List<Reply> selectAllByTopicId(int id) {
        return replyDao.selectAllByTopicId(id);
    }

    @Override
    public int createReply(Reply reply) {
        return replyDao.createReply(reply);
    }
}
