FROM centos:latest

RUN yum -y install unzip
RUN yum -y install wget
RUN groupadd iics
RUN adduser infa
WORKDIR "/infa"
RUN wget https://na1.dm-us.informaticacloud.com/saas/download/linux64/installer/agent64_install_ng_ext.bin
#COPY agent64_install.bin /infa/agent64_install.bin
RUN chmod +x /infa/agent64_install_ng_ext.bin
RUN echo -e "\n\n\n\n" | /infa/agent64_install_ng_ext.bin -i silent -DUSER_INSTALL_DIR=/infa/infaagent || echo OK
WORKDIR "/infa/infaagent"
COPY docker_agent_start.sh /infa/infaagent/docker_agent_start.sh
RUN chmod +x docker_agent_start.sh
RUN chown -R infa:infa /infa
ENTRYPOINT [ "/infa/infaagent/docker_agent_start.sh" ]
