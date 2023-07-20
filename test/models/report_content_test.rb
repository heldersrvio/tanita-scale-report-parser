require "test_helper"

class ReportContentTest < ActiveSupport::TestCase
  def substring_occurs_after(string, first_substring, second_substring)
    pattern = /#{Regexp.escape(first_substring)}.*#{Regexp.escape(second_substring)}/m
    return string.match?(pattern)
  end
  
  test "should parse single-page PDF" do
    pdf_file_path = File.join(File.dirname(__FILE__), "./pdf/report_example.pdf")
    report_content = ReportContent.new pdf_file_path
    strs = [
      "Protocolo: Bioimpedância",
      "Paciente: Paciente Tercio - CPF: 91671965353 - Sexo: M",
      "Data: 28 de Maio de 2022 às 17:56",
      "Data e hora da medida",
      "2022-05-28 15:55:00",
      "Peso",
      "67.2",
      "Percentual de gordura corporal",
      "10",
      "Valores de gordura corporal",
      "2",
      "Percentual de água no corpo",
      "63.7",
      "Percentual de massa de água",
      "42.8",
      "Taxa de gordura visceral",
      "3",
      "Ingestão diária de calorias",
      "3068",
      "Idade metabólica",
      "12",
      "Massa muscular",
      "57.5",
      "Taxa psiquíca",
      "5",
      "Massa óssea",
      "3",
      "Massa de gordura",
      "6.7",
      "Massa livre de gordura",
      "60.5",
      "Índice de massa corporal",
      "19.8",
      "Taxa metabólica basal",
      "1724",
      "Índice de massa esquelética",
      "7.44329",
      "Score do índice de massa esquelética",
      "101",
      "Percentual de gordura da perna direita",
      "9.6",
      "Massa muscular da perna direita",
      "9.6",
      "Percentual de gordura corporal da perna esquerda",
      "9.7",
      "Massa muscular da perna esquerda",
      "9.3",
      "Percentual de gordura corporal do braço direito",
      "12.5",
      "Massa muscular do braço direito",
      "3.1",
      "Percentual de gordura do braço esquerdo",
      "11.4",
      "Massa muscular do braço esquerdo",
      "3.2",
      "Percentual de gordura corporal do tronco",
      "9.8",
      "Massa muscular do tronco",
      "32.3"
    ]
    strs.each_with_index do |str, i|
        if i < str.length - 1
          assert(substring_occurs_after(report_content.text, str, strs[i + 1]), "#{str} does not come before #{strs[i + 1]}")
        end
    end
  end
end
