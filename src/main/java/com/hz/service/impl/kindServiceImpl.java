package com.hz.service.impl;

import com.hz.bean.Kind;
import com.hz.dao.kindDao;
import com.hz.service.kindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class kindServiceImpl implements kindService {
    @Autowired
    kindDao kinddao;
    @Override
    public List<Kind> listKind() {
        return kinddao.listKind();
    }
}
