-- 治疗方案页面数据库设计 DDL
-- Treatment Plan Page Database Design DDL

-- 1. 治疗方案基本信息表
CREATE TABLE treatment_plans (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    treatment_name VARCHAR(200) NOT NULL COMMENT '治疗方案名称',
    treatment_name_en VARCHAR(200) COMMENT '治疗方案英文名称',
    
    -- 费用分析信息（metaso + AI生成）
    specific_treatment_cost DECIMAL(12,2) COMMENT '具体治疗费用',
    surgery_cost_details TEXT COMMENT '手术费用明细',
    material_cost_description TEXT COMMENT '材料费用说明',
    hospitalization_cost_estimate DECIMAL(12,2) COMMENT '住院费用预估',
    drug_cost_range VARCHAR(200) COMMENT '药品费用范围',
    cost_source VARCHAR(100) COMMENT '费用来源（metaso等）',
    
    -- 适应症与禁忌症（metaso搜索获取）
    medical_indications TEXT COMMENT '医学适应症（具体疾病、症状严重程度）',
    age_physical_requirements TEXT COMMENT '年龄范围和身体条件要求',
    absolute_contraindications TEXT COMMENT '绝对禁忌症',
    drug_allergy_restrictions TEXT COMMENT '药物过敏史限制',
    pregnancy_lactation_restrictions TEXT COMMENT '妊娠哺乳期限制',
    
    -- 风险评估（metaso搜索获取）
    common_risks TEXT COMMENT '常见风险（发生率>5%）',
    common_risks_symptoms TEXT COMMENT '常见风险具体症状描述',
    common_risks_timing TEXT COMMENT '常见风险发生时间预估',
    common_risks_treatment TEXT COMMENT '常见风险处理方法',
    
    rare_serious_risks TEXT COMMENT '少见但严重风险',
    rare_risks_prevention TEXT COMMENT '少见风险预防措施',
    early_warning_signals TEXT COMMENT '早期识别信号',
    emergency_procedures TEXT COMMENT '紧急处理流程',
    
    -- 效果预期（metaso搜索获取成功率数据）
    success_rate_statistics VARCHAR(200) COMMENT '成功率统计数据',
    success_rate_source VARCHAR(100) COMMENT '成功率数据来源',
    
    -- 系统字段
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_treatment_name (treatment_name),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='治疗方案基本信息表';

-- 2. 治疗过程详解表
CREATE TABLE treatment_processes (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    treatment_plan_id BIGINT NOT NULL COMMENT '治疗方案ID',
    phase_type ENUM('pre_treatment', 'treatment_implementation', 'post_treatment') NOT NULL COMMENT '阶段类型',
    phase_name VARCHAR(100) NOT NULL COMMENT '阶段名称',
    
    -- AI生成的详细内容
    examination_checklist TEXT COMMENT '检查项目清单（术前准备阶段）',
    contraindication_assessment TEXT COMMENT '禁忌评估标准（术前准备阶段）',
    patient_education_content TEXT COMMENT '患者教育内容（术前准备阶段）',
    
    specific_steps TEXT COMMENT '具体操作/治疗步骤',
    technical_points TEXT COMMENT '技术要点说明',
    time_schedule TEXT COMMENT '时间安排计划',
    expected_effects TEXT COMMENT '预期效果说明',
    time_cycle TEXT COMMENT '时间周期安排',
    
    recovery_timeline TEXT COMMENT '恢复时间线（术后康复阶段）',
    precautions_checklist TEXT COMMENT '注意事项清单（术后康复阶段）',
    followup_plan TEXT COMMENT '随访计划安排（术后康复阶段）',
    rehabilitation_guidance TEXT COMMENT '康复指导内容（术后康复阶段）',
    
    -- 系统字段
    sort_order INT DEFAULT 0 COMMENT '排序',
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (treatment_plan_id) REFERENCES treatment_plans(id) ON DELETE CASCADE,
    INDEX idx_treatment_phase (treatment_plan_id, phase_type),
    INDEX idx_sort_status (sort_order, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='治疗过程详解表';

-- 3. 康复时间线表
CREATE TABLE recovery_timelines (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    treatment_plan_id BIGINT NOT NULL COMMENT '治疗方案ID',
    phase_type ENUM('acute', 'recovery', 'consolidation') NOT NULL COMMENT '康复阶段类型',
    phase_name VARCHAR(100) NOT NULL COMMENT '阶段名称',
    phase_duration VARCHAR(100) COMMENT '阶段持续时间',
    
    -- AI生成的简短说明
    hospitalization_arrangement TEXT COMMENT '住院时间安排',
    pain_management TEXT COMMENT '疼痛管理方案',
    basic_care_requirements TEXT COMMENT '基本护理要求',
    dietary_guidance TEXT COMMENT '饮食指导建议',
    
    activity_restrictions TEXT COMMENT '活动限制和逐步放开',
    rehabilitation_training TEXT COMMENT '康复训练计划',
    reexamination_schedule TEXT COMMENT '复查时间节点',
    daily_life_recovery TEXT COMMENT '工作和日常生活恢复',
    
    longterm_goals TEXT COMMENT '长期康复目标',
    lifestyle_adjustments TEXT COMMENT '生活方式调整',
    followup_arrangements TEXT COMMENT '定期随访安排',
    
    -- 系统字段
    sort_order INT DEFAULT 0 COMMENT '排序',
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (treatment_plan_id) REFERENCES treatment_plans(id) ON DELETE CASCADE,
    INDEX idx_treatment_phase (treatment_plan_id, phase_type),
    INDEX idx_sort_status (sort_order, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='康复时间线表';

-- 4. 效果预期表
CREATE TABLE treatment_outcomes (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    treatment_plan_id BIGINT NOT NULL COMMENT '治疗方案ID',
    outcome_type ENUM('short_term', 'long_term', 'failure_cases') NOT NULL COMMENT '效果类型',
    outcome_name VARCHAR(100) NOT NULL COMMENT '效果名称',
    time_range VARCHAR(100) COMMENT '时间范围',
    
    -- AI生成的简短说明
    observable_improvements TEXT COMMENT '可观察到的改善',
    quantitative_indicators TEXT COMMENT '量化指标（如适用）',
    individual_variation TEXT COMMENT '个体差异范围',
    
    final_expected_results TEXT COMMENT '最终预期结果',
    affecting_factors TEXT COMMENT '影响效果的因素',
    
    failure_cause_analysis TEXT COMMENT '可能的原因分析',
    remedial_measures TEXT COMMENT '补救措施选项',
    
    -- 系统字段
    sort_order INT DEFAULT 0 COMMENT '排序',
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (treatment_plan_id) REFERENCES treatment_plans(id) ON DELETE CASCADE,
    INDEX idx_treatment_outcome (treatment_plan_id, outcome_type),
    INDEX idx_sort_status (sort_order, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='治疗效果预期表';

-- 5. 治疗方案适应症详细表
CREATE TABLE treatment_indications (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    treatment_plan_id BIGINT NOT NULL COMMENT '治疗方案ID',
    indication_type ENUM('ideal_candidate', 'absolute_contraindication', 'relative_contraindication') NOT NULL COMMENT '适应症类型',
    
    -- AI生成内容
    psychological_preparation TEXT COMMENT '心理准备和配合度要求',
    risk_benefit_situations TEXT COMMENT '需要权衡利弊的情况',
    pretreatment_conditions TEXT COMMENT '需要预处理的条件',
    
    -- 系统字段
    sort_order INT DEFAULT 0 COMMENT '排序',
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (treatment_plan_id) REFERENCES treatment_plans(id) ON DELETE CASCADE,
    INDEX idx_treatment_indication (treatment_plan_id, indication_type),
    INDEX idx_sort_status (sort_order, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='治疗方案适应症详细表';

-- 6. 治疗方案长期影响表
CREATE TABLE treatment_longterm_effects (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    treatment_plan_id BIGINT NOT NULL COMMENT '治疗方案ID',
    
    -- AI生成的长期影响内容
    quality_of_life_impact TEXT COMMENT '对生活质量的影响',
    work_capacity_impact TEXT COMMENT '对工作能力的影响',
    longterm_attention_issues TEXT COMMENT '需要长期关注的问题',
    
    -- 系统字段
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (treatment_plan_id) REFERENCES treatment_plans(id) ON DELETE CASCADE,
    INDEX idx_treatment_status (treatment_plan_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='治疗方案长期影响表';

-- 创建视图：治疗方案完整信息视图
CREATE VIEW treatment_plan_full_info AS
SELECT 
    tp.*,
    COUNT(DISTINCT tpr.id) as process_count,
    COUNT(DISTINCT rt.id) as timeline_count,
    COUNT(DISTINCT tou.id) as outcome_count,
    COUNT(DISTINCT ti.id) as indication_count
FROM treatment_plans tp
LEFT JOIN treatment_processes tpr ON tp.id = tpr.treatment_plan_id AND tpr.status = 1
LEFT JOIN recovery_timelines rt ON tp.id = rt.treatment_plan_id AND rt.status = 1
LEFT JOIN treatment_outcomes tou ON tp.id = tou.treatment_plan_id AND tou.status = 1
LEFT JOIN treatment_indications ti ON tp.id = ti.treatment_plan_id AND ti.status = 1
WHERE tp.status = 1
GROUP BY tp.id;

-- 创建视图：治疗过程完整视图
CREATE VIEW treatment_process_full_view AS
SELECT 
    tp.id as treatment_plan_id,
    tp.treatment_name,
    tpr.phase_type,
    tpr.phase_name,
    tpr.specific_steps,
    tpr.technical_points,
    tpr.time_schedule,
    tpr.expected_effects,
    tpr.examination_checklist,
    tpr.patient_education_content,
    tpr.recovery_timeline,
    tpr.precautions_checklist,
    tpr.followup_plan,
    rt.hospitalization_arrangement,
    rt.pain_management,
    rt.rehabilitation_training,
    tou.observable_improvements,
    tou.final_expected_results
FROM treatment_plans tp
LEFT JOIN treatment_processes tpr ON tp.id = tpr.treatment_plan_id AND tpr.status = 1
LEFT JOIN recovery_timelines rt ON tp.id = rt.treatment_plan_id AND rt.status = 1
LEFT JOIN treatment_outcomes tou ON tp.id = tou.treatment_plan_id AND tou.status = 1
WHERE tp.status = 1
ORDER BY tp.id, tpr.sort_order, rt.sort_order, tou.sort_order;