package com.hz.dao;

import com.hz.bean.Reply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyDao {

    List<Reply> selectAllByTopicId(int id);

    int createReply(Reply reply);

}
