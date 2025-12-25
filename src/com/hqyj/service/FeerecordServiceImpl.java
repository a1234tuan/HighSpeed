package com.hqyj.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hqyj.dao.FeerecordDao;
import com.hqyj.pojo.Feerecord;
import com.hqyj.service.FeerecordService;
import com.hqyj.vo.FeerecordVO;

@Service
public class FeerecordServiceImpl implements FeerecordService {
    @Autowired
    private FeerecordDao feerecordDao;

    @Override
    public List<FeerecordVO> getList(FeerecordVO vo) {
        return feerecordDao.getList(vo);
    }

    @Override
    public int add(Feerecord feerecord) {
        return feerecordDao.add(feerecord);
    }
}
