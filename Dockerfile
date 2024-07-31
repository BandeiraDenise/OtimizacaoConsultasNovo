# Usar uma imagem base Oracle 11g
FROM oracleinanutshell/oracle-xe-11g

# Configurações do Oracle Database
ENV ORACLE_HOME=/u01/app/oracle/product/12.2.0/xe \
    ORACLE_SID=XE \
    ORACLE_PWD=oracle \
    PATH=$PATH:/u01/app/oracle/product/12.2.0/xe/bin

# Copiar scripts de inicialização e dados
COPY ./scripts /opt/oracle/scripts/
COPY ./data /opt/oracle/data/

# Dar permissão de execução aos scripts
RUN chmod +x /opt/oracle/scripts/*.sh

# Expor portas do Oracle
EXPOSE 1521 8080

# Comando para iniciar o Oracle e executar os scripts de inicialização
CMD ["/bin/bash", "-c", "/opt/oracle/scripts/init.sh && /bin/bash"]
