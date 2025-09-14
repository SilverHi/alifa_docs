# 医生页面数据需求文档
# Doctor Page Data Requirements Document

## 一、页面核心板块结构
## I. Core Page Module Structure

医生档案页面应包含以下核心板块：
The doctor profile page should include the following core modules:
1. 医生基本信息头部区域
   Doctor basic information header area
2. 专业资质与简介
   Professional qualifications and introduction
3. 患者教育视频内容
   Patient education video content
4. 患者问答互动区
   Patient Q&A interaction area

## 二、各板块数据要求
## II. Data Requirements for Each Module

### 2.1 医生基本信息
### 2.1 Doctor Basic Information
包含以下要素：
Contains the following elements:
- 医生姓名 + 职称（如：主任医师、副主任医师、主治医师）
  Doctor name + title (e.g., Chief Physician, Associate Chief Physician, Attending Physician)
- 所属医院全称（包括大学附属医院信息）
  Full name of affiliated hospital (including university affiliated hospital information)
- 科室名称（如：妇产科、心内科、神经外科等）
  Department name (e.g., Obstetrics and Gynecology, Cardiology, Neurosurgery, etc.)
- 医院权威排名信息（如：全国医院综合实力排行榜第X名）
  Hospital authoritative ranking information (e.g., National Hospital Comprehensive Strength Ranking No. X)
- 医生头像（专业形象照）
  Doctor avatar (professional portrait)

### 2.2 专业资质展示
### 2.2 Professional Qualifications Display
构建医生专业背景描述，包含：
Build doctor professional background description, including:
- 学历背景（医学院校、学位信息）
  Educational background (medical schools, degree information)
- 从业年限具体数字
  Specific number of years of practice
- 专业特长领域详细描述
  Detailed description of professional specialty areas
- 擅长治疗的疾病类型
  Types of diseases specialized in treating
- 诊疗技术专长
  Diagnostic and therapeutic technical expertise
- 学术职务（如：学会委员、专业组成员）
  Academic positions (e.g., society committee member, professional group member)
- 发表论文数量统计
  Statistics of published papers

### 2.3 患者教育视频内容
### 2.3 Patient Education Video Content
**注：使用 video playlist 插件实现**
**Note: Implemented using video playlist plugin**
- 分类标签（如：妊娠期、产后恢复、疾病预防）
  Category tags (e.g., pregnancy, postpartum recovery, disease prevention)

### 2.4 患者互动问答
### 2.4 Patient Interactive Q&A
设计互动问答版块：
Design interactive Q&A section:
- 常见患者咨询问题列表
  List of common patient consultation questions
- 医生回复内容（专业但易懂）
  Doctor reply content (professional but easy to understand)
- 问答点赞和有用性评价（AI生成虚假的点赞数和评价）
  Q&A likes and usefulness ratings (AI-generated fake likes and ratings)

## 三、外籍患者特殊需求
## III. Special Requirements for Foreign Patients

### 3.1 语言服务
### 3.1 Language Services
为外籍患者提供：
Provide for foreign patients:
- 多语言切换功能（英语、日语、韩语等）**[框架支持]**
  Multi-language switching function (English, Japanese, Korean, etc.) **[Framework support]**
- 医学术语中英文对照**[数据获取时插入文本里]**
  Chinese-English medical terminology comparison **[Insert into text during data acquisition]**
- 翻译服务预约功能**[AI生成全局唯一手册]**
  Translation service appointment function **[AI-generated global unique manual]**
- 国际医疗保险接受说明**[AI生成全局唯一手册]**
  International medical insurance acceptance instructions **[AI-generated global unique manual]**
- 外籍患者就诊流程专门指导**[AI生成全局唯一手册]**
  Specialized guidance for foreign patient consultation process **[AI-generated global unique manual]**

### 3.2 跨文化医疗服务
### 3.2 Cross-cultural Medical Services
考虑外籍患者需求：
Consider foreign patient needs:
- 国际标准医疗流程说明**[AI生成全局唯一手册]**
  International standard medical process instructions **[AI-generated global unique manual]**
- 文化敏感性医疗服务介绍**[AI生成全局唯一手册]**
  Cultural sensitivity medical service introduction **[AI-generated global unique manual]**
- 宗教信仰考虑（如清真饮食、祷告时间等）**[AI生成全局唯一手册]**
  Religious belief considerations (e.g., halal diet, prayer time, etc.) **[AI-generated global unique manual]**
- 签证医疗证明开具服务**[AI生成全局唯一手册]**
  Visa medical certificate issuance service **[AI-generated global unique manual]**
- 国际转诊协调服务**[AI生成全局唯一手册]**
  International referral coordination service **[AI-generated global unique manual]**
- 医疗翻译质量保证说明**[AI生成全局唯一手册]**
  Medical translation quality assurance instructions **[AI-generated global unique manual]**

## 四、实施说明
## IV. Implementation Instructions

### 数据获取策略
### Data Acquisition Strategy
- **框架支持功能**：直接使用现有技术框架实现
  **Framework support functions**: Directly implemented using existing technical frameworks
- **AI生成内容**：对于数据获取复杂或需要统一标准的内容，使用AI生成
  **AI-generated content**: Use AI generation for content with complex data acquisition or requiring unified standards
- **全局唯一手册**：外籍患者相关服务说明统一制作，避免重复开发
  **Global unique manuals**: Unified production of foreign patient-related service instructions to avoid duplicate development

### 注意事项
### Notes
- 保持页面简洁，避免过度复杂的功能入口
  Keep pages concise and avoid overly complex functional entrances
- 重点突出医生专业能力和患者服务质量
  Focus on highlighting doctor professional capabilities and patient service quality
- 确保生成内容的专业性和可信度
  Ensure professionalism and credibility of generated content