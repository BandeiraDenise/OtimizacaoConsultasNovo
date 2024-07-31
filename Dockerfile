# Usar uma imagem base Oracle 11g
FROM oracleinanutshell/oracle-xe-11g

# Definir variáveis de ambiente
#ENV ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
#ENV ORACLE_SID=XE
#ENV ORACLE_PWD=oracle

# Copiar scripts de inicialização e dados
COPY ./scripts /opt/oracle/scripts/
COPY ./data /opt/oracle/data/

# Dar permissão de execução aos scripts
RUN chmod +x /opt/oracle/scripts/*.sh

# Expor portas do Oracle
#EXPOSE 1521 8080

# Comando para iniciar o Oracle e executar os scripts de inicialização
#CMD ["/bin/bash", "-c", "/opt/oracle/scripts/init.sh && /bin/bash"]
#CMD ["/bin/bash", "-c", "/bin/bash"]

