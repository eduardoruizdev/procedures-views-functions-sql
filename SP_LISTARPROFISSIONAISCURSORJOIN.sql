/*Procedure para buscar nome do profissional, especilidade, tipo e função*/
CREATE OR ALTER PROCEDURE sp_ListarProfissionais
AS
BEGIN
		DECLARE @Nome VARCHAR(100);
		DECLARE @Especialidade VARCHAR(100);
		DECLARE @Tipo VARCHAR(50);
		DECLARE @Funcao VARCHAR(100);

		
		DECLARE cursorProfissionais cursor for
			SELECT
			P.nm_profissional AS Profissionais,
			E.ds_descricao AS Especialidades,
			T.ds_tipo AS Tipos_Profissionais
			FROM profissionais P
			Inner join especialidades E
			on p.id_especialidade = E.id_especialidade
			Inner join tipos_profissionais T
			on P.id_tipo_profissional = T.id_tipo

			OPEN cursorProfissionais;

			FETCH NEXT FROM cursorProfissionais
			INTO @Nome, @Especialidade, @Tipo

			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @Funcao = 
				CASE
					WHEN @Especialidade = 'ACUPUNTURA' THEN 'Tratamento por estímulos em pontos do corpo.'
					WHEN @Especialidade = 'ALERGIA E IMUNOLOGIA' THEN 'Diagnóstico e tratamento de alergias e imunidade.'
					WHEN @Especialidade = 'ANESTESIOLOGIA' THEN 'Aplicação e controle de anestesia em procedimentos.'
					WHEN @Especialidade = 'ANGIOLOGIA' THEN 'Tratamento de veias, artérias e vasos sanguíneos.'
					WHEN @Especialidade = 'ONCOLOGIA' THEN 'Diagnóstico e tratamento do câncer.'
					WHEN @Especialidade = 'CARDIOLOGIA' THEN 'Cuidados com o coração e sistema cardiovascular.'
					WHEN @Especialidade = 'CIRURGIA CARDIOVASCULAR' THEN 'Cirurgias do coração e dos vasos sanguíneos.'
					WHEN @Especialidade = 'CIRURGIA DE CABEÇA E PESCOÇO' THEN 'Cirurgias da cabeça, pescoço e glândulas.'
					WHEN @Especialidade = 'CIRURGIA DO APARELHO DIGESTIVO' THEN 'Cirurgias do sistema digestivo.'
					WHEN @Especialidade = 'CIRURGIA GERAL' THEN 'Cirurgias gerais em diferentes órgãos.'
					WHEN @Especialidade = 'CIRURGIA PEDIÁTRICA' THEN 'Cirurgias realizadas em crianças.'
					WHEN @Especialidade = 'CIRURGIA PLÁSTICA' THEN 'Cirurgias estéticas e reconstrutivas.'
					WHEN @Especialidade = 'CIRURGIA TORÁCICA' THEN 'Cirurgias do tórax e pulmões.'
					WHEN @Especialidade = 'CIRURGIA VASCULAR' THEN 'Cirurgias das artérias e veias.'
					WHEN @Especialidade = 'CLÍNICA MÉDICA' THEN 'Atendimento clínico geral para adultos.'
					WHEN @Especialidade = 'COLOPROCTOLOGIA' THEN 'Tratamento do intestino grosso, reto e ânus.'
					WHEN @Especialidade = 'DERMATOLOGIA' THEN 'Tratamento da pele, cabelos e unhas.'
					WHEN @Especialidade = 'ENDOCRINOLOGIA' THEN 'Tratamento dos hormônios e glândulas.'
					WHEN @Especialidade = 'ENDOSCOPIA' THEN 'Exames e procedimentos endoscópicos.'
					WHEN @Especialidade = 'GASTROENTEROLOGIA' THEN 'Tratamento do aparelho digestivo.'
					WHEN @Especialidade = 'GENÉTICA MÉDICA' THEN 'Diagnóstico e acompanhamento de doenças genéticas.'
					WHEN @Especialidade = 'GERIATRIA' THEN 'Cuidados médicos para idosos.'
					WHEN @Especialidade = 'GINECOLOGIA E OBSTETRÍCIA' THEN 'Saúde da mulher, gravidez e parto.'
					WHEN @Especialidade = 'HEMATOLOGIA E HEMOTERAPIA' THEN 'Tratamento do sangue e transfusões.'
					WHEN @Especialidade = 'HOMEOPATIA' THEN 'Tratamento por medicamentos homeopáticos.'
					WHEN @Especialidade = 'INFECTOLOGIA' THEN 'Tratamento de doenças infecciosas.'
					WHEN @Especialidade = 'MASTOLOGIA' THEN 'Tratamento das doenças da mama.'
					WHEN @Especialidade = 'MEDICINA DE FAMÍLIA E COMUNIDADE' THEN 'Acompanhamento da saúde da família.'
					WHEN @Especialidade = 'MEDICINA DO TRABALHO' THEN 'Saúde ocupacional e prevenção no trabalho.'
					WHEN @Especialidade = 'MEDICINA DO TRÁFEGO' THEN 'Avaliação médica para condutores e trânsito.'
					WHEN @Especialidade = 'MEDICINA ESPORTIVA' THEN 'Saúde e desempenho físico de atletas.'
					WHEN @Especialidade = 'MEDICINA FÍSICA E REABILITAÇÃO' THEN 'Reabilitação física e funcional.'
					WHEN @Especialidade = 'MEDICINA INTENSIVA' THEN 'Cuidados em UTI e pacientes graves.'
					WHEN @Especialidade = 'MEDICINA LEGAL' THEN 'Perícias e medicina aplicada à justiça.'
					WHEN @Especialidade = 'MEDICINA NUCLEAR' THEN 'Diagnóstico e tratamento com radioisótopos.'
					WHEN @Especialidade = 'MEDICINA PREVENTIVA E SOCIAL' THEN 'Promoção e prevenção da saúde coletiva.'
					WHEN @Especialidade = 'NEFROLOGIA' THEN 'Tratamento dos rins.'
					WHEN @Especialidade = 'NEUROCIRURGIA' THEN 'Cirurgias do cérebro e da coluna.'
					WHEN @Especialidade = 'NEUROLOGIA' THEN 'Tratamento do sistema nervoso.'
					WHEN @Especialidade = 'NUTROLOGIA' THEN 'Nutrição clínica e metabolismo.'
					WHEN @Especialidade = 'OFTALMOLOGIA' THEN 'Tratamento dos olhos e da visão.'
					WHEN @Especialidade = 'ORTOPEDIA E TRAUMATOLOGIA' THEN 'Tratamento de ossos, músculos e articulações.'
					WHEN @Especialidade = 'OTORRINOLARINGOLOGIA' THEN 'Tratamento do ouvido, nariz e garganta.'
					WHEN @Especialidade = 'PATOLOGIA' THEN 'Diagnóstico de doenças por análise de tecidos.'
					WHEN @Especialidade = 'PATOLOGIA CLÍNICA/MEDICINA LABORATORIAL' THEN 'Exames laboratoriais e diagnósticos.'
					WHEN @Especialidade = 'PEDIATRIA' THEN 'Cuidados médicos para crianças e adolescentes.'
					WHEN @Especialidade = 'PNEUMOLOGIA' THEN 'Tratamento dos pulmões e vias respiratórias.'
					WHEN @Especialidade = 'PSIQUIATRIA' THEN 'Tratamento da saúde mental.'
					WHEN @Especialidade = 'RADIOLOGIA E DIAGNÓSTICO POR IMAGEM' THEN 'Exames de imagem para diagnóstico.'
					WHEN @Especialidade = 'RADIOTERAPIA' THEN 'Tratamento do câncer com radiação.'
					WHEN @Especialidade = 'REUMATOLOGIA' THEN 'Tratamento de doenças das articulações e autoimunes.'
					WHEN @Especialidade = 'UROLOGIA' THEN 'Tratamento do sistema urinário e reprodutor masculino.'
					WHEN @Especialidade = 'PSICOLOGIA' THEN 'Acompanhamento psicológico e saúde emocional.'
					WHEN @Especialidade = 'EMBRIOLOGIA' THEN 'Estudo e acompanhamento do desenvolvimento embrionário.'
					ELSE 'Especialidade não cadastrada.'
				END;

					PRINT 'Nome Profissional: ' + @Nome +
					  '||Especialidade: ' + @Especialidade +
					  '||Tipo: ' + @Tipo +
					  '||Função' + @Funcao

					 FETCH NEXT FROM cursorProfissionais
			INTO @Nome, @Especialidade, @Tipo
			END

			CLOSE cursorProfissionais;
			DEALLOCATE cursorProfissionais;
END
GO