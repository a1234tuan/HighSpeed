package com.hqyj.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
// 【关键修改】必须导入事务注解包，否则 @Transactional 标红
import org.springframework.transaction.annotation.Transactional;

import com.hqyj.dao.FeerecordDao;
import com.hqyj.pojo.Feerecord;
import com.hqyj.service.FeerecordService;
import com.hqyj.vo.FeerecordVO;
import com.hqyj.dao.DriverDao;
import com.hqyj.dao.MoneyrecordDao;
import com.hqyj.pojo.Driver;
import com.hqyj.pojo.Moneyrecord;

@Service
public class FeerecordServiceImpl implements FeerecordService {

    @Autowired
    private FeerecordDao feerecordDao;
    @Autowired
    private DriverDao driverDao;
    @Autowired
    private MoneyrecordDao moneyrecordDao;

    @Override
    public List<FeerecordVO> getList(FeerecordVO vo) {
        return feerecordDao.getList(vo);
    }

    @Override
    public int add(Feerecord feerecord) {
        return feerecordDao.add(feerecord);
    }

    @Override
    public FeerecordVO getById(Integer fid) {
        return feerecordDao.getById(fid);
    }

    // 核心事务方法
    @Override
    @Transactional(rollbackFor = Exception.class) 
    public void outStation(Feerecord feerecord, String dno, Double currentMoney) throws Exception {
        
        // 1. 扣除驾驶员余额
        // 注意：这里默认 feerecord.getPrice() 返回的是 Integer，如果数据库是Int则没问题
    	Double price = Double.valueOf(feerecord.getPrice());
        
        if (currentMoney < price) {
            throw new Exception("余额不足");
        }
        
        // 更新驾驶员表
        Driver driver = new Driver();
        driver.setDno(dno);
        // 这里假设 Driver 的 money 也是 Integer 类型，如果 Driver.money 是 Double，这里要强转
        driver.setMoney(currentMoney - price); 
        driverDao.updateMoney(driver); 
        
        // 2. 写入资金流水
        Moneyrecord mr = new Moneyrecord();
        mr.setDno(dno); // 如果之前报 setDno undefined，现在 POJO 加上了就好了
        mr.setMoney(price); // 如果 POJO 里 money 是 Integer，这里就对应上了
        mr.setType(2);
        moneyrecordDao.add(mr);

        // 3. 更新出站记录
        feerecordDao.updateOut(feerecord);
    }
}
