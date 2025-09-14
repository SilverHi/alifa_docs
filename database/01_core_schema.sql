-- 医疗平台核心数据库设计 DDL
-- 包含：医生信息、患者问答、全局配置、多语言支持

-- 1. 医生基本信息表
CREATE TABLE doctors (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL COMMENT '医生姓名',
    title VARCHAR(50) NOT NULL COMMENT '职称：主任医师、副主任医师、主治医师等',
    hospital_name VARCHAR(200) NOT NULL COMMENT '所属医院全称',
    department VARCHAR(100) NOT NULL COMMENT '科室名称',
    hospital_ranking VARCHAR(200) COMMENT '医院权威排名信息',
    avatar_url VARCHAR(500) COMMENT '医生头像URL',
    
    -- 专业资质信息
    education_background TEXT COMMENT '学历背景（医学院校、学位信息）',
    years_of_experience INT COMMENT '从业年限',
    specialties TEXT COMMENT '专业特长领域详细描述',
    disease_expertise TEXT COMMENT '擅长治疗的疾病类型',
    technical_skills TEXT COMMENT '诊疗技术专长',
    academic_positions TEXT COMMENT '学术职务',
    published_papers_count INT DEFAULT 0 COMMENT '发表论文数量',
    
    -- 患者教育视频分类标签
    video_categories JSON COMMENT '视频分类标签数组',
    
    -- 系统字段
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_hospital_dept (hospital_name, department),
    INDEX idx_title (title),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='医生基本信息表';

-- 2. 患者问答表
CREATE TABLE doctor_qa (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    doctor_id BIGINT NOT NULL COMMENT '医生ID',
    question TEXT NOT NULL COMMENT '患者问题',
    answer TEXT NOT NULL COMMENT '医生回复',
    likes_count INT DEFAULT 0 COMMENT 'AI生成的点赞数',
    helpful_count INT DEFAULT 0 COMMENT 'AI生成的有用评价数',
    
    -- 系统字段
    status TINYINT DEFAULT 1 COMMENT '状态：1-显示，0-隐藏',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE CASCADE,
    INDEX idx_doctor_status (doctor_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='医生患者问答表';

-- 3. 全局配置表（Key-Value存储）
CREATE TABLE global_configs (
    config_key VARCHAR(100) PRIMARY KEY COMMENT '配置键',
    config_value LONGTEXT NOT NULL COMMENT '配置值（支持JSON格式）',
    config_type VARCHAR(50) NOT NULL COMMENT '配置类型：handbook, service_info, language等',
    description VARCHAR(500) COMMENT '配置描述',
    
    -- 系统字段
    status TINYINT DEFAULT 1 COMMENT '状态：1-启用，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_type_status (config_type, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='全局配置表';

-- 4. 多语言支持表
CREATE TABLE translations (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    source_key VARCHAR(200) NOT NULL COMMENT '翻译键',
    language_code VARCHAR(10) NOT NULL COMMENT '语言代码：zh-CN, en-US, ja-JP等',
    translated_text TEXT NOT NULL COMMENT '翻译文本',
    category VARCHAR(50) DEFAULT 'general' COMMENT '分类：medical_terms, ui, content等',
    
    -- 系统字段
    status TINYINT DEFAULT 1 COMMENT '状态：1-启用，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY uk_key_lang (source_key, language_code),
    INDEX idx_category_lang (category, language_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='多语言翻译表';

-- 初始化全局配置数据 - 医生页面相关
INSERT INTO global_configs (config_key, config_value, config_type, description) VALUES
('translation_service_handbook', '{}', 'handbook', '翻译服务预约功能手册'),
('international_insurance_handbook', '{}', 'handbook', '国际医疗保险接受说明手册'),
('foreign_patient_guide', '{}', 'handbook', '外籍患者就诊流程指导手册'),
('international_medical_standards', '{}', 'handbook', '国际标准医疗流程说明手册'),
('cultural_sensitivity_guide', '{}', 'handbook', '文化敏感性医疗服务介绍手册'),
('religious_considerations', '{}', 'handbook', '宗教信仰考虑指导手册'),
('visa_medical_certificate', '{}', 'handbook', '签证医疗证明开具服务手册'),
('international_referral_service', '{}', 'handbook', '国际转诊协调服务手册'),
('translation_quality_assurance', '{}', 'handbook', '医疗翻译质量保证说明手册');

-- 创建视图：医生完整信息视图
CREATE VIEW doctor_full_info AS
SELECT 
    d.*,
    COUNT(qa.id) as qa_count,
    AVG(qa.likes_count) as avg_likes,
    AVG(qa.helpful_count) as avg_helpful
FROM doctors d
LEFT JOIN doctor_qa qa ON d.id = qa.doctor_id AND qa.status = 1
WHERE d.status = 1
GROUP BY d.id;