package com.hqyj.service;
import java.util.List;
import com.hqyj.pojo.Feerecord;
import com.hqyj.vo.FeerecordVO;

public interface FeerecordService {
    public List<FeerecordVO> getList(FeerecordVO vo);
    public int add(Feerecord feerecord);
}
