# 医疗平台数据规格说明
# Medical Platform Data Specification

本目录包含医疗平台各页面的详细数据规格和实施指导。
This directory contains detailed data specifications and implementation guidance for each page of the medical platform.

## 文档结构
## Document Structure

### 需求文档 (requirements/)
### Requirements Documents (requirements/)
- `01_doctor_page_requirements.md` - 医生页面数据需求
  Doctor page data requirements
- `02_treatment_page_requirements.md` - 治疗方案页面数据需求
  Treatment plan page data requirements
- `03_hospital_page_requirements.md` - 医院页面数据需求
  Hospital page data requirements

### 数据库设计 (database/)
### Database Design (database/)
- `01_core_schema.sql` - 核心数据库结构（医生、全局配置等）
  Core database structure (doctors, global configurations, etc.)
- `02_treatment_schema.sql` - 治疗方案相关表结构
  Treatment plan related table structure
- `03_hospital_schema.sql` - 医院相关表结构扩展
  Hospital related table structure extension

## 数据获取策略
## Data Acquisition Strategy

### 1. 固定页面内容
### 1. Fixed Page Content
直接在前端页面硬编码显示，无需数据库存储：
Directly hard-coded display in frontend pages, no database storage required:
- 医疗服务承诺框架
  Medical service commitment framework
- 诊疗流程说明
  Treatment process instructions
- 语言文化服务
  Language and cultural services
- 团队协作能力等
  Team collaboration capabilities, etc.

### 2. AI生成内容
### 2. AI Generated Content
使用AI生成虚假但合理的数据：
Use AI to generate fake but reasonable data:
- 医生团队详细信息
  Detailed medical team information
- 医院历史发展
  Hospital history and development
- 患者评价和口碑
  Patient reviews and reputation
- FAQ内容等
  FAQ content, etc.

### 3. Metaso搜索获取
### 3. Metaso Search Acquisition
通过搜索引擎获取相对准确的数据：
Obtain relatively accurate data through search engines:
- 治疗方案价格信息
  Treatment plan price information
- 医院实力数据
  Hospital strength data
- 住宿安排信息
  Accommodation arrangement information
- 医院合作伙伴关系等
  Hospital partnership relationships, etc.

### 4. 全局唯一内容
### 4. Globally Unique Content
统一制作，避免重复开发：
Unified production to avoid duplicate development:
- 外籍患者服务手册
  Foreign patient service manual
- 医疗保险说明
  Medical insurance instructions
- 支付方式说明等
  Payment method instructions, etc.

## 实施原则
## Implementation Principles

1. **数据分离**：固定内容与动态数据分离存储
   **Data Separation**: Separate storage of fixed content and dynamic data
2. **性能优化**：合理使用缓存和索引
   **Performance Optimization**: Reasonable use of cache and indexing
3. **扩展性**：支持多语言和国际化
   **Scalability**: Support for multilingual and internationalization
4. **一致性**：统一的数据格式和命名规范
   **Consistency**: Unified data format and naming conventions
5. **可维护性**：清晰的表结构和关联关系
   **Maintainability**: Clear table structure and relationships