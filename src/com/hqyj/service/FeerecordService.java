package com.hqyj.service;
import java.util.List;
import com.hqyj.pojo.Feerecord;
import com.hqyj.vo.FeerecordVO;

public interface FeerecordService {
    public List<FeerecordVO> getList(FeerecordVO vo);
    public int add(Feerecord feerecord);
    public FeerecordVO getRecordById(Integer fid); // 根据ID获取单条记录详情，用于出站页面显示
    public int updateRecord(Feerecord feerecord); // 更新记录，用于出站时更新endid, price, state
}
