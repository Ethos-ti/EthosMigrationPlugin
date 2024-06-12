#!/bin/bash

if ! command -v wp &> /dev/null
then
    echo "WP-CLI não está instalado. Por favor, instale o WP-CLI e tente novamente."
    exit 1
fi

echo "Executando comandos WP-CLI..."

wp modify-posts q:post_type=cedoc q:post_status=draft,private,publish q:tax_query=categoria:agenda fn:ethos\\set_events_only_date
if [ $? -ne 0 ]; then
    echo "Erro ao executar o comando."
    exit 1
fi

echo "Fim da execução dos comandos."
