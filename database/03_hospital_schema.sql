-- 医院页面数据库设计 DDL

-- 1. 医院信息表
CREATE TABLE hospitals (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL COMMENT '医院中文名称',
    name_en VARCHAR(200) COMMENT '医院英文名称',
    city VARCHAR(50) NOT NULL COMMENT '所在城市',
    address TEXT COMMENT '详细地址',
    hospital_level VARCHAR(50) DEFAULT '三甲' COMMENT '医院等级',
    
    -- 基础信息
    founding_history TEXT COMMENT '建院历史',
    development_process TEXT COMMENT '发展历程',
    international_service_years INT COMMENT '服务国际患者年限',
    
    -- 医院实力信息（metaso搜索获取）
    international_partnerships TEXT COMMENT '与国际知名医疗机构的合作伙伴关系',
    key_specialties_count INT COMMENT '国家临床重点专科数量',
    core_technologies TEXT COMMENT '核心诊疗技术',
    success_rates TEXT COMMENT '成功率统计及临床效果数据',
    bed_capacity INT COMMENT '床位规模',
    department_setup TEXT COMMENT '科室设置',
    medical_equipment TEXT COMMENT '先进医疗设备配置',
    annual_outpatient_volume INT COMMENT '年门诊量',
    annual_surgery_volume INT COMMENT '年手术量',
    honors_certifications TEXT COMMENT '医院荣誉和认证',
    international_certifications TEXT COMMENT '国际医疗质量认证（JCI等）',
    medical_alliance TEXT COMMENT '医联体和协作医院网络',
    research_strength TEXT COMMENT '科研实力、临床试验项目及学术声誉',
    quality_control_system TEXT COMMENT '质量控制体系、持续改进措施及医疗安全管理',
    
    -- 住宿信息（metaso搜索获取）
    internal_accommodation TEXT COMMENT '院内宾馆信息',
    nearby_hotels TEXT COMMENT '医院附近星级酒店合作',
    family_facilities TEXT COMMENT '医院内部家属陪护设施',
    recommended_hotels TEXT COMMENT '周边酒店推荐',
    
    -- 系统字段
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_city_status (city, status),
    INDEX idx_name (name),
    INDEX idx_hospital_level (hospital_level)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='医院信息表';

-- 2. 医院与医生关联表
CREATE TABLE hospital_doctors (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    hospital_id BIGINT NOT NULL COMMENT '医院ID',
    doctor_id BIGINT NOT NULL COMMENT '医生ID',
    
    -- 国际化专业信息
    overseas_training TEXT COMMENT '海外培训经历',
    international_exchanges TEXT COMMENT '国际学术交流及合作项目',
    language_certifications TEXT COMMENT '语言能力认证',
    international_qualifications TEXT COMMENT '国际医学资格证书',
    research_achievements TEXT COMMENT '科研成果、学术论文发表及专利技术',
    patient_cases TEXT COMMENT '患者案例分享、治疗效果展示及康复故事',
    continuing_education TEXT COMMENT '继续教育参与及专业技能更新机制',
    
    -- 系统字段
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (hospital_id) REFERENCES hospitals(id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE CASCADE,
    UNIQUE KEY uk_hospital_doctor (hospital_id, doctor_id),
    INDEX idx_hospital_status (hospital_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='医院医生关联表';

-- 3. 医院科室表（可选，用于更详细的科室管理）
CREATE TABLE hospital_departments (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    hospital_id BIGINT NOT NULL COMMENT '医院ID',
    department_name VARCHAR(100) NOT NULL COMMENT '科室名称',
    department_name_en VARCHAR(100) COMMENT '科室英文名称',
    description TEXT COMMENT '科室描述',
    head_doctor_id BIGINT COMMENT '科室主任医生ID',
    
    -- 科室特色信息
    specialties TEXT COMMENT '专业特长',
    equipment TEXT COMMENT '科室设备',
    services TEXT COMMENT '服务项目',
    
    -- 系统字段
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (hospital_id) REFERENCES hospitals(id) ON DELETE CASCADE,
    FOREIGN KEY (head_doctor_id) REFERENCES doctors(id),
    INDEX idx_hospital_status (hospital_id, status),
    INDEX idx_department_name (department_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='医院科室表';

-- 4. 医生科室关联表
CREATE TABLE doctor_departments (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    doctor_id BIGINT NOT NULL COMMENT '医生ID',
    department_id BIGINT NOT NULL COMMENT '科室ID',
    position VARCHAR(50) COMMENT '职务：主任、副主任、主治医师等',
    
    -- 系统字段
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES hospital_departments(id) ON DELETE CASCADE,
    UNIQUE KEY uk_doctor_department (doctor_id, department_id),
    INDEX idx_department_status (department_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='医生科室关联表';

-- 扩展全局配置表（添加医院相关固定内容）
INSERT INTO global_configs (config_key, config_value, config_type, description) VALUES
-- 医院基础信息固定内容
('hospital_qualifications_info', '{}', 'static_content', '卫健委批准资质、医疗机构执业许可证信息'),
('international_certifications_info', '{}', 'static_content', '国际认证（JCI、ISO9001等）及政府监管合规情况'),
('patient_safety_satisfaction', '{}', 'static_content', '患者安全记录、满意度指标及投诉处理机制'),
('digital_multilingual_services', '{}', 'static_content', '数字化服务平台及多语言在线服务能力'),

-- 医疗技术实力固定内容
('mdt_consultation_mechanism', '{}', 'static_content', '多学科协作诊疗（MDT）模式及会诊机制'),
('emergency_24h_services', '{}', 'static_content', '急诊急救能力、24小时医疗服务保障'),
('international_medical_system', '{}', 'static_content', '国际医疗服务体系'),

-- 语言文化服务固定内容
('medical_translation_team', '{}', 'static_content', '专业医学翻译团队配置'),
('cross_cultural_communication', '{}', 'static_content', '跨文化沟通培训及文化敏感性服务'),
('religious_respect_services', '{}', 'static_content', '宗教信仰尊重、清真餐饮及祷告设施'),
('international_patient_services', '{}', 'static_content', '国际患者专属服务流程及绿色通道'),
('family_care_policies', '{}', 'static_content', '家属陪护政策及儿童照护服务'),
('psychological_rehabilitation_support', '{}', 'static_content', '心理支持及康复指导服务'),

-- 签证及入境服务固定内容
('medical_visa_invitation_process', '{}', 'static_content', '医疗签证邀请函办理流程及时限'),
('consulate_cooperation_policies', '{}', 'static_content', '与各国领事馆合作关系及签证便利政策'),
('airport_transfer_services', '{}', 'static_content', '机场接送服务及专车配置'),
('local_transportation_guide', '{}', 'static_content', '本地交通指南及城市生活服务'),
('emergency_contact_24h_hotline', '{}', 'static_content', '紧急联络机制及24小时客服热线'),

-- 团队协作能力固定内容
('nursing_team_international_experience', '{}', 'static_content', '护理团队专业水平及国际服务经验'),
('medical_technology_cooperation', '{}', 'static_content', '医技科室配合能力及检查预约便利性'),
('pharmacy_international_services', '{}', 'static_content', '药学服务、用药指导及国际药品采购'),
('rehabilitation_therapist_facilities', '{}', 'static_content', '康复治疗师资质及物理治疗设施'),
('nutritionist_personalized_diet', '{}', 'static_content', '营养师配置及个性化饮食方案'),
('social_work_patient_protection', '{}', 'static_content', '社工服务及患者权益保护措施');

-- 创建视图：医院完整信息视图
CREATE VIEW hospital_full_info AS
SELECT 
    h.*,
    COUNT(DISTINCT hd.doctor_id) as doctor_count,
    COUNT(DISTINCT tp.id) as treatment_plan_count,
    COUNT(DISTINCT dept.id) as department_count
FROM hospitals h
LEFT JOIN hospital_doctors hd ON h.id = hd.hospital_id AND hd.status = 1
LEFT JOIN treatment_plans tp ON h.id = tp.hospital_id AND tp.status = 1
LEFT JOIN hospital_departments dept ON h.id = dept.hospital_id AND dept.status = 1
WHERE h.status = 1
GROUP BY h.id;