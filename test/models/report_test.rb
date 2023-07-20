require "test_helper"

class ReportTest < ActiveSupport::TestCase
  test "should parse well-formed data" do
    report = Report.new "
      AVALIAÇÃO CORPORAL

      Protocolo: Bioimpedância

      Paciente: Paciente Tercio - CPF: 91671965353 - Sexo: M
      Data: 28 de Maio de 2022 às 17:56

        MEDIDA                                               RESULTADO
        Data e hora da medida                                2022-05-28 15:55:00

        Peso                                                 67.2

        Percentual de gordura corporal                       10

        Valores de gordura corporal                          2

        Percentual de água no corpo                          63.7

        Percentual de massa de água                          42.8
        Taxa de gordura visceral                             3

        Ingestão diária de calorias                          3068

        Idade metabólica                                     12

        Massa muscular                                       57.5

        Taxa psiquíca                                        5

        Massa óssea                                          3

        Massa de gordura                                     6.7
        Massa livre de gordura                               60.5

        Índice de massa corporal                             19.8

        Taxa metabólica basal                                1724

        Índice de massa esquelética                          7.44329

        Score do índice de massa esquelética                 101

        Percentual de gordura da perna direita               9.6
        Massa muscular da perna direita                      9.6

        Percentual de gordura corporal da perna esquerda     9.7

        Massa muscular da perna esquerda                     9.3

        Percentual de gordura corporal do braço direito      12.5

        Massa muscular do braço direito                      3.1

        Percentual de gordura do braço esquerdo              11.4

        Massa muscular do braço esquerdo                     3.2
        Percentual de gordura corporal do tronco             9.8

        Massa muscular do tronco                             32.3

        Sem traducao
      .
      "
      
      patient_name = "Paciente Tercio"
      cpf = "91671965353"
      sex = Sex::Male
      report_date = "28 de Maio de 2022 às 17:56"
      measurement_date = "2022-05-28 15:55:00"
      weight = 67.2
      body_fat_pct = 10
      body_fat_values = 2
      body_water_pct = 63.7
      water_mass_pct = 42.8
      visceral_fat_rate = 3
      daily_caloric_intake = 3068
      metabolic_age = 12
      muscular_mass = 57.5
      psychic_rate = 5
      bone_mass = 3
      fat_mass = 6.7
      free_fat_mass = 60.5
      bmi = 19.8
      basal_metabolic_rate = 1724
      skeleton_mass_index = 7.44329
      skeleton_mass_index_score = 101
      right_leg_fat_pct = 9.6
      right_leg_muscular_mass = 9.6
      left_leg_fat_pct = 9.7
      left_leg_muscular_mass = 9.3
      right_arm_fat_pct = 12.5
      right_arm_muscular_mass = 3.1
      left_arm_fat_pct = 11.4
      left_arm_muscular_mass = 3.2
      trunk_fat_pct = 9.8
      trunk_muscular_mass = 32.3
      
      assert_equal(patient_name, report.patient_name, "Patient name #{report.patient_name} is incorrect. Should be '#{patient_name}' instead")
      assert_equal(cpf, report.cpf, "CPF #{report.cpf} is incorrect. Should be '#{cpf}' instead")
      assert_equal(sex, report.sex, "Sex #{report.sex} is incorrect. Should be #{sex} instead")
      assert_equal(report_date, report.report_date, "Report date #{report.report_date} is incorrect. Should be #{report_date} instead")
      assert_equal(measurement_date, report.measurement_date, "Measurement date #{report.measurement_date} is incorrect. Should be #{measurement_date} instead")
      assert_equal(weight, report.weight, "Weight #{report.weight} is incorrect. Should be #{weight} instead")
      assert_equal(body_fat_pct, report.body_fat_pct, "Body fat percentage #{report.body_fat_pct} is incorrect. Should be #{body_fat_pct} instead")
      assert_equal(body_fat_values, report.body_fat_values, "Body fat values #{report.body_fat_values} are incorrect. Should be #{body_fat_values} instead")
      assert_equal(body_water_pct, report.body_water_pct, "Body water percentage #{report.body_water_pct} is incorrect. Should be #{body_water_pct} instead")
      assert_equal(water_mass_pct, report.water_mass_pct, "Water mass percentage #{report.water_mass_pct} is incorrect. Should be #{water_mass_pct} instead")
      assert_equal(visceral_fat_rate, report.visceral_fat_rate, "Visceral fat rate #{report.visceral_fat_rate} is incorrect. Should be #{visceral_fat_rate} instead")
      assert_equal(daily_caloric_intake, report.daily_caloric_intake, "Daily caloric intake #{report.daily_caloric_intake} is incorrect. Should be #{daily_caloric_intake} instead")
      assert_equal(metabolic_age, report.metabolic_age, "Metabolic age #{report.metabolic_age} is incorrect. Should be #{metabolic_age} instead")
      assert_equal(muscular_mass, report.muscular_mass, "Muscular mass #{report.muscular_mass} is incorrect. Should be #{muscular_mass} instead")
      assert_equal(psychic_rate, report.psychic_rate, "Psychic rate #{report.psychic_rate} is incorrect. Should be #{psychic_rate} instead")
      assert_equal(bone_mass, report.bone_mass, "Bone mass #{report.bone_mass} is incorrect. Should be #{bone_mass} instead")
      assert_equal(fat_mass, report.fat_mass, "Fat mass #{report.fat_mass} is incorrect. Should be #{fat_mass} instead")
      assert_equal(free_fat_mass, report.free_fat_mass, "Free fat mass #{report.free_fat_mass} is incorrect. Should be #{free_fat_mass} instead")
      assert_equal(bmi, report.bmi, "BMI #{report.bmi} is incorrect. Should be #{bmi} instead")
      assert_equal(basal_metabolic_rate, report.basal_metabolic_rate, "Basal metabolic rate #{report.basal_metabolic_rate} is incorrect. Should be #{basal_metabolic_rate} instead")
      assert_equal(skeleton_mass_index, report.skeleton_mass_index, "Skeleton mass index #{report.skeleton_mass_index} is incorrect. Should be #{skeleton_mass_index} instead")
      assert_equal(skeleton_mass_index_score, report.skeleton_mass_index_score, "Skeleton mass index score #{report.skeleton_mass_index_score} is incorrect. Should be #{skeleton_mass_index_score} instead")
      assert_equal(right_leg_fat_pct, report.right_leg_fat_pct, "Right leg fat percentage #{report.right_leg_fat_pct} is incorrect. Should be #{right_leg_fat_pct} instead")
      assert_equal(right_leg_muscular_mass, report.right_leg_muscular_mass, "Right leg muscular mass #{report.right_leg_muscular_mass} is incorrect. Should be #{right_leg_muscular_mass} instead")
      assert_equal(left_leg_fat_pct, report.left_leg_fat_pct, "Left leg fat percentage #{report.left_leg_fat_pct} is incorrect. Should be #{left_leg_fat_pct} instead")
      assert_equal(left_leg_muscular_mass, report.left_leg_muscular_mass, "Left leg muscular mass #{report.left_leg_muscular_mass} is incorrect. Should be #{left_leg_muscular_mass} instead")
      assert_equal(right_arm_fat_pct, report.right_arm_fat_pct, "Right arm fat percentage #{report.right_arm_fat_pct} is incorrect. Should be #{right_arm_fat_pct} instead")
      assert_equal(right_arm_muscular_mass, report.right_arm_muscular_mass, "Right arm muscular mass #{report.right_arm_muscular_mass} is incorrect. Should be #{right_arm_muscular_mass} instead")
      assert_equal(left_arm_fat_pct, report.left_arm_fat_pct, "Left arm fat percentage #{report.left_arm_fat_pct} is incorrect. Should be #{left_arm_fat_pct} instead")
      assert_equal(left_arm_muscular_mass, report.left_arm_muscular_mass, "Left arm muscular mass #{report.left_arm_muscular_mass} is incorrect. Should be #{left_arm_muscular_mass} instead")
      assert_equal(trunk_fat_pct, report.trunk_fat_pct, "Trunk fat percentage #{report.trunk_fat_pct} is incorrect. Should be #{trunk_fat_pct} instead")
      assert_equal(trunk_muscular_mass, report.trunk_muscular_mass, "Trunk muscular mass #{report.trunk_muscular_mass} is incorrect. Should be #{trunk_muscular_mass} instead")
  end
end
