#!/bin/bash
##########################################################
#                                                       ##
# MonitoraProcesso_Email.sh - Monitora os processos     ##
#                                                       ##
# Autor Ricardo Vieira de Souza                         ##
# Data de Criação 03/03/2019                            ##
#                                                       ##
# Descrição :Script de exemplo para Monitorar processos ##
#            em um servidor e envia email com resultado ##
#                                                       ##
# uso ./MonitoraProcessos_Email.sh <nome do processo> & ##
#                                                       ##
#     [uso do & para rodar em backgroud]                ##
##########################################################
EMAILTESTEENVIO=ricardosouza.suporte@outlook.com
TIME=5

if [ $# -eq 0 ]
then
	echo "Favor informar um processo como argumento."
	echo "./MonitoraProcesso.sh <processo>"
	exit 1
fi
while true
do
	if ps -axu |grep $1 | grep -v grep |grep -v $0 
	then
		sleep $TIME
	else
		echo "Atenção !!!!!!!!! O Processo $1 Não Está em Execução!!Verifique a Maquina $HOSTNAME" | mail -s "[$0] Monitoração do Processo $1 Maquina $HOSTNAME " $EMAILTESTEENVIO
		sleep $TIME
	fi
done


