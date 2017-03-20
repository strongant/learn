package org.seckill.dao;

import org.seckill.entity.SuccessKilled;

/**
 * Created by strongant on 17-3-20.
 */
public interface SuccessKilledDao {
    /**
     * 插入购买明细
     * 可过滤重复
     * @param seckillId
     * @param userPhone
     * @return 插入的结果集数量
     */
    int insertSuccessKilled(long seckillId,long userPhone);

    /**
     * 根据秒杀id查询SuccessKilled，并且携带产品对象实体
     * @param seckillId
     * @return
     */
    SuccessKilled queryByIdWithSeckill(long seckillId);
}
