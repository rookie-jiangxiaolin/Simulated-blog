package com.hz.service;

import com.hz.bean.Reply;

import java.util.List;

public interface ReplyService {

    List<Reply> selectAllByTopicId(int id);

    int createReply(Reply reply);
}
