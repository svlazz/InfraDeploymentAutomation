#!/bin/bash

safe_to_bootstrap=$(sudo cat /var/lib/mysql/grastate.dat | grep "safe_to_bootstrap:" | awk '{print $2}')

if [[ "$safe_to_bootstrap" == "0" ]]; then
    sudo sed -i 's/safe_to_bootstrap: 0/safe_to_bootstrap: 1/g' /var/lib/mysql/grastate.dat

    if [[ $? -eq 0 ]]; then
        echo "El cambio a safe_to_bootstrap: 1 se realizó con éxito."
        sudo systemctl stop mysql   
        sudo galera_new_cluster 
    else
        echo "Error al cambiar safe_to_bootstrap: 0 a safe_to_bootstrap: 1"
    fi
else
    echo "Ejecutando galera_new_cluster..."
    sudo systemctl stop mysql   
    sudo galera_new_cluster      
fi
