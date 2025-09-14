# 医院页面数据需求文档
# Hospital Page Data Requirements Document

## 一、页面核心板块结构
## I. Core Page Module Structure

医院页面应包含以下核心板块：
The hospital page should include the following core modules:
1. 医院基础信息
   Hospital basic information
2. 医疗技术实力
   Medical technical strength
3. 国际医疗服务体系
   International medical service system
4. 语言文化服务
   Language and cultural services
5. 签证及入境服务
   Visa and entry services
6. 医疗专家团队
   Medical expert team
7. 团队协作能力
   Team collaboration capabilities

## 二、各板块数据要求
## II. Data Requirements for Each Module

### 2.1 医院基础信息
### 2.1 Hospital Basic Information
需要存储的数据：
Data that needs to be stored:
- 医院中英全称
  Hospital full name in Chinese and English
- 等级分类（只要三甲等）
  Grade classification (Grade A tertiary only)
- 详细地址
  Detailed address
- 建院历史
  Hospital founding history
- 发展历程
  Development process
- 服务国际患者年限
  Years of serving international patients
- 与国际知名医疗机构的合作伙伴关系**[metaso搜索获取]**
  Partnership with internationally renowned medical institutions **[metaso search acquisition]**

固定页面显示（不需要存储）：
Fixed page display (no storage needed):
- 卫健委批准资质、医疗机构执业许可证信息
  National Health Commission approved qualifications, medical institution practice license information
- 国际认证（JCI、ISO9001等）及政府监管合规情况
  International certifications (JCI, ISO9001, etc.) and government regulatory compliance
- 患者安全记录、满意度指标及投诉处理机制
  Patient safety records, satisfaction indicators and complaint handling mechanisms
- 数字化服务平台及多语言在线服务能力
  Digital service platform and multilingual online service capabilities

### 2.2 医疗技术实力
### 2.2 Medical Technical Strength
需要存储的数据（metaso搜索获取）：
Data that needs to be stored (metaso search acquisition):
- 重点专科建设情况、国家临床重点专科认定
  Key specialty construction status, national clinical key specialty certification
- 核心诊疗技术、成功率统计及临床效果数据
  Core diagnostic and therapeutic technologies, success rate statistics and clinical effect data
- 先进医疗设备配置、影像诊断及手术器械
  Advanced medical equipment configuration, imaging diagnosis and surgical instruments
- 科研实力、临床试验项目及学术声誉
  Research strength, clinical trial projects and academic reputation
- 质量控制体系、持续改进措施及医疗安全管理
  Quality control system, continuous improvement measures and medical safety management

固定页面显示（不需要存储）：
Fixed page display (no storage needed):
- 多学科协作诊疗（MDT）模式及会诊机制
  Multidisciplinary collaborative diagnosis and treatment (MDT) model and consultation mechanism
- 急诊急救能力、24小时医疗服务保障
  Emergency rescue capabilities, 24-hour medical service guarantee
- 国际医疗服务体系
  International medical service system

### 2.3 语言文化服务
### 2.3 Language and Cultural Services
**注：固定页面显示，不需要存储**
**Note: Fixed page display, no storage needed**
- 专业医学翻译团队配置（英语、俄语、阿拉伯语等）
  Professional medical translation team configuration (English, Russian, Arabic, etc.)
- 跨文化沟通培训及文化敏感性服务
  Cross-cultural communication training and cultural sensitivity services
- 宗教信仰尊重、清真餐饮及祷告设施
  Religious belief respect, halal catering and prayer facilities
- 国际患者专属服务流程及绿色通道
  Exclusive service process and green channel for international patients
- 家属陪护政策及儿童照护服务
  Family care policies and child care services
- 心理支持及康复指导服务
  Psychological support and rehabilitation guidance services

### 2.4 签证及入境服务
### 2.4 Visa and Entry Services
需要存储的数据：
Data that needs to be stored:
- 住宿安排（院内宾馆、周边酒店推荐）**[metaso搜索获取]**
  Accommodation arrangements (in-hospital guesthouse, nearby hotel recommendations) **[metaso search acquisition]**

固定页面显示（不需要存储）：
Fixed page display (no storage needed):
- 医疗签证邀请函办理流程及时限
  Medical visa invitation letter processing procedures and time limits
- 与各国领事馆合作关系及签证便利政策
  Cooperation with consulates of various countries and visa facilitation policies
- 机场接送服务及专车配置
  Airport transfer service and dedicated vehicle configuration
- 本地交通指南及城市生活服务
  Local transportation guide and city life services
- 紧急联络机制及24小时客服热线
  Emergency contact mechanism and 24-hour customer service hotline

### 2.5 医疗专家团队
### 2.5 Medical Expert Team
**注：已有医生表，关联即可**
**Note: Doctor table already exists, just associate**
专家资质展示：
Expert qualification display:
- 主治医生详细履历、学术背景及专业认证
  Detailed resume, academic background and professional certification of attending physicians
- 海外培训经历、国际学术交流及合作项目
  Overseas training experience, international academic exchanges and cooperation projects
- 语言能力认证及国际医学资格证书
  Language proficiency certification and international medical qualification certificates
- 科研成果、学术论文发表及专利技术
  Research achievements, academic paper publications and patent technologies
- 患者案例分享、治疗效果展示及康复故事
  Patient case sharing, treatment effect display and recovery stories
- 继续教育参与及专业技能更新机制
  Continuing education participation and professional skill update mechanism

### 2.6 团队协作能力
### 2.6 Team Collaboration Capabilities
**注：固定页面显示，不需要存储**
**Note: Fixed page display, no storage needed**
- 护理团队专业水平及国际服务经验
  Professional level of nursing team and international service experience
- 医技科室配合能力及检查预约便利性
  Medical technology department cooperation ability and examination appointment convenience
- 药学服务、用药指导及国际药品采购
  Pharmaceutical services, medication guidance and international drug procurement
- 康复治疗师资质及物理治疗设施
  Rehabilitation therapist qualifications and physical therapy facilities
- 营养师配置及个性化饮食方案
  Nutritionist configuration and personalized diet plans
- 社工服务及患者权益保护措施
  Social work services and patient rights protection measures

## 三、实施说明
## III. Implementation Instructions

### 数据获取策略
### Data Acquisition Strategy
- **固定页面内容**：直接在前端页面中硬编码显示
  **Fixed page content**: Directly hard-coded display in frontend pages
- **Metaso搜索获取**：合作伙伴关系、技术实力、住宿安排等
  **Metaso search acquisition**: Partnership relationships, technical strength, accommodation arrangements, etc.
- **关联现有数据**：医疗专家团队直接关联医生表
  **Associate existing data**: Medical expert team directly associated with doctor table

### 注意事项
### Notes
- 突出医院的国际化服务能力
  Highlight the hospital's international service capabilities
- 重点展示医疗技术实力和专业认证
  Focus on displaying medical technical strength and professional certifications
- 体现对国际患者的全方位服务保障
  Reflect comprehensive service guarantee for international patients
- 确保信息的权威性和可信度
  Ensure the authority and credibility of information