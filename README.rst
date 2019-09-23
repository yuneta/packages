
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

Instalación del framework de desarrollo :yuneta:`Yuneta`
========================================================

Los :node:`nodos` de Yuneta pueden clasificarse en:

    * :node-dev:`Nodo de desarrollo`:
        - Contiene el código fuente de los proyectos y del framework Yuneta.
        - Es la factoria de :yuno:`yunos`, es decir, de los binarios y sus configuraciones iniciales,
          que acabarán desplegados en los :node-job:`Nodo de trabajo`.
        - Es aconsejable tener un :node-dev:`nodo de desarrollo`
          por cada tipo de procesador (x86_64, Arm, ...) y por cada tipo distribución de Linux (Debian, CentOs, ...) para proporcionar los binarios correctos a cada sistema.

    * :node-job:`Nodo de trabajo`
        - Realiza la carga de trabajo. Contiene los binarios y sus configuraciones (:yuno:`yunos`).


:yuneta:`Yuneta` se instala en el directorio ``/yuneta``, es decir,
cuelga directamente del directorio root ``/`` del sistema de ficheros.

:yuneta:`Yuneta` no usa ningún otro directorio del sistemas de ficheros, tales como ``/usr`` o ``/var``,
a excepción de ``/etc`` que se usa para instalar
el arranque autómatico del servicio del :agent:`agente`.

Es aconsejable que el directorio ``/yuneta`` disponga de su propia partición.

El directorio ``/yuneta`` y todos sus subdirectorios deben pertener al usuario y grupo **yuneta**.

Instalación de un :node-dev:`Nodo de desarrollo`
================================================

Ejemplo de instalación en un nodo con **Debian 9.5** teniendo permisos de *root*.

Si no tiene permisos de *root* contacte con su administrador de sistemas operativos.

* Como **root**: instalar paquetes útiles::

    apt -y install vim rsync tree sudo ssh curl

* Como **root**: crear el usuario ``yuneta``::

    adduser yuneta

* Si sale el warning : Setting locale failed::

    dpkg-reconfigure locales

* Como **root**: crear el directorio ``/yuneta`` y darle la propiedad a *yuneta* ::

    mkdir /yuneta
    chown yuneta:yuneta /yuneta

* Como **root**: ACONSEJABLE, mejorar la seguridad de acceso ssh:

    Editar el fichero ``/etc/ssh/sshd_config`` para restringir el acceso como root::

        PermitRootLogin no

    Relanzar el servicio ssh::

        /etc/init.d/ssh restart

    Si el servidor está en una red pública (Internet),
    puedes instalar la utilidad `fail2ban <https://es.wikipedia.org/wiki/Fail2ban>`_ para blindar el servidor::

        apt install fail2ban

* Como **root**: en Debian o similares, instalar los paquetes de desarrollo usados por :yuneta:`Yuneta`::

    apt -y install autotools-dev automake autogen libtool debmake cmake gettext mercurial git psmisc liblzma-dev libpcre3-dev libcurl4-openssl-dev libssl-dev libldap2-dev libidn11-dev libidn2-0-dev librtmp-dev libprocps-dev uuid-dev;

* En Centos o similar::

    # sudo usermod -aG wheel yuneta # wheel group has sudo privileges

    sudo yum group install "Development Tools"
    sudo yum install pcre-devel zlib-devel uuid-devel

    # see https://www.howtoforge.com/tutorial/how-to-install-fail2ban-on-centos/
    sudo yum install epel-release
    yum install fail2ban fail2ban-systemd

    sudo yum install xz-devel centos-release-scl

* A partir de aquí, los comandos hay que ejecutarlos como usuario **yuneta** ::

    su - yuneta

* O mejor: sal del equipo (``exit``) y vuelve a entrar
  por ssh con el usuario **yuneta** para comprobar los cambios en el servicio ssh::

    ssh yuneta@??.??.??.?? (ip del nodo)

* Como **yuneta**: instalar el framework :yuneta:`Yuneta`

    * Crea los directorios básicos ::

        mkdir /yuneta/bin
        mkdir /yuneta/agent
        mkdir /yuneta/development
        mkdir /yuneta/development/yuneta
        mkdir /yuneta/development/projects
        mkdir /yuneta/development/output

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
        git clone https://github.com/yuneta/js-core /yuneta/development/yuneta/^yuneta/js-core
        git clone https://github.com/yuneta/c-tls /yuneta/development/yuneta/^yuneta/c-tls
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

    * Instalación de **Yuno-store** ::

        git clone https://github.com/yuno-store/emailsender /yuneta/development/yuneta/^yunos/emailsender
        git clone https://github.com/yuno-store/emu_device /yuneta/development/yuneta/^yunos/emu_device
        git clone https://github.com/yuno-store/logcenter /yuneta/development/yuneta/^yunos/logcenter
        git clone https://github.com/yuno-store/watchfs /yuneta/development/yuneta/^yunos/watchfs

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

Y ahora ya puedes compilarlo todo (OJO, puede durar bastante tiempo) ::

    cd /yuneta/development/yuneta
    ./recompila.sh


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


Instalación de un :node-job:`Nodo de trabajo`
=============================================

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
        sudo apt install ./yuneta-agent-3.2.0-1-amd64.deb

