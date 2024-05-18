# Matlab HDL Tutorial

Los tutoriales de este repo están numerados en orden de complejidad. Cada uno de ellos incluye un código probado y funcional de cómo generar código HDL desde Matlab e integrarlo con Vivado.

A lo largo de este tutorial se usan las siguientes versiones:

* OS: Ubuntu 22.04 LTS
* Matlab R2022b, with all the add-ons.
* Vivado 2023.2

## Instalación

Los pasos de instalación y ejemplos se pueden encontrar en la documentación de [Matlab Cosimulation](https://la.mathworks.com/help/hdlverifier/simulink-cosimulation.html?s_tid=CRUX_lftnav).

El siguiente script crea un archivo para que Matlab sea capaz de identificar la dirección donde se encuentran las librerías de Vivado para compilar el RTL:

```bash
# This path should hold the file "librdi_simulator_kernel.so"
vivado_lib_dir="$HOME/Xilinx/Vivado/2023.2/lib/lnx64.o"

sudo echo "${vivado_lib_dir}" >> /etc/ld.so.conf.d/xilvivado.conf
sudo ldconfig
```

En el archivo `$HOME/.profile`, agregamos al `PATH` la ubicación del binario de Vivado. Lo agregamos al `~/.profile` y no al `~/.bashrc` porque, el Matlab normalmente se ejecuta desde el entorno gráfico, y no desde una terminal de bash, por lo que el "bashrc" no se llama. Al realizar cambios en el archivo ".profile" hay que reiniciar la computadora.

```bash
echo "PATH=\"\$HOME/Xilinx/Vivado/2023.2/bin:\$PATH\"" >> ~/.profile
```

## Algunos tips

Dado que HDL Code y HDL Verifier generan mucho código de forma automática, acá voy a mencionar algunas cosas que pueden suceder, y cómo solucionarlas:

* Aparece un error similar a: "S-function parameters must be one or two dimensional nonsparse numeric or character arrays unless the S-function uses a TLC file and has an mdlRT"

Este error ocurre al querer copiar y pegar el ejemplo (01), y querer usarlo para cosimular. Este error se solucionó al crear un archivo de Simulink desde cero.

* Los archivos HDL generados se encuentran dentro de la carpeta por defecto "hdl_prj".

* Para usar solamente bloques compatibles con HDL, tipear en la consola de Matlab `hdllib` o `hdllib off`. Estos comandos van a hacer que solamente veas bloques compatibles con HDL Coder.
