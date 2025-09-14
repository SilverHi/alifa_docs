-- 治疗方案页面数据库设计 DDL

-- 1. 治疗方案基本信息表
CREATE TABLE treatment_plans (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    treatment_name VARCHAR(200) NOT NULL COMMENT '治疗项目名称',
    treatment_name_en VARCHAR(200) COMMENT '治疗项目英文名称',
    
    -- 医院信息
    hospital_id BIGINT NOT NULL COMMENT '医院ID',
    hospital_name VARCHAR(200) NOT NULL COMMENT '医院中文全称',
    hospital_name_en VARCHAR(200) COMMENT '医院英文全称',
    city VARCHAR(50) NOT NULL COMMENT '城市名称',
    hospital_level VARCHAR(50) DEFAULT '三甲' COMMENT '医院等级',
    specialty_tags JSON COMMENT '专科特色标签数组',
    
    -- 价格信息
    total_price DECIMAL(12,2) COMMENT '套餐总价（人民币）',
    discount_price DECIMAL(12,2) COMMENT '优惠价格',
    international_price_comparison TEXT COMMENT '国际价格比对分析',
    
    -- 风险告知信息（metaso搜索获取）
    indications TEXT COMMENT '治疗适应症',
    contraindications TEXT COMMENT '治疗禁忌症',
    surgical_risks TEXT COMMENT '手术风险说明',
    complications TEXT COMMENT '并发症说明',
    
    -- 系统字段
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (hospital_id) REFERENCES hospitals(id),
    INDEX idx_hospital_city (hospital_id, city),
    INDEX idx_treatment_name (treatment_name),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='治疗方案基本信息表';

-- 2. 治疗方案医生团队表
CREATE TABLE treatment_doctors (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    treatment_id BIGINT NOT NULL COMMENT '治疗方案ID',
    doctor_id BIGINT NOT NULL COMMENT '医生ID',
    
    -- AI生成的医生团队信息
    name_pinyin VARCHAR(200) COMMENT '医生姓名英文拼音',
    academic_positions TEXT COMMENT '学术兼职（AI生成）',
    experience_years INT COMMENT '从业年限（AI生成）',
    surgery_cases INT COMMENT '手术例数（AI生成）',
    technical_expertise TEXT COMMENT '核心技术专长（AI生成）',
    research_achievements TEXT COMMENT '科研成果和获奖情况（AI生成）',
    international_background TEXT COMMENT '国际交流背景（AI生成）',
    patient_reviews TEXT COMMENT '患者评价和口碑（AI生成）',
    
    -- 系统字段
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (treatment_id) REFERENCES treatment_plans(id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(id),
    INDEX idx_treatment_status (treatment_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='治疗方案医生团队表';

-- 3. 价格历史记录表（可选，用于价格变动追踪）
CREATE TABLE treatment_price_history (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    treatment_id BIGINT NOT NULL COMMENT '治疗方案ID',
    total_price DECIMAL(12,2) COMMENT '总价',
    discount_price DECIMAL(12,2) COMMENT '优惠价',
    price_source VARCHAR(100) COMMENT '价格来源（metaso等）',
    effective_date DATE COMMENT '生效日期',
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (treatment_id) REFERENCES treatment_plans(id) ON DELETE CASCADE,
    INDEX idx_treatment_date (treatment_id, effective_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='治疗方案价格历史记录表';

-- 扩展全局配置表（添加治疗方案相关配置）
INSERT INTO global_configs (config_key, config_value, config_type, description) VALUES
-- 医疗服务承诺（固定页面内容）
('medical_service_commitments', '{}', 'static_content', '核心医疗服务承诺框架'),
('medical_insurance_cooperation', '{}', 'static_content', '商业保险合作方案'),
('installment_payment_options', '{}', 'static_content', '分期付款选项'),
('prepayment_system', '{}', 'static_content', '预付金制度'),
('cost_effectiveness_description', '{}', 'static_content', '性价比优势说明'),

-- 住宿服务（固定页面内容）
('nutrition_catering_service', '{}', 'static_content', '营养配餐服务'),
('family_rest_facilities', '{}', 'static_content', '家属休息区和配套设施'),
('wifi_entertainment_facilities', '{}', 'static_content', 'Wi-Fi和娱乐设施'),
('laundry_convenience_service', '{}', 'static_content', '洗衣和生活便民服务'),
('surrounding_business_facilities', '{}', 'static_content', '周边商业配套介绍'),
('transportation_convenience', '{}', 'static_content', '交通便利性说明'),

-- 诊疗流程（固定页面内容）
('medical_treatment_process', '{}', 'static_content', '诊疗流程和康复计划'),
('chinese_characteristic_services', '{}', 'static_content', '中国特色附加服务框架'),
('quality_assurance_system', '{}', 'static_content', '风险告知和质量保障'),

-- FAQ（全局唯一，AI生成）
('treatment_faq_localized', '{}', 'faq', 'FAQ本土化设计');

-- 创建视图：治疗方案完整信息视图
CREATE VIEW treatment_plan_full_info AS
SELECT 
    tp.*,
    h.name as hospital_name_full,
    h.name_en as hospital_name_en_full,
    h.history as hospital_history,
    h.key_specialties_count,
    h.bed_capacity,
    h.department_setup,
    h.medical_equipment,
    h.annual_outpatient_volume,
    h.annual_surgery_volume,
    h.honors_certifications,
    h.international_certifications,
    h.medical_alliance,
    h.nearby_hotels,
    h.family_facilities,
    COUNT(td.id) as doctor_count
FROM treatment_plans tp
LEFT JOIN hospitals h ON tp.hospital_id = h.id
LEFT JOIN treatment_doctors td ON tp.id = td.treatment_id AND td.status = 1
WHERE tp.status = 1 AND h.status = 1
GROUP BY tp.id;