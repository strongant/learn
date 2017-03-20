## Java高并发秒杀API之业务分析与Dao层实现

### 互联网公司常用框架

#### 特点
1. 框架易于使用和轻量级
2. 低代码侵入性
3. 成熟的社区和用户群

#### 选用秒杀业务的原因
由于秒杀业务场景具有典型的“事务”特性

### 相关技术介绍

* MySQL(表设计)
* SQL技巧
* 事务和行级锁
* MyBatis(DAO层设计与开发、合理使用)
* Spring IOC整合Service
* 声明式事务运用
* SpringMVC Restful接口设计和使用
* 框架运作流程
* Controller开发技巧
* 前端交互设计
* Bootstrap
* jQuery
* 高并发点和高并发分析
* 优化思路并实现
* 基于Maaven创建项目

#### 开始创建项目
* 从零开始创建
* 从官网获取相关配置
* 使用Maven创建项目

##### 为什么从官网获取资源？
* 文档更全面更权威
* 避免过时或错误

##### 官网地址
* logback配置：http://logback.qos.ch/manual/configuration.html
* spring配置：http://docs.spring.io/spring/docs
* mybatis配置：http://mybatis.github.io/mybatis-3/zh/index.html

#### Maven命令创建web骨架项目
```maven
## 注意：maven的3.2.1使用此生成命令有问题，需要将create修改为generate，最新版本的3.3.9目前测试是也会提示无法解析配置，需要将create替换成generate

mvn archetype:creat(generate) -Dgroupid=org.seckill -DartifictId=seckill -DarchetypeArtifactId=maven-archetype-webapp

```
#### 秒杀业务分析
![秒杀业务流程图](http://i1.piimg.com/519918/c0a3bc5d0b9acb94.png)
秒杀的核心-->库存的处理

用户对库存业务分析
减库存     记录购买明细
|               |
    完整事务
       |
    数据落地
![用户对库存业务分析图](http://p1.bpimg.com/519918/225cac6b0e29ac49.png)

什么是购买行为？
* 谁购买成功了？
* 成功的时间/有效期
* 付款/发货信息

为什么需要事务？

* 减去库存没有记录购买明细
* 忘了明细没有减去库存
* 出现超卖/少卖

故障的责任是谁？

程序员背黑锅

MySQL VS NoSQL

事务机制依然是目前最可靠的落地方案

#### MySQL实现秒杀系统的难点分析

难点问题-竞争

用户1-用户2-...-用户n

秒杀活动：“100元秒杀ipad”

事务+行级锁

Start Transaction
Update 库存数量
Insert 购买明细
Commit

行级锁：
update table set num = num -1 where id = 10 and num>1;
update table set num = num -1 where id = 10 and num>1;

修改-->等待
id = 10,name="100元秒杀ipad" ...

秒杀的难点-->如何高效的处理竞争

天猫的秒杀库存系统
![](http://p1.bpimg.com/519918/5c60acd0145323c7.jpg)

#### 秒杀功能

* 秒杀接口暴露
* 执行秒杀 
* 相关查询

#### 代码开发阶段
DAO层设计编码
Service设计编码
Web设计编码


#### 数据库设计编码

#### DAO层设计与接口编码





