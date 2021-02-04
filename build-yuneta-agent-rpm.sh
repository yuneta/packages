# Reference:
# http://stackoverflow.com/questions/880227/what-is-the-minimum-i-have-to-do-to-create-an-rpm-file
#
#   Comandos utiles
#   $ rpm -i yuneta_agent-VERSION-RELEASE.x86_64, instala el paquete
#   $ rpm -e yuneta_agent, desinstala el paquete
#   $ rpm -q yuneta_agent
#               $ yuneta_agent-2.0.0-3.x86_64 o el que sea.
#   $ rpm -q --requires yuneta_agent -> ver dependencias
#
#   RECUERDA:
#
#
#   Sun Mon Tue Wed Thu Fri Sat
#
#
#   Release 1
#   ---------
#


VERSION="4.8.5"
RELEASE="1"
DATE="Fri Jan 27 2017" TODO

#----------------------------------------#
#   Create rpm environment
#----------------------------------------#
mkdir -p ~/rpmbuild/{RPMS,SRPMS,BUILD,SOURCES,SPECS,tmp}

cat <<EOF >~/.rpmmacros
%_topdir   %(echo $HOME)/rpmbuild
%_tmppath  %{_topdir}/tmp
EOF

#----------------------------------------#
#   Create tarball of yuneta agent
#----------------------------------------#
cd ~/rpmbuild
mkdir -p yuneta_agent-$VERSION/yuneta/bin
cp -a /yuneta/bin/y* yuneta_agent-$VERSION/yuneta/bin/
cp -a /yuneta/agent yuneta_agent-$VERSION/yuneta/

cp -a --dereference /yuneta/bin/nginx/ yuneta_agent-$VERSION/yuneta/bin/

tar -zcvf yuneta_agent-$VERSION.tar.gz yuneta_agent-$VERSION/

#----------------------------------------#
#   Copy to the source dir
#----------------------------------------#
cp yuneta_agent-$VERSION.tar.gz SOURCES/

cat <<EOF > SPECS/yuneta_agent.spec
# Don't try fancy stuff like debuginfo, which is useless on binary-only
# packages. Don't strip binary too
# Be sure buildpolicy set to do nothing
%define        __spec_install_post %{nil}
%define          debug_package %{nil}
%define        __os_install_post %{_dbpath}/brp-compress

Summary: Yuneta Agent
Name: yuneta_agent
Version: $VERSION
Release: $RELEASE
License: MIT
Group: Development/Tools
SOURCE0 : %{name}-%{version}.tar.gz
URL: http://yuneta.io
Requires: curl, psmisc, tree, vim-enhanced, rrdtool, rsync

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
%{summary}

%prep
%setup -q

%build
# Empty section.

%install
rm -rf %{buildroot}
mkdir -p  %{buildroot}

# in builddir
cp -a * %{buildroot}

%clean
rm -rf %{buildroot}


%files
/yuneta/bin/ybatch
/yuneta/bin/ylist
/yuneta/bin/yshutdown
/yuneta/bin/ystats
/yuneta/bin/ytestconfig
/yuneta/bin/yuneta
/yuneta/agent/service/install-yuneta-service.sh
/yuneta/agent/service/remove-yuneta-service.sh
/yuneta/agent/service/yuneta_agent
/yuneta/agent/yuneta_agent
/yuneta/agent/yuneta_agent.json
/yuneta/agent/ncurses/
/yuneta/bin/nginx/

%defattr(0664,yuneta,gyuneta,02775)

#%config(noreplace) %{_sysconfdir}/%{name}/%{name}.conf
#%{_bindir}/*

%pre
chmod 775 /yuneta -R
chmod g+s /yuneta -R

%post
chown yuneta:gyuneta /yuneta -R

# %preun /yuneta/agent/service/remove-yuneta-service.sh

%changelog
* $DATE Niyamaka <niyamaka@yuneta.io> $VERSION-1
- First Build

EOF

#----------------------------------------#
#   Build the rpm
#----------------------------------------#
rpmbuild -ba SPECS/yuneta_agent.spec
