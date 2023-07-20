module Sex
  Male = "M"
  Female = "F"
end

class Report
  class ReportParsingError < StandardError; end
    
  @@patient_name_label = "Paciente:"
  @@cpf_label = "CPF:"
  @@sex_label = "Sexo:"
  @@report_date_label = "Data:"
  @@measurement_date_label = "Data e hora da medida"
  @@weight_label = "Peso"
  @@body_fat_pct_label = "Percentual de gordura corporal"
  @@body_fat_values_label = "Valores de gordura corporal"
  @@body_water_pct_label = "Percentual de água no corpo"
  @@water_mass_pct_label = "Percentual de massa de água"
  @@visceral_fat_rate_label = "Taxa de gordura visceral"
  @@daily_caloric_intake_label = "Ingestão diária de calorias"
  @@metabolic_age_label = "Idade metabólica"
  @@muscular_mass_label = "Massa muscular"
  @@psychic_rate_label = "Taxa psiquíca"
  @@bone_mass_label = "Massa óssea"
  @@fat_mass_label = "Massa de gordura"
  @@free_fat_mass_label = "Massa livre de gordura"
  @@bmi_label = "Índice de massa corporal"
  @@basal_metabolic_rate_label = "Taxa metabólica basal"
  @@skeleton_mass_index_label = "Índice de massa esquelética"
  @@skeleton_mass_index_score_label = "Score do índice de massa esquelética"
  @@right_leg_fat_pct_label = "Percentual de gordura da perna direita"
  @@right_leg_muscular_mass_label = "Massa muscular da perna direita"
  @@left_leg_fat_pct_label = "Percentual de gordura corporal da perna esquerda"
  @@left_leg_muscular_mass_label = "Massa muscular da perna esquerda"
  @@right_arm_fat_pct_label = "Percentual de gordura corporal do braço direito"
  @@right_arm_muscular_mass_label = "Massa muscular do braço direito"
  @@left_arm_fat_pct_label = "Percentual de gordura do braço esquerdo"
  @@left_arm_muscular_mass_label = "Massa muscular do braço esquerdo"
  @@trunk_fat_pct_label = "Percentual de gordura corporal do tronco"
  @@trunk_muscular_mass_label = "Massa muscular do tronco"

  def initialize(text_data)
    parse_text text_data
  end

  def parse_text(text_data)
    @patient_name = parse_patient_name(text_data)
    @cpf = parse_cpf(text_data)
    @sex = parse_sex(text_data)
    @report_date = parse_report_date(text_data)
    @measurement_date = parse_measurement_date(text_data)
    @weight = parse_weight(text_data)
    @body_fat_pct = parse_body_fat_pct(text_data)
    @body_fat_values = parse_body_fat_values(text_data)
    @body_water_pct = parse_body_water_pct(text_data)
    @water_mass_pct = parse_water_mass_pct(text_data)
    @visceral_fat_rate = parse_visceral_fat_rate(text_data)
    @daily_caloric_intake = parse_daily_caloric_intake(text_data)
    @metabolic_age = parse_metabolic_age(text_data)
    @muscular_mass = parse_muscular_mass(text_data)
    @psychic_rate = parse_psychic_rate(text_data)
    @bone_mass = parse_bone_mass(text_data)
    @fat_mass = parse_fat_mass(text_data)
    @free_fat_mass = parse_free_fat_mass(text_data)
    @bmi = parse_bmi(text_data)
    @basal_metabolic_rate = parse_basal_metabolic_rate(text_data)
    @skeleton_mass_index = parse_skeleton_mass_index(text_data)
    @skeleton_mass_index_score = parse_skeleton_mass_index_score(text_data)
    @right_leg_fat_pct = parse_right_leg_fat_pct(text_data)
    @right_leg_muscular_mass = parse_right_leg_muscular_mass(text_data)
    @left_leg_fat_pct = parse_left_leg_fat_pct(text_data)
    @left_leg_muscular_mass = parse_left_leg_muscular_mass(text_data)
    @right_arm_fat_pct = parse_right_arm_fat_pct(text_data)
    @right_arm_muscular_mass = parse_right_arm_muscular_mass(text_data)
    @left_arm_fat_pct = parse_left_arm_fat_pct(text_data)
    @left_arm_muscular_mass = parse_left_arm_muscular_mass(text_data)
    @trunk_fat_pct = parse_trunk_fat_pct(text_data)
    @trunk_muscular_mass = parse_trunk_muscular_mass(text_data)
  end

  def parse_patient_name(text_data)
    pattern = /#{Regexp.escape(@@patient_name_label)}\s(.*?)\s-/
    if match = text_data.match(pattern)
      return match.captures[0]
    else
      raise ReportParsingError, "No patient name found"
    end
  end

  def parse_cpf(text_data)
    pattern = /#{Regexp.escape(@@cpf_label)}\s(.*?)\s-/
    if match = text_data.match(pattern)
      return match.captures[0]
    else
      raise ReportParsingError, "No CPF found"
    end
  end

  def parse_sex(text_data)
    pattern = /#{Regexp.escape(@@sex_label)}\s([M,F])/
    if match = text_data.match(pattern)
      return match.captures[0]
    else
      raise ReportParsingError, "No sex found"
    end
  end

  def parse_report_date(text_data)
    pattern = /#{Regexp.escape(@@report_date_label)}\s(.*)/
    if match = text_data.match(pattern)
      return match.captures[0]
    else
      raise ReportParsingError, "No report date found"
    end
  end

  def parse_measurement_date(text_data)
    pattern = /#{Regexp.escape(@@measurement_date_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      return match.captures[0]
    else
      raise ReportParsingError, "No measurement date found"
    end
  end

  def parse_weight(text_data)
    pattern = /#{Regexp.escape(@@weight_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      weight = match.captures[0].to_f
      return weight
    else
      raise ReportParsingError, "No weight found"
    end
  end

  def parse_body_fat_pct(text_data)
    pattern = /#{Regexp.escape(@@body_fat_pct_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      body_fat_pct = match.captures[0].to_f
      return body_fat_pct
    else
      raise ReportParsingError, "No body fat percentage found"
    end
  end

  def parse_body_fat_values(text_data)
    pattern = /#{Regexp.escape(@@body_fat_values_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      body_fat_values = match.captures[0].to_i
      return body_fat_values
    else
      raise ReportParsingError, "No body fat values found"
    end
  end

  def parse_body_water_pct(text_data)
    pattern = /#{Regexp.escape(@@body_water_pct_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      body_water_pct = match.captures[0].to_f
      return body_water_pct
    else
      raise ReportParsingError, "No body water percentage found"
    end
  end

  def parse_water_mass_pct(text_data)
    pattern = /#{Regexp.escape(@@water_mass_pct_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      water_mass_pct = match.captures[0].to_f
      return water_mass_pct
    else
      raise ReportParsingError, "No water mass percentage found"
    end
  end

  def parse_visceral_fat_rate(text_data)
    pattern = /#{Regexp.escape(@@visceral_fat_rate_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      visceral_fat_rate = match.captures[0].to_i
      return visceral_fat_rate
    else
      raise ReportParsingError, "No visceral fat rate found"
    end
  end

  def parse_daily_caloric_intake(text_data)
    pattern = /#{Regexp.escape(@@daily_caloric_intake_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      daily_caloric_intake = match.captures[0].to_i
      return daily_caloric_intake
    else
      raise ReportParsingError, "No daily caloric intake found"
    end
  end

  def parse_metabolic_age(text_data)
    pattern = /#{Regexp.escape(@@metabolic_age_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      metabolic_age = match.captures[0].to_i
      return metabolic_age
    else
      raise ReportParsingError, "No metabolic age found"
    end
  end

  def parse_muscular_mass(text_data)
    pattern = /#{Regexp.escape(@@muscular_mass_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      muscular_mass = match.captures[0].to_f
      return muscular_mass
    else
      raise ReportParsingError, "No muscular mass found"
    end
  end

  def parse_psychic_rate(text_data)
    pattern = /#{Regexp.escape(@@psychic_rate_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      psychic_rate = match.captures[0].to_i
      return psychic_rate
    else
      raise ReportParsingError, "No psychic rate found"
    end
  end

  def parse_bone_mass(text_data)
    pattern = /#{Regexp.escape(@@bone_mass_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      bone_mass = match.captures[0].to_f
      return bone_mass
    else
      raise ReportParsingError, "No bone mass found"
    end
  end

  def parse_fat_mass(text_data)
    pattern = /#{Regexp.escape(@@fat_mass_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      fat_mass = match.captures[0].to_f
      return fat_mass
    else
      raise ReportParsingError, "No fat mass found"
    end
  end

  def parse_free_fat_mass(text_data)
    pattern = /#{Regexp.escape(@@free_fat_mass_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      free_fat_mass = match.captures[0].to_f
      return free_fat_mass
    else
      raise ReportParsingError, "No free fat mass found"
    end
  end

  def parse_bmi(text_data)
    pattern = /#{Regexp.escape(@@bmi_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      bmi = match.captures[0].to_f
      return bmi
    else
      raise ReportParsingError, "No BMI found"
    end
  end

  def parse_basal_metabolic_rate(text_data)
    pattern = /#{Regexp.escape(@@basal_metabolic_rate_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      basal_metabolic_rate = match.captures[0].to_i
      return basal_metabolic_rate
    else
      raise ReportParsingError, "No basal metabolic rate found"
    end
  end

  def parse_skeleton_mass_index(text_data)
    pattern = /#{Regexp.escape(@@skeleton_mass_index_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      skeleton_mass_index = match.captures[0].to_f
      return skeleton_mass_index
    else
      raise ReportParsingError, "No skeleton mass index found"
    end
  end

  def parse_skeleton_mass_index_score(text_data)
    pattern = /#{Regexp.escape(@@skeleton_mass_index_score_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      skeleton_mass_index_score = match.captures[0].to_i
      return skeleton_mass_index_score
    else
      raise ReportParsingError, "No skeleton mass index score found"
    end
  end

  def parse_right_leg_fat_pct(text_data)
    pattern = /#{Regexp.escape(@@right_leg_fat_pct_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      right_leg_fat_pct = match.captures[0].to_f
      return right_leg_fat_pct
    else
      raise ReportParsingError, "No right leg fat percentage found"
    end
  end

  def parse_right_leg_muscular_mass(text_data)
    pattern = /#{Regexp.escape(@@right_leg_muscular_mass_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      right_leg_muscular_mass = match.captures[0].to_f
      return right_leg_muscular_mass
    else
      raise ReportParsingError, "No right leg muscular mass found"
    end
  end

  def parse_left_leg_fat_pct(text_data)
    pattern = /#{Regexp.escape(@@left_leg_fat_pct_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      left_leg_fat_pct = match.captures[0].to_f
      return left_leg_fat_pct
    else
      raise ReportParsingError, "No left leg fat percentage found"
    end
  end

  def parse_left_leg_muscular_mass(text_data)
    pattern = /#{Regexp.escape(@@left_leg_muscular_mass_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      left_leg_muscular_mass = match.captures[0].to_f
      return left_leg_muscular_mass
    else
      raise ReportParsingError, "No left leg muscular mass found"
    end
  end

  def parse_right_arm_fat_pct(text_data)
    pattern = /#{Regexp.escape(@@right_arm_fat_pct_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      right_arm_fat_pct = match.captures[0].to_f
      return right_arm_fat_pct
    else
      raise ReportParsingError, "No right arm fat percentage found"
    end
  end

  def parse_right_arm_muscular_mass(text_data)
    pattern = /#{Regexp.escape(@@right_arm_muscular_mass_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      right_arm_muscular_mass = match.captures[0].to_f
      return right_arm_muscular_mass
    else
      raise ReportParsingError, "No right arm muscular mass found"
    end
  end

  def parse_left_arm_fat_pct(text_data)
    pattern = /#{Regexp.escape(@@left_arm_fat_pct_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      left_arm_fat_pct = match.captures[0].to_f
      return left_arm_fat_pct
    else
      raise ReportParsingError, "No left arm fat percentage found"
    end
  end

  def parse_left_arm_muscular_mass(text_data)
    pattern = /#{Regexp.escape(@@left_arm_muscular_mass_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      left_arm_muscular_mass = match.captures[0].to_f
      return left_arm_muscular_mass
    else
      raise ReportParsingError, "No left arm muscular mass found"
    end
  end

  def parse_trunk_fat_pct(text_data)
    pattern = /#{Regexp.escape(@@trunk_fat_pct_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      trunk_fat_pct = match.captures[0].to_f
      return trunk_fat_pct
    else
      raise ReportParsingError, "No trunk fat percentage found"
    end
  end

  def parse_trunk_muscular_mass(text_data)
    pattern = /#{Regexp.escape(@@trunk_muscular_mass_label)}[\s\t]+(.*)/
    if match = text_data.match(pattern)
      trunk_muscular_mass = match.captures[0].to_f
      return trunk_muscular_mass
    else
      raise ReportParsingError, "No trunk muscular mass found"
    end
  end

  attr_accessor :patient_name
  attr_accessor :cpf
  attr_accessor :sex
  attr_accessor :report_date
  attr_accessor :measurement_date
  attr_accessor :weight
  attr_accessor :body_fat_pct
  attr_accessor :body_fat_values
  attr_accessor :body_water_pct
  attr_accessor :water_mass_pct
  attr_accessor :visceral_fat_rate
  attr_accessor :daily_caloric_intake
  attr_accessor :metabolic_age
  attr_accessor :muscular_mass
  attr_accessor :psychic_rate
  attr_accessor :bone_mass
  attr_accessor :fat_mass
  attr_accessor :free_fat_mass
  attr_accessor :bmi
  attr_accessor :basal_metabolic_rate
  attr_accessor :skeleton_mass_index
  attr_accessor :skeleton_mass_index_score
  attr_accessor :right_leg_fat_pct
  attr_accessor :right_leg_muscular_mass
  attr_accessor :left_leg_fat_pct
  attr_accessor :left_leg_muscular_mass
  attr_accessor :right_arm_fat_pct
  attr_accessor :right_arm_muscular_mass
  attr_accessor :left_arm_fat_pct
  attr_accessor :left_arm_muscular_mass
  attr_accessor :trunk_fat_pct
  attr_accessor :trunk_muscular_mass
end
