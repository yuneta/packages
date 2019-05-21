#!/bin/bash
# Reference:
#
#   Comandos utiles
#   $ sudo dpkg -i <paquete.deb>            Para instalar el paquete sin instalar dependencias.
#   $ sudo apt -y install ./<paquete.deb>   Para instalar el paquete CON dependencias.
#   RECUERDA:
#
#
#   Release 1
#   ----------
#   Con la versión  3.2.0 de Yuneta
#

PROYECT=$1
VERSION=$2
RELEASE=$3
ARCHITECTURE=$4
PACKAGE="$PROYECT-$VERSION-$RELEASE-$ARCHITECTURE"

#----------------------------------------#
#   Create deb environment
#----------------------------------------#
mkdir -p ~/deb-build/$ARCHITECTURE
cd ~/deb-build/$ARCHITECTURE

rm -rf $PACKAGE

mkdir -p $PACKAGE/DEBIAN
mkdir -p $PACKAGE/etc/init.d
mkdir -p $PACKAGE/etc/profile.d
mkdir -p $PACKAGE/yuneta/agent
mkdir -p $PACKAGE/yuneta/bin
mkdir -p $PACKAGE/yuneta/gui
mkdir -p $PACKAGE/yuneta/public
mkdir -p $PACKAGE/yuneta/realms
mkdir -p $PACKAGE/yuneta/repos
mkdir -p $PACKAGE/yuneta/share

cp -a /yuneta/bin/y* $PACKAGE/yuneta/bin/
cp -a /yuneta/agent $PACKAGE/yuneta/
cp -a --dereference /yuneta/bin/nginx/ $PACKAGE/yuneta/bin/
cp -a --dereference /yuneta/bin/ncurses/ $PACKAGE/yuneta/bin/
cp /yuneta/agent/service/yuneta_agent $PACKAGE/etc/init.d

cat <<EOF >./$PACKAGE/etc/profile.d/yuneta.sh
export PATH=\$PATH:/yuneta/bin
EOF

STRINGX=$(du -s $PACKAGE/yuneta)
ARRAYX=( $STRINGX )
SIZEX=${ARRAYX[0]}

cat <<EOF >./$PACKAGE/DEBIAN/conffiles
/etc/init.d/yuneta_agent
/etc/profile.d/yuneta.sh
EOF

cat <<EOF >./$PACKAGE/DEBIAN/control
Package: yuneta-agent
Version: $VERSION
Architecture: $ARCHITECTURE
Maintainer: Niyamaka.
Section: net
Installed-Size: $SIZEX
Homepage: yuneta.io
Priority: Optional
Depends: debconf, sudo, rsync, tree, vim, curl, adduser, libc6,  libssl1.1 | libssl1.0.2 | libssl1.0.0
Description: Yuneta agent run-time.
 Install this run-time and be a Yuneta's node. Search and Select the Realms to Belong.
EOF

cat <<EOF >./$PACKAGE/DEBIAN/postinst
#!/bin/sh
# postinst script for yuneta
#
# see: dh_installdeb(1)

set -e

setup_yuneta_user() {
    if ! getent group yuneta >/dev/null; then
        addgroup --quiet --system yuneta
    fi

    if ! getent passwd yuneta >/dev/null; then
        adduser --quiet --system --ingroup yuneta --shell /bin/bash yuneta
    fi
}

fix_permissions() {
    chown yuneta:yuneta /yuneta -R
    chmod g+w /yuneta
    chmod g+w /yuneta/bin
    chmod g+w /yuneta/gui
    chmod g+w /yuneta/public
    chmod g+w /yuneta/realms
    chmod g+w /yuneta/repos
    chmod g+w /yuneta/share
    chmod g+s /yuneta
    chmod g+s /yuneta/bin
    chmod g+s /yuneta/gui
    chmod g+s /yuneta/public
    chmod g+s /yuneta/realms
    chmod g+s /yuneta/repos
    chmod g+s /yuneta/share
}

case "\$1" in
    configure)
        setup_yuneta_user
        fix_permissions
    ;;

    abort-upgrade|abort-remove|abort-deconfigure)
    ;;

    *)
        echo "postinst called with unknown argument '\$1'" >&2
        exit 1
    ;;
esac

if [ "\$1" = "configure" ] || [ "\$1" = "abort-upgrade" ]; then
    if [ -x "/etc/init.d/yuneta_agent" ]; then
        update-rc.d yuneta_agent defaults >/dev/null
    fi
    if [ -x "/etc/init.d/yuneta_agent" ]; then
        invoke-rc.d yuneta_agent start || exit \$?
    fi
fi
# End automatically added section

exit 0
EOF


cat <<EOF >./$PACKAGE/DEBIAN/postrm
#!/bin/sh
# postrm script for yuneta_agent
#
# see: dh_installdeb(1)

set -e

case "\$1" in
    remove|purge)
        rm -f /etc/init.d/yuneta_agent
        update-rc.d -f yuneta_agent remove >/dev/null
    ;;

    upgrade|failed-upgrade)
    ;;

    *)
        echo "postrm called with unknown argument '\$1'" >&2
        exit 1
    ;;
esac

# In case this system is running systemd, we make systemd reload the unit files
# to pick up changes.
if [ -d /run/systemd/system ] ; then
    systemctl --system daemon-reload >/dev/null || true
fi
# End automatically added section

exit 0
EOF


cat <<EOF >./$PACKAGE/DEBIAN/prerm
#!/bin/sh
# prerm script for yuneta_agent
#
# see: dh_installdeb(1)

set -e

case "\$1" in
    remove|purge|deconfigure)
        if [ -x /etc/init.d/yuneta_agent ]; then
            if [ -x /usr/sbin/invoke-rc.d ]; then
                invoke-rc.d yuneta_agent stop
            else
                /etc/init.d/yuneta_agent stop
            fi
        fi
    ;;

    upgrade)
    ;;
    failed-upgrade)
    ;;

    *)
        echo "prerm called with unknown argument '\$1'" >&2
        exit 1
    ;;
esac

if [ -x "/etc/init.d/yuneta_agent" ]; then
    invoke-rc.d yuneta_agent stop || exit \$?
fi
# End automatically added section


exit 0
EOF

chmod +x ./$PACKAGE/DEBIAN/postinst
chmod +x ./$PACKAGE/DEBIAN/postrm
chmod +x ./$PACKAGE/DEBIAN/prerm

# chown root:root -R $PACKAGE
rm -f ~/deb-build/$ARCHITECTURE/$PACKAGE.deb

#----------------------------------------#
#   Build the rpm
#----------------------------------------#
dpkg -b $PACKAGE

cp ~/deb-build/$ARCHITECTURE/$PACKAGE.deb /yuneta/development/yuneta/^yuneta/docs/docs/installation/downloads
