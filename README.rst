
.. role:: yuneta
.. role:: master
.. role:: system
.. role:: agent
.. role:: node
.. role:: node-job
.. role:: node-dev
.. role:: realm
.. role:: yuno
.. role:: role
.. role:: name
.. role:: service
.. role:: channel
.. role:: message
.. role:: cli
.. role:: gui
.. role:: run-time

.. role:: large

.. _Instalacion Yuneta:

Instalación
===========

Introducción
------------

Los :node:`nodos` de Yuneta pueden clasificarse en:

    * :node-dev:`Nodo de desarrollo`:
        - Es el nodo que contiene el código fuente de Yuneta y los proyectos.
        - Sirve tanto para **desarrollo** como para **despliegue**.
        - Es la factoria de :yuno:`yunos`, es decir, de los binarios y sus configuraciones iniciales,
          que acabarán desplegados en los :node-job:`Nodo de trabajo`.

    * :node-job:`Nodo de trabajo`
        - Realiza la carga de trabajo. Contiene los binarios y sus configuraciones (:yuno:`yunos`).


:yuneta:`Yuneta` se instala en el directorio ``/yuneta``, es decir,
cuelga directamente del directorio root ``/`` del sistema de ficheros.

:yuneta:`Yuneta` no usa ningún otro directorio del sistemas de ficheros, tales como ``/usr`` o ``/var``,
a excepción de ``/etc`` que se usa para instalar
el arranque autómatico del servicio del :agent:`agente`.

.. warning::

    El directorio ``/yuneta`` y todos sus subdirectorios deben pertener al usuario y grupo **yuneta**.

:node-dev:`Nodo de desarrollo`
------------------------------

Se usa tanto para desarrollo como para funciones de despliegue.
Despliegues de las diferentes combinaciones de distribución/procesador que use nuestro proyecto o sistema.

Puedes realizar la instalación de manera semi-automática o manual.
Si no tienes mucha experiencia con Linux es aconsejable realizar
la instalación manual para experimentar con los comandos.

Instalación semi-automática con scripts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Puedes instalar yuneta de manera más rápida con estos scripts.

Baja este script, dale permisos de ejecución, y ejecútalo como usuario **root**:

    :download:`install-yuneta-dependencies.sh <_static/install-yuneta-dependencies.sh>`


Baja este script, dale permisos de ejecución, y ejecútalo como usuario **yuneta**:

    :download:`install-yuneta-packages.sh <_static/install-yuneta-packages.sh>`

Instalación manual
~~~~~~~~~~~~~~~~~~

Instalación paso a paso en la consola.

Aquí se dam instrucciones tanto para:

    - Debian y derivados (apt)
    - Red-Hat y derivados (yum).

La primera parte de la instalación necesita permisos de *root*. Contacte con su administrador de sistemas operativos si no los tiene.

La segunda parte de la instalación es Yuneta propiamente;
todo las operaciones pertenecen al dominio de *yuneta*.
Yuneta no necesita privilegios de root para operar,
excepto en la fase de instalación.


* Como **root**: instalar paquetes útiles::

    apt -y install vim rsync tree sudo ssh curl

* Como **root**: crear el usuario ``yuneta``::

    useradd yuneta -Um -s /bin/bash

* Si sale el warning : Setting locale failed::

    dpkg-reconfigure locales

* Como **root**: crear el directorio ``/yuneta`` si no existe::

    mkdir /yuneta

* Añadir en .bashrc ::

    umask 0002

* Poner nombre host::

    hostnamectl set-hostname {name-here}

    # y añadir a /etc/hosts <ip> <hostname>

* **IMPORTANTE** Como **root**: darle la propiedad a *yuneta* ::

    chown yuneta:yuneta /yuneta

* Como **root**: **OPCIONAL**, mejorar la seguridad de acceso ssh:

    Editar el fichero ``/etc/ssh/sshd_config`` para restringir el acceso como root::

        PermitRootLogin no

    Relanzar el servicio ssh::

        /etc/init.d/ssh restart

    Si el servidor está en una red pública (Internet),
    puedes instalar la utilidad `fail2ban <https://es.wikipedia.org/wiki/Fail2ban>`_ para blindar el servidor::

        apt -y install fail2ban

.. OJO modifica también
.. /yuneta/development/yuneta/^yuneta/docs/yuneta/_static/install-yuneta-dependencies.sh

* Como **root**: en Debian o similares, instalar los paquetes de desarrollo usados por :yuneta:`Yuneta`::

    apt -y install autotools-dev automake autogen libtool debmake cmake gettext mercurial git psmisc liblzma-dev zlib1g-dev libpcre3-dev libcurl4-openssl-dev libldap2-dev libidn11-dev libidn2-0-dev librtmp-dev libprocps-dev uuid-dev libarchive-dev libpq-dev can-utils libsocketcan2 libsocketcan-dev

* En Centos o similar::

    # ***WARNING** The Centos installation will no longer be updated.

    # sudo usermod -aG wheel yuneta # wheel group has sudo privileges

    yum -y group install "Development Tools"
    yum -y install pcre-devel zlib-devel zlib-static libuuid-devel psmisc xz-devel centos-release-scl libarchive-devel procps-ng-devel cmake


    # see https://www.howtoforge.com/tutorial/how-to-install-fail2ban-on-centos/
    yum -y install epel-release
    yum -y install fail2ban fail2ban-systemd
    systemctl enable fail2ban
    systemctl start fail2ban

* En Centos puede no estar instalardo el servidor que sincroniza la hora.
  Para instalar NTP (Network Time Protocol)::

    yum -y install ntp ntpdate ntp-doc
    chkconfig ntpd on
    ntpdate pool.ntp.org

    systemctl start ntpd
    systemctl enable ntpd
    systemctl status ntpd

    ntpq -p     # Para verificar la hora
    date -R

* Para cambiar el core dump filename

Editar el fichero ``/etc/sysctl.conf`` y añadir ``kernel.core_pattern = core.%e``

Relanzar con ``sysctl -p``

O también (?) añadir a ``/proc/sys/kernel/core_pattern`` la línea ``core.%e``
y en ``/proc/sys/kernel/core_uses_pid`` poner 0 si no quieres que se añada el pid.

* Para poner la zona horaria::

    sudo timedatectl set-timezone Europe/Madrid

.. warning::

    A partir de aquí, los comandos hay que ejecutarlos como usuario **yuneta**.

* A partir de aquí, los comandos hay que ejecutarlos como usuario **yuneta** ::

    su - yuneta

* O mejor: sal del equipo (``exit``) y vuelve a entrar
  por ssh con el usuario **yuneta** para comprobar los cambios en el servicio ssh::

    ssh yuneta@??.??.??.?? (ip del nodo)

* Como **yuneta**: instalar el framework :yuneta:`Yuneta`

    * Crea los directorios básicos ::

        mkdir -p /yuneta/bin
        mkdir -p /yuneta/agent
        mkdir -p /yuneta/development
        mkdir -p /yuneta/development/yuneta
        mkdir -p /yuneta/development/projects
        mkdir -p /yuneta/development/output

    * Instalación de **GObj-ecosistema** ::

        git clone https://github.com/gobj-ecosistema/external-libs.git /yuneta/development/yuneta/^gobj-ecosistema/external-libs
        git clone https://github.com/gobj-ecosistema/ghelpers.git /yuneta/development/yuneta/^gobj-ecosistema/ghelpers
        git clone https://github.com/gobj-ecosistema/ginsfsm.git /yuneta/development/yuneta/^gobj-ecosistema/ginsfsm
        git clone https://github.com/gobj-ecosistema/tests-g.git /yuneta/development/yuneta/^gobj-ecosistema/tests-g
        git clone https://github.com/gobj-ecosistema/stats.git /yuneta/development/yuneta/^gobj-ecosistema/stats
        git clone https://github.com/gobj-ecosistema/timeranger.git /yuneta/development/yuneta/^gobj-ecosistema/timeranger
        git clone https://github.com/gobj-ecosistema/ytls.git /yuneta/development/yuneta/^gobj-ecosistema/ytls

    * Instalación de **Yuneta** ::

        git clone https://github.com/yuneta/c-core /yuneta/development/yuneta/^yuneta/c-core
        git clone https://github.com/yuneta/c-rc_sqlite /yuneta/development/yuneta/^yuneta/c-rc_sqlite
        git clone https://github.com/yuneta/c-rc_treedb /yuneta/development/yuneta/^yuneta/c-rc_treedb
        git clone https://github.com/yuneta/js-core /yuneta/development/yuneta/^yuneta/js-core
        git clone https://github.com/yuneta/c-tls /yuneta/development/yuneta/^yuneta/c-tls
        git clone https://github.com/yuneta/c-postgres /yuneta/development/yuneta/^yuneta/c-postgres
        git clone https://github.com/yuneta/c-iot /yuneta/development/yuneta/^yuneta/c-iot
        git clone https://github.com/yuneta/packages /yuneta/development/yuneta/^yuneta/packages
        git clone https://github.com/yuneta/tests-y /yuneta/development/yuneta/^yuneta/tests-y
        git clone https://github.com/yuneta/web-skeleton3 /yuneta/development/yuneta/^yuneta/web-skeleton3
        git clone https://github.com/yuneta/ybatch /yuneta/development/yuneta/^yuneta/ybatch
        git clone https://github.com/yuneta/ycommand /yuneta/development/yuneta/^yuneta/ycommand
        git clone https://github.com/yuneta/ylist /yuneta/development/yuneta/^yuneta/ylist
        git clone https://github.com/yuneta/yshutdown /yuneta/development/yuneta/^yuneta/yshutdown
        git clone https://github.com/yuneta/ystats /yuneta/development/yuneta/^yuneta/ystats
        git clone https://github.com/yuneta/ytestconfig /yuneta/development/yuneta/^yuneta/ytestconfig
        git clone https://github.com/yuneta/yuno_agent /yuneta/development/yuneta/^yuneta/yuno_agent
        git clone https://github.com/yuneta/yuno_cli /yuneta/development/yuneta/^yuneta/yuno_cli
        git clone https://github.com/yuneta/yuno-skeleton /yuneta/development/yuneta/^yuneta/yuno-skeleton
        git clone https://github.com/yuneta/ygclass-rename /yuneta/development/yuneta/^yuneta/ygclass-rename
        git clone https://github.com/yuneta/docs /yuneta/development/yuneta/^yuneta/docs
        git clone https://github.com/yuneta/yscapec /yuneta/development/yuneta/^yuneta/yscapec
        git clone https://github.com/yuneta/mxgraph-js.git /yuneta/development/yuneta/^yuneta/mxgraph-js
        git clone https://github.com/yuneta/ytests /yuneta/development/yuneta/^yuneta/ytests
        git clone https://github.com/yuneta/extractjson /yuneta/development/yuneta/^yuneta/extractjson
        git clone https://github.com/yuneta/yclone-project /yuneta/development/yuneta/^yuneta/yclone-project
        git clone https://github.com/yuneta/yuno_agent22 /yuneta/development/yuneta/^yuneta/yuno_agent22

    * Instalación de **Yuno-store** ::

        git clone https://github.com/yuno-store/emailsender /yuneta/development/yuneta/^yunos/emailsender
        git clone https://github.com/yuno-store/emu_device /yuneta/development/yuneta/^yunos/emu_device
        git clone https://github.com/yuno-store/logcenter /yuneta/development/yuneta/^yunos/logcenter
        git clone https://github.com/yuno-store/watchfs /yuneta/development/yuneta/^yunos/watchfs
        git clone https://github.com/yuno-store/controlcenter /yuneta/development/yuneta/^yunos/controlcenter
        git clone https://github.com/yuno-store/sgateway /yuneta/development/yuneta/^yunos/sgateway
        git clone https://github.com/yuno-store/dba_postgres /yuneta/development/yuneta/^yunos/dba_postgres

* Si quieres directorios compartidos para el grupo
  (derecho de escritura para todos los usuarios del grupo *yuneta*) ::

    find /yuneta -type d -exec chmod g+s {} \;
    find /yuneta -type d -exec chmod g+w {} \;
    find /yuneta -type f -exec chmod g+w {} \;

Compilación de :yuneta:`Yuneta`
-------------------------------

Para facilitar la compilación decomprime este fichero que contiene varios CMakeLists.txt que agrupan los proyectos y un script para compilarlos::

    cp -a /yuneta/development/yuneta/^yuneta/packages/yuneta/* /yuneta/development/yuneta
    cp -a /yuneta/development/yuneta/^yuneta/packages/recompila.sh /yuneta/development/yuneta
    cp -a /yuneta/development/yuneta/^yuneta/packages/compila.sh /yuneta/development/yuneta
    cp -a /yuneta/development/yuneta/^yuneta/packages/yuneta-pull-from-github.sh /yuneta/development/yuneta

Y ahora ya puedes compilarlo todo (OJO, puede durar bastante tiempo) ::

    cd /yuneta/development/yuneta
    ./recompila.sh

Para compilar sin las librerias externas::

    cd /yuneta/development/yuneta
    ./compila.sh

Instalación del :agent:`Agente`
-------------------------------

Para instalar el :run-time:`Run-time` del Agente en el nodo de desarrollo, ejecutar::

    cd /yuneta/development/output/agent
    ./deploy_agent.sh
    cd /yuneta/agent/service
    sudo ./install-yuneta-service.sh

Ahora puedes rebootear el equipo para comprobar que el servicio del agente se inicia correctamente::

    sudo reboot 0

o puedes arrancarlo manualmente::

    /yuneta/agent/yuneta_agent --start

Una vez rebooteado el equipo o arrancado manualmente el servicio, ejecuta el :cli:`CLI`::

    /yuneta/bin/yuneta

Si te aparece una pantalla con las dos líneas inferiores de color blanco y naranja,
con algo así escrito::

    console>
    Wellcome to Yuneta. Type help for assistance.

Enhorabuena! ya tienes a :yuneta:`Yuneta` funcionado. Ahora conéctate al agente del nodo local y empieza a jugar.
Para cualquier duda, teclea ``help``, o simplemente ``h``.

Por comodidad para ejecutar los comandos de :yuneta:`Yuneta` añade a la variable $PATH las rutas::

    /yuneta/bin
    /yuneta/development/bin
    /yuneta/development/output/bin
    /yuneta/development/output/yunos


:node-job:`Nodo de trabajo`
---------------------------

Un :node-job:`nodo de trabajo` o de carga es aquel que solo contiene **binarios** de Yuneta,
que se deberán desplegar desde un :node-dev:`Nodo de desarrollo`,
que es quien los genera para la plataforma adecuada.

Para crear un :node-job:`nodo de trabajo` de :yuneta:`Yuneta`:

    * Crea el :run-time:`run-time` del :agent:`Agente` adecuado al dispositivo.

        Para crear un paquete ``.deb`` del :run-time:`run-time` del :agent:`Agente` usa los
        scripts del directorio ``/yuneta/development/yuneta/^yuneta/packages``.

        Por ejemplo para Debian/AMD64::

            cd /yuneta/development/yuneta/^yuneta/packages
            ./build-yuneta-agent-debian-AMD64.sh

        Los paquetes ``.deb`` se generan en el directorio en ``~/deb-build/``.

    * Ejemplo de instalación manual en nodo de trabajo con hostname ``nodo100``
      (sustituyelo por una ip o un hostname real),
      suponiendo que has generado la version ``3.2.0`` release ``1``: ::

        cd ~/deb-build/amd64
        scp yuneta-agent-3.2.0-1-amd64.deb yuneta@nodo100:
        ssh yuneta@nodo100
        sudo apt -y install ./yuneta-agent-3.2.0-1-amd64.deb

Actualización
-------------

Para actualizar el código fuente de :yuneta:`Yuneta`
con la última versión en github podemos usar el script::

    /yuneta/development/yuneta/yuneta-pull-from-github.sh

    ó

    /yuneta/development/yuneta/^yuneta/packages/yuneta-pull-from-github.sh

El contenido del script es::

    #!/bin/bash
    DIRECTORY="/yuneta/development/yuneta"

    if [ ! -d "$DIRECTORY" ];
    then
        echo "No existe el directorio '$DIRECTORY'"
        exit
    fi

    cd $DIRECTORY

    for d in */
    do
        if [[ $d =~ \^.* ]]
        then
            # group of projects
            GPROJECT="${d%/}"
            echo "^===>" $GPROJECT
            cd $GPROJECT
            GPROJECT=${GPROJECT:1}
            for s in */
            do
                # single project
                PROJECT="${s%/}"
                if [ "$PROJECT" == "build" ]; then
                    continue
                fi
                #echo "    ===>" $PROJECT
                cd $PROJECT
                git pull
                cd ..
            done
            cd ..
        else
            PROJECT="${d%/}"
            if [ "$PROJECT" == "build" ]; then
                continue
            fi
            #PROJECT="${s%/}"
            echo " ===>" $PROJECT
            cd $PROJECT
            git pull
            cd ..
        fi
    done
