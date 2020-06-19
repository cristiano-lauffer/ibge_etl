CREATE OR REPLACE PROCEDURE staging.delete_insert_municipios()
LANGUAGE sql
AS $$
	truncate table ibge.municipios;
	delete from ibge.microrregioes;
	delete from ibge.mesorregioes;
	delete from ibge.uf;
	delete from ibge.regioes;
	
	insert into ibge.microrregioes
	    select distinct
	        id_microrregiao,
	        nome_microrregiao
	    from staging.municipios
	;
	
	insert into ibge.mesorregioes
	    select distinct
	        id_mesorregiao,
	        nome_mesorregiao
	    from staging.municipios
	;
	
	insert into ibge.uf
	    select distinct
	        id_uf,
	        nome_uf,
	        sigla_uf
	    from staging.municipios
	;
	
	insert into ibge.regioes
	    select distinct
	        id_regiao,
	        nome_regiao,
	        sigla_regiao
	    from staging.municipios
	;
	
	insert into ibge.municipios
	    select
	        id,
	        nome,
	        id_microrregiao,
	        id_mesorregiao,
	        id_uf,
	        id_regiao
	    from staging.municipios
	;
$$;
