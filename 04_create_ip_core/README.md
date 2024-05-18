# Create IP Core

Hasta ahora, hicimos lo siguiente:

* Diseñamos un algoritmo en Matlab.
* Diseñamos el mismo algoritmo en Simulink, y verificamos resultados.
* Generamos el código HDL a partir del diagrama de Simulink, y comparamos los resultados de la simulación del HDL con el Simulink.

El siguiente y último paso es sintetizar el código en la FPGA, y verificar que el código sintetizado cumple constraints de tiempo y recursos.

Una forma de hacerlo es agarrando directamente los archivos HDL generados, y crear el IP-Core de forma manual, como se explicó en el otro tutorial de [Vivado Tutorial](https://github.com/vlc-utn/vivado_tutorial).

