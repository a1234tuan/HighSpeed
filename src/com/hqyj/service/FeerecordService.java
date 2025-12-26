package com.hqyj.service;

import java.util.List;
import com.hqyj.pojo.Feerecord;
import com.hqyj.vo.FeerecordVO;

public interface FeerecordService {
    // 列表查询
    public List<FeerecordVO> getList(FeerecordVO vo);
    
    // 进站/添加
    public int add(Feerecord feerecord);

    // 【修改】只保留这一个查询单条的方法，去掉 getRecordById
    public FeerecordVO getById(Integer fid);
    
    // 【修改】只保留这个出站业务方法，去掉 updateRecord
    public void outStation(Feerecord feerecord, String dno, Double currentMoney) throws Exception;
}
