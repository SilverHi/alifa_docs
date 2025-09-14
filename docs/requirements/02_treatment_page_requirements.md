# 治疗方案页面数据需求文档
# Treatment Plan Page Data Requirements Document

## 一、页面核心板块结构
## I. Core Page Module Structure

治疗方案页面应包含以下核心板块：
The treatment plan page should include the following core modules:
1. 页面标题结构
   Page title structure
2. 核心医疗服务承诺框架
   Core medical service commitment framework
3. 价格与医保结构
   Price and medical insurance structure
4. 医生团队展示框架
   Medical team display framework
5. 医院实力展示结构
   Hospital strength display structure
6. 住宿安排本土化框架
   Accommodation arrangement localization framework
7. 诊疗流程和康复计划
   Treatment process and rehabilitation plan
8. 中国特色附加服务框架
   Chinese characteristic additional service framework
9. 风险告知和质量保障
   Risk notification and quality assurance
10. 套餐详情
    Package details
11. FAQ本土化设计
    FAQ localization design

## 二、各板块数据要求
## II. Data Requirements for Each Module

### 2.1 页面标题结构
### 2.1 Page Title Structure
包含以下要素：
Contains the following elements:
- 执行医院的全称（中英文名称）
  Full name of executing hospital (Chinese and English names)
- 城市地理位置（一线城市优先：北京/上海/广州/深圳）
  City geographical location (first-tier cities priority: Beijing/Shanghai/Guangzhou/Shenzhen)
- 三甲医院等级标识
  Grade A tertiary hospital level identification
- 专科特色标签（如：国家临床重点专科）
  Specialty feature tags (e.g., National Clinical Key Specialty)

示例格式：《[治疗项目] - [三甲医院全称] - [城市名]》
Example format: 《[Treatment Project] - [Grade A Tertiary Hospital Full Name] - [City Name]》

### 2.2 核心医疗服务承诺框架
### 2.2 Core Medical Service Commitment Framework
**注：固定在页面中显示固定的内容，不需要获取数据**
**Note: Fixed content displayed on the page, no data acquisition needed**
- 国家卫健委资质认证
  National Health Commission qualification certification
- 医院三甲等级证书
  Hospital Grade A tertiary level certificate
- 专家号预约保障
  Expert appointment guarantee
- 医保/异地就医结算支持
  Medical insurance/cross-regional medical settlement support
- 中西医结合治疗方案
  Integrated traditional Chinese and Western medicine treatment plan
- 术后康复指导
  Post-operative rehabilitation guidance
- 随访服务体系
  Follow-up service system
- 医疗纠纷处理机制
  Medical dispute handling mechanism

### 2.3 价格与医保结构
### 2.3 Price and Medical Insurance Structure
- 套餐总费用（人民币计价）**[采用metaso获取相对准确的价格]**
  Total package cost (RMB pricing) **[Use metaso to obtain relatively accurate prices]**
- 商业保险合作方案**[使用全局固定的描述]**
  Commercial insurance cooperation plan **[Use global fixed description]**
- 分期付款选项**[使用全局固定的描述]**
  Installment payment options **[Use global fixed description]**
- 预付金制度**[使用全局固定的描述]**
  Prepayment system **[Use global fixed description]**
- 国际价格比对分析
  International price comparison analysis
- 性价比优势说明**[使用全局固定的描述]**
  Cost-effectiveness advantage description **[Use global fixed description]**

### 2.4 医生团队展示框架
### 2.4 Medical Team Display Framework
- 主任医师/教授职称（医生名称英文拼音）
  Chief physician/professor title (doctor name in English pinyin)
- 学术兼职（学会主委/副主委）**[使用AI生成]**
  Academic positions (society chairman/vice chairman) **[Use AI generation]**
- 从业年限和手术例数**[使用AI生成]**
  Years of practice and number of surgical cases **[Use AI generation]**
- 核心技术专长**[使用AI生成]**
  Core technical expertise **[Use AI generation]**
- 科研成果和获奖情况**[使用AI生成]**
  Research achievements and awards **[Use AI generation]**
- 国际交流背景**[使用AI生成]**
  International exchange background **[Use AI generation]**
- 患者评价和口碑**[使用AI生成]**
  Patient reviews and reputation **[Use AI generation]**

### 2.5 医院实力展示结构
### 2.5 Hospital Strength Display Structure
- 医院历史和发展沿革**[使用AI生成]**
  Hospital history and development **[Use AI generation]**
- 三甲医院等级和复审情况**[固定在页面中，不需要存储]**
  Grade A tertiary hospital level and review status **[Fixed on page, no storage needed]**
- 国家临床重点专科数量**[使用metaso搜索生成]**
  Number of national clinical key specialties **[Use metaso search generation]**
- 床位规模和科室设置**[使用metaso搜索生成]**
  Bed capacity and department setup **[Use metaso search generation]**
- 先进医疗设备配置**[使用metaso搜索生成]**
  Advanced medical equipment configuration **[Use metaso search generation]**
- 年门诊量和手术量**[使用metaso搜索生成]**
  Annual outpatient volume and surgical volume **[Use metaso search generation]**
- 医院荣誉和认证**[使用metaso搜索生成]**
  Hospital honors and certifications **[Use metaso search generation]**
- 国际医疗质量认证（JCI等）**[使用metaso搜索生成]**
  International medical quality certification (JCI, etc.) **[Use metaso search generation]**
- 医联体和协作医院网络**[使用metaso搜索生成]**
  Medical alliance and cooperative hospital network **[Use metaso search generation]**

### 2.6 住宿安排本土化框架
### 2.6 Accommodation Arrangement Localization Framework
- 医院附近星级酒店合作**[使用metaso搜索生成]**
  Cooperation with star hotels near the hospital **[Use metaso search generation]**
- 医院内部家属陪护设施**[使用metaso搜索生成]**
  Internal hospital family care facilities **[Use metaso search generation]**
- 营养配餐服务（考虑地方饮食习惯）**[固定页面显示不需要存储]**
  Nutritional catering service (considering local dietary habits) **[Fixed page display, no storage needed]**
- 家属休息区和配套设施**[固定页面显示不需要存储]**
  Family rest area and supporting facilities **[Fixed page display, no storage needed]**
- Wi-Fi和娱乐设施**[固定页面显示不需要存储]**
  Wi-Fi and entertainment facilities **[Fixed page display, no storage needed]**
- 洗衣和生活便民服务**[固定页面显示不需要存储]**
  Laundry and daily convenience services **[Fixed page display, no storage needed]**
- 周边商业配套介绍**[固定页面显示不需要存储]**
  Surrounding commercial facilities introduction **[Fixed page display, no storage needed]**
- 交通便利性说明**[固定页面显示不需要存储]**
  Transportation convenience description **[Fixed page display, no storage needed]**

### 2.7 诊疗流程和康复计划
### 2.7 Treatment Process and Rehabilitation Plan
**注：固定页面显示不需要存储**
**Note: Fixed page display, no storage needed**
- 入院前健康评估
  Pre-admission health assessment
- 多学科会诊制度（MDT）
  Multidisciplinary consultation system (MDT)
- 个性化治疗方案
  Personalized treatment plan
- 手术操作规范
  Surgical operation standards
- 术后监护标准
  Post-operative monitoring standards
- 康复训练计划
  Rehabilitation training plan
- 出院指导和随访
  Discharge guidance and follow-up
- 复查时间安排
  Re-examination schedule
- 紧急情况处理预案
  Emergency situation handling plan

### 2.8 中国特色附加服务框架
### 2.8 Chinese Characteristic Additional Service Framework
**注：固定页面显示不需要存储**
**Note: Fixed page display, no storage needed**
- 专家号预约绿色通道
  Expert appointment green channel
- 中医药康复方案
  Traditional Chinese medicine rehabilitation plan
- 营养师膳食指导
  Nutritionist dietary guidance
- 心理咨询和疏导
  Psychological counseling and guidance
- 医学翻译和沟通
  Medical translation and communication
- 医疗档案数字化管理
  Digital medical record management
- 互联网医院远程随访
  Internet hospital remote follow-up
- 健康管理App服务
  Health management App service

### 2.9 风险告知和质量保障
### 2.9 Risk Notification and Quality Assurance
- 治疗适应症和禁忌症**[metaso搜索获取]**
  Treatment indications and contraindications **[metaso search acquisition]**
- 手术风险和并发症说明**[metaso搜索获取]**
  Surgical risks and complications description **[metaso search acquisition]**
- 医疗质量控制措施**[固定页面显示不需要存储]**
  Medical quality control measures **[Fixed page display, no storage needed]**
- 医疗安全保障制度**[固定页面显示不需要存储]**
  Medical safety assurance system **[Fixed page display, no storage needed]**
- 医疗责任保险覆盖**[固定页面显示不需要存储]**
  Medical liability insurance coverage **[Fixed page display, no storage needed]**
- 医疗纠纷调解机制**[固定页面显示不需要存储]**
  Medical dispute mediation mechanism **[Fixed page display, no storage needed]**
- 患者权益保护措施**[固定页面显示不需要存储]**
  Patient rights protection measures **[Fixed page display, no storage needed]**
- 知情同意和隐私保护**[固定页面显示不需要存储]**
  Informed consent and privacy protection **[Fixed page display, no storage needed]**

### 2.10 套餐详情
### 2.10 Package Details
**注：只保留总价和打折价格**
**Note: Only retain total price and discounted price**
- 套餐总价
  Package total price
- 优惠价格
  Discounted price

### 2.11 FAQ本土化设计
### 2.11 FAQ Localization Design
**注：全局唯一，使用AI生成**
**Note: Globally unique, use AI generation**
- 医保报销政策和比例
  Medical insurance reimbursement policies and ratios
- 异地就医备案流程
  Cross-regional medical treatment filing process
- 专家号预约方式
  Expert appointment methods
- 住院手续办理
  Hospitalization procedures
- 陪护人员安排
  Caregiver arrangements
- 饮食和生活安排
  Diet and living arrangements
- 康复周期和效果
  Rehabilitation cycle and effects
- 复查和随访安排
  Re-examination and follow-up arrangements
- 医疗纠纷处理
  Medical dispute handling
- 服务投诉渠道
  Service complaint channels

## 三、实施说明
## III. Implementation Instructions

### 数据获取策略
### Data Acquisition Strategy
- **固定页面内容**：直接在前端页面中硬编码显示
  **Fixed page content**: Directly hard-coded display in frontend pages
- **AI生成内容**：医生团队信息、医院历史等使用AI生成
  **AI-generated content**: Use AI generation for medical team information, hospital history, etc.
- **Metaso搜索获取**：价格信息、医院实力数据、住宿信息等
  **Metaso search acquisition**: Price information, hospital strength data, accommodation information, etc.
- **全局唯一内容**：FAQ等统一制作，避免重复开发
  **Globally unique content**: Unified production of FAQ, etc., to avoid duplicate development

### 注意事项
### Notes
- 突出权威性和专业性
  Highlight authority and professionalism
- 体现中国医疗体系特色
  Reflect the characteristics of China's medical system
- 确保价格信息的准确性和透明度
  Ensure accuracy and transparency of price information
- 重点关注患者关切的实际问题
  Focus on actual issues of patient concern