#!/bin/bash

# Perguntar o email
read -p cc.lima92@gmail.com email

# Gerar a chave SSH
echo "Gerando chave SSH..."
ssh-keygen -t ed25519 -C "$email"
chmod +x gerar_ssh_git.sh
# Iniciar o ssh-agent
echo "Iniciando o ssh-agent..."
eval "$(ssh-agent -s)"

# Adicionar a chave privada
echo "Adicionando a chave SSH gerada ao ssh-agent..."
ssh-add ~/.ssh/id_ed25519

# Mostrar a chave pública
echo "Aqui está a sua chave pública (copie toda a linha abaixo):"
cat ~/.ssh/id_ed25519.pub

echo ""
echo "⚡ Agora vá para GitHub > Settings > SSH and GPG Keys > New SSH Key e cole essa chave lá."
echo ""
echo "Depois volte aqui e teste a conexão com: ssh -T git@github.com"

chmod +x gerar_ssh_git.sh

