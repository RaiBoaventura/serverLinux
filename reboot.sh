#!/bin/bash

# Nome do arquivo: update_and_reboot.sh
# Descrição: Este script atualiza o sistema Linux, remove pacotes desnecessários e reinicia o sistema sempre ao final, registrando logs das operações.

LOG_FILE="/var/log/update_and_reboot.log"

echo "Iniciando a atualização do sistema..." | tee -a "$LOG_FILE"
echo "Data e hora: $(date)" | tee -a "$LOG_FILE"

# Atualizar a lista de pacotes
echo "Atualizando a lista de pacotes..." | tee -a "$LOG_FILE"
sudo apt update -y | tee -a "$LOG_FILE"

# Fazer upgrade dos pacotes instalados
echo "Atualizando os pacotes instalados..." | tee -a "$LOG_FILE"
sudo apt upgrade -y | tee -a "$LOG_FILE"

# Fazer upgrade de pacotes que envolvem mudanças maiores
echo "Realizando dist-upgrade..." | tee -a "$LOG_FILE"
sudo apt dist-upgrade -y | tee -a "$LOG_FILE"

# Remover pacotes que não são mais necessários
echo "Removendo pacotes desnecessários..." | tee -a "$LOG_FILE"
sudo apt autoremove -y | tee -a "$LOG_FILE"

# Limpar o cache de pacotes
echo "Limpando o cache de pacotes..." | tee -a "$LOG_FILE"
sudo apt clean | tee -a "$LOG_FILE"

# Reiniciar o sistema independentemente da necessidade de atualização
echo "O sistema será reiniciado em 1 minuto..." | tee -a "$LOG_FILE"
sleep 60

echo "Reiniciando o sistema agora." | tee -a "$LOG_FILE"
sudo reboot

# Mensagem final (esta linha não será executada, pois o sistema reinicia antes)
echo "Processo de atualização finalizado. O sistema será reiniciado." | tee -a "$LOG_FILE"
