package com.hqyj.dao;
import java.util.List;
import com.hqyj.pojo.Feerecord;
import com.hqyj.vo.FeerecordVO;

public interface FeerecordDao {
    // 查列表：返回的是VO，因为要显示名字
    public List<FeerecordVO> getList(FeerecordVO vo);
    // 添加：存的是基础POJO
    public int add(Feerecord feerecord);
}
