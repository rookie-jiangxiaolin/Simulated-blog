package com.hz.dao;

import com.hz.bean.Kind;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface kindDao {
    List<Kind> listKind() ;
}
