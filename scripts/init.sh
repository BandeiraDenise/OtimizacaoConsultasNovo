#!/bin/bash

# Iniciar o serviço Oracle
/etc/init.d/oracle-xe start

# Esperar até que o Oracle esteja totalmente iniciado
sleep 60

# Configurar o Oracle com o password especificado
echo "Configuring Oracle XE with password $ORACLE_PWD"
echo -e "$ORACLE_PWD\n$ORACLE_PWD" | /etc/init.d/oracle-xe configure

# Esperar até que o Oracle esteja completamente inicializado
while ! echo exit | sqlplus -s system/oracle@localhost:1521/XE; do
  echo "Aguardando o Oracle inicializar..."
  sleep 10
done

echo "Oracle iniciado com sucesso."

# Manter o contêiner em execução
tail -f /dev/null

# Importar dados usando SQL*Loader
sqlldr system/oracle@localhost:1521/XE control=/opt/oracle/scripts/TAB_AIR_AIRLINES.ctl

# Verificar se a carga foi bem-sucedida
if [ $? -eq 0 ]; then
  echo "Dados carregados com sucesso!"
else
  echo "Erro ao carregar dados."
fi

