FROM oraclelinux:7-slim

# Atualizar e instalar dependências necessárias
RUN yum -y update && yum -y install oracle-database-preinstall-12c \
    && yum clean all

# Definir variáveis de ambiente necessárias para o Oracle Database
ENV ORACLE_HOME=/opt/oracle/product/12.2.0/xe \
    ORACLE_SID=XE \
    PATH=$PATH:/opt/oracle/product/12.2.0/xe/bin

# Expor a porta do Oracle Database
EXPOSE 1521

# Definir o ponto de entrada para iniciar o Oracle Database
CMD ["/opt/oracle/scripts/init.sh"]
