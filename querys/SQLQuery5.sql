ALTER TABLE parametros_valor
  DROP COLUMN valor;
	
ALTER TABLE parametros_valor
  ADD c_valor VARCHAR(50);