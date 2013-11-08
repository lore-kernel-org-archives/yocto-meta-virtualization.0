Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C885E01828
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Nov 2013 20:02:22 -0800 (PST)
Received: by mail-ie0-f171.google.com with SMTP id tp5so2545264ieb.30
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Nov 2013 20:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vNL26IGqBGcgAGkFOLaWxHZwQDJtnx9zGbDpQqN78DE=;
	b=hnnPNTk2BIWtqW9vmU7x0t6/kWDqu0bPrYNp7JS4QBTBE9JxJR1e8+QRagSlx7Qhx8
	2VvDutBZR4YbLgTjZwDGoTpaVaLs8dvxxkuJxgvuk06ENy7eQxqSMm9LGD3/R0w7jsUu
	fBIT6vk0Cj7Xset40tikNWuqmPPt80+VbrcFnDRXFzRPr/neY6tj6QiqcnR2hC6AZgus
	i1ahbEW+v+4u1Dh7n6ClKZ3BfgLx9M3q8LcpOrknbsthayVnxa7pR/Tu3Q505FiNGGkE
	snR9e/KEMpO1Id4OHi1HOhImodQRYoylm1XaNK+FLI/9Epyksn+hqkEcyD+/1r0PAzDh
	ph2Q==
X-Received: by 10.50.164.130 with SMTP id yq2mr571170igb.53.1383883341756;
	Thu, 07 Nov 2013 20:02:21 -0800 (PST)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id hv5sm1230089igb.9.2013.11.07.20.02.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 20:02:20 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  7 Nov 2013 23:01:03 -0500
Message-Id: <1383883267-31992-7-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
References: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 06/10] xen: remove old patches
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Nov 2013 04:02:24 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 .../xen/files/allow_disable_xend.patch             |  75 -----
 .../xen/files/ioemu-cross-gl-check.patch           |  29 --
 recipes-extended/xen/files/xend-config.sxp         | 304 ---------------------
 recipes-extended/xen/files/xenminiinit.sh          |  59 ----
 4 files changed, 467 deletions(-)
 delete mode 100644 recipes-extended/xen/files/allow_disable_xend.patch
 delete mode 100644 recipes-extended/xen/files/ioemu-cross-gl-check.patch
 delete mode 100644 recipes-extended/xen/files/xend-config.sxp
 delete mode 100755 recipes-extended/xen/files/xenminiinit.sh

diff --git a/recipes-extended/xen/files/allow_disable_xend.patch b/recipes-extended/xen/files/allow_disable_xend.patch
deleted file mode 100644
index 3318704..0000000
--- a/recipes-extended/xen/files/allow_disable_xend.patch
+++ /dev/null
@@ -1,75 +0,0 @@
---- xen-4.1.2/config/StdGNU.mk.sav	2012-03-08 12:30:26.047303578 -0700
-+++ xen-4.1.2/config/StdGNU.mk	2012-03-08 12:31:48.826696508 -0700
-@@ -56,6 +56,9 @@
- XEN_CONFIG_DIR = $(CONFIG_DIR)/xen
- XEN_SCRIPT_DIR = $(XEN_CONFIG_DIR)/scripts
- 
-+# Allow xend to be disabled in lieu of only libxl
-+CONFIG_ENABLE_XEND ?= y
-+
- SOCKET_LIBS =
- CURSES_LIBS = -lncurses
- PTHREAD_LIBS = -lpthread
---- xen-4.1.2/tools/Makefile.sav	2012-03-08 11:25:10.177301492 -0700
-+++ xen-4.1.2/tools/Makefile	2012-03-08 12:33:48.807302767 -0700
-@@ -15,7 +15,7 @@
- SUBDIRS-$(CONFIG_X86) += firmware
- SUBDIRS-$(ACM_SECURITY) += security
- SUBDIRS-y += console
--SUBDIRS-y += xenmon
-+SUBDIRS-$(CONFIG_ENABLE_XEND) += xenmon
- SUBDIRS-$(VTPM_TOOLS) += vtpm_manager
- SUBDIRS-$(VTPM_TOOLS) += vtpm
- SUBDIRS-y += xenstat
-@@ -36,17 +36,19 @@
- 
- SUBDIRS-y += xenpmd
- SUBDIRS-y += libxl
--SUBDIRS-y += remus
-+SUBDIRS-$(CONFIG_ENABLE_XEND) += remus
- SUBDIRS-$(CONFIG_X86) += xenpaging
- SUBDIRS-$(CONFIG_X86) += debugger/gdbsx
- SUBDIRS-$(CONFIG_X86) += debugger/kdd
- 
- # These don't cross-compile
- ifeq ($(XEN_COMPILE_ARCH),$(XEN_TARGET_ARCH))
-+ifneq ($(XEN_ENABLE_XEND),y)
- SUBDIRS-$(PYTHON_TOOLS) += python
- SUBDIRS-$(PYTHON_TOOLS) += pygrub
- SUBDIRS-$(OCAML_TOOLS) += ocaml
- endif
-+endif
- 
- # For the sake of linking, set the sys-root
- ifneq ($(CROSS_COMPILE),)
---- xen-4.1.2/tools/misc/Makefile.sav	2012-03-08 12:23:10.107321955 -0700
-+++ xen-4.1.2/tools/misc/Makefile	2012-03-08 12:34:54.466721729 -0700
-@@ -19,11 +19,13 @@
- SUBDIRS-$(CONFIG_MINITERM) += miniterm
- SUBDIRS := $(SUBDIRS-y)
- 
--INSTALL_BIN-y := xencons
-+INSTALL_BIN-y :=
-+INSTALL_BIN-$(CONFIG_ENABLE_XEND) += xencons
- INSTALL_BIN-$(CONFIG_X86) += xen-detect
- INSTALL_BIN := $(INSTALL_BIN-y)
- 
--INSTALL_SBIN-y := xm xen-bugtool xen-python-path xend xenperf xsview xenpm xen-tmem-list-parse gtraceview gtracestat xenlockprof xenwatchdogd
-+INSTALL_SBIN-y := xenperf xsview xenpm xen-tmem-list-parse gtraceview gtracestat xenlockprof xenwatchdogd
-+INSTALL_SBIN-$(CONFIG_ENABLE_XEND) += xm xend xsview xen-python-path xen-bugtool
- INSTALL_SBIN-$(CONFIG_X86) += xen-hvmctx xen-hvmcrash
- INSTALL_SBIN-$(CONFIG_MIGRATE) += xen-hptool
- INSTALL_SBIN := $(INSTALL_SBIN-y)
---- xen-4.1.2/tools/hotplug/NetBSD/Makefile.sav	2012-03-08 12:54:56.247306596 -0700
-+++ xen-4.1.2/tools/hotplug/NetBSD/Makefile	2012-03-08 12:57:50.337339410 -0700
-@@ -8,7 +8,9 @@
- XEN_SCRIPTS += vif-ip
- 
- XEN_SCRIPT_DATA =
--XEN_RCD_PROG = rc.d/xencommons rc.d/xend rc.d/xendomains rc.d/xen-watchdog
-+XEN_RCD_PROG-y := rc.d/xencommons rc.d/xendomains rc.d/xen-watchdog
-+XEN_RCD_PROG-$(CONFIG_ENABLE_XEND) += rc.d/xend 
-+XEN_RCD_PROG := $(XEN_RCD_PROG-y)
- 
- .PHONY: all
- all:
diff --git a/recipes-extended/xen/files/ioemu-cross-gl-check.patch b/recipes-extended/xen/files/ioemu-cross-gl-check.patch
deleted file mode 100644
index a1363ea..0000000
--- a/recipes-extended/xen/files/ioemu-cross-gl-check.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- qemu-xen-4.1-testing/configure	2012-02-20 09:01:08.219798969 -0700
-+++ xen-4.1-testing.hg/../git/configure	2012-02-20 09:03:27.876749305 -0700
-@@ -289,7 +289,7 @@
-             kqemu="yes"
-         fi
-     fi
--    if test -f /usr/include/sys/soundcard.h ; then
-+    if test -f ${CROSS_SYS_ROOT}/usr/include/sys/soundcard.h ; then
-         audio_drv_list="oss"
-     fi
-     audio_possible_drivers="oss sdl"
-@@ -872,7 +872,7 @@
- #endif
- int main( void ) { return (int) glGetString(GL_EXTENSIONS); }
- EOF
--if $cc $ARCH_CFLAGS -o $TMPE `$sdl_config --cflags --libs 2> /dev/null` -I/usr/include/GL $TMPC -lXext -lGL 2> /dev/null
-+if $cc $ARCH_CFLAGS -o $TMPE `$sdl_config --cflags --libs 2> /dev/null` -I${CROSS_SYS_ROOT}/usr/include/GL $TMPC -lXext -lGL 2> /dev/null
- then
- opengl="yes"
- else
-@@ -1450,7 +1450,7 @@
- then
-     echo "#define CONFIG_OPENGL 1" >> $config_h
-     echo "CONFIG_OPENGL=yes" >> $config_mak
--    echo "SDL_CFLAGS+=-I/usr/include/GL" >> $config_mak
-+    echo "SDL_CFLAGS+=-I${CROSS_SYS_ROOT}/usr/include/GL" >> $config_mak
-     echo "SDL_LIBS+=-lXext" >> $config_mak
-     echo "SDL_LIBS+=-lGL" >> $config_mak
- fi
diff --git a/recipes-extended/xen/files/xend-config.sxp b/recipes-extended/xen/files/xend-config.sxp
deleted file mode 100644
index 096bb55..0000000
--- a/recipes-extended/xen/files/xend-config.sxp
+++ /dev/null
@@ -1,304 +0,0 @@
-# -*- sh -*-
-
-#
-# Xend configuration file.
-#
-
-# This example configuration is appropriate for an installation that 
-# utilizes a bridged network configuration. Access to xend via http
-# is disabled.  
-
-# Commented out entries show the default for that entry, unless otherwise
-# specified.
-
-#(logfile /var/log/xen/xend.log)
-#(loglevel DEBUG)
-
-# Uncomment the line below.  Set the value to flask, acm, or dummy to 
-# select a security module.
-
-#(xsm_module_name dummy)
-
-# The Xen-API server configuration.
-#
-# This value configures the ports, interfaces, and access controls for the
-# Xen-API server.  Each entry in the list starts with either unix, a port
-# number, or an address:port pair.  If this is "unix", then a UDP socket is
-# opened, and this entry applies to that.  If it is a port, then Xend will
-# listen on all interfaces on that TCP port, and if it is an address:port
-# pair, then Xend will listen on the specified port, using the interface with
-# the specified address.
-#
-# The subsequent string configures the user-based access control for the
-# listener in question.  This can be one of "none" or "pam", indicating either
-# that users should be allowed access unconditionally, or that the local
-# Pluggable Authentication Modules configuration should be used.  If this
-# string is missing or empty, then "pam" is used.
-#
-# The final string gives the host-based access control for that listener. If
-# this is missing or empty, then all connections are accepted.  Otherwise,
-# this should be a space-separated sequence of regular expressions; any host
-# with a fully-qualified domain name or an IP address that matches one of
-# these regular expressions will be accepted.
-#
-# Example: listen on TCP port 9363 on all interfaces, accepting connections
-# only from machines in example.com or localhost, and allow access through
-# the unix domain socket unconditionally:
-#
-#   (xen-api-server ((9363 pam '^localhost$ example\\.com$')
-#                    (unix none)))
-#
-# Optionally, the TCP Xen-API server can use SSL by specifying the private
-# key and certificate location:
-#
-#                    (9367 pam '' xen-api.key xen-api.crt)
-#
-# Default:
-#   (xen-api-server ((unix)))
-
-
-(xend-http-server yes)
-(xend-unix-server yes)
-(xend-tcp-xmlrpc-server yes)
-(xend-unix-xmlrpc-server yes)
-#(xend-relocation-server no)
-(xend-relocation-server yes)
-#(xend-relocation-ssl-server no)
-(xend-udev-event-server yes)
-
-#(xend-unix-path /var/lib/xend/xend-socket)
-
-
-# Address and port xend should use for the legacy TCP XMLRPC interface, 
-# if xend-tcp-xmlrpc-server is set.
-#(xend-tcp-xmlrpc-server-address 'localhost')
-#(xend-tcp-xmlrpc-server-port 8006)
-
-# SSL key and certificate to use for the legacy TCP XMLRPC interface.
-# Setting these will mean that this port serves only SSL connections as
-# opposed to plaintext ones.
-#(xend-tcp-xmlrpc-server-ssl-key-file  xmlrpc.key)
-#(xend-tcp-xmlrpc-server-ssl-cert-file xmlrpc.crt)
-
-
-# Port xend should use for the HTTP interface, if xend-http-server is set.
-#(xend-port            8000)
-
-# Port xend should use for the relocation interface, if xend-relocation-server
-# is set.
-#(xend-relocation-port 8002)
-
-# Port xend should use for the ssl relocation interface, if
-# xend-relocation-ssl-server is set.
-#(xend-relocation-ssl-port 8003)
-
-# SSL key and certificate to use for the ssl relocation interface, if
-# xend-relocation-ssl-server is set.
-#(xend-relocation-server-ssl-key-file   xmlrpc.key)
-#(xend-relocation-server-ssl-cert-file  xmlrpc.crt)
-
-# Whether to use ssl as default when relocating.
-#(xend-relocation-ssl no)
-
-# Address xend should listen on for HTTP connections, if xend-http-server is
-# set.
-# Specifying 'localhost' prevents remote connections.
-# Specifying the empty string '' (the default) allows all connections.
-#(xend-address '')
-#(xend-address localhost)
-
-# Address xend should listen on for relocation-socket connections, if
-# xend-relocation-server is set.
-# Meaning and default as for xend-address above.
-# Also, interface name is allowed (e.g. eth0) there to get the
-# relocation address to be bound on.
-#(xend-relocation-address '')
-
-# The hosts allowed to talk to the relocation port.  If this is empty (the
-# default), then all connections are allowed (assuming that the connection
-# arrives on a port and interface on which we are listening; see
-# xend-relocation-port and xend-relocation-address above).  Otherwise, this
-# should be a space-separated sequence of regular expressions.  Any host with
-# a fully-qualified domain name or an IP address that matches one of these
-# regular expressions will be accepted.
-#
-# For example:
-#  (xend-relocation-hosts-allow '^localhost$ ^.*\\.example\\.org$')
-#
-#(xend-relocation-hosts-allow '')
-(xend-relocation-hosts-allow '^localhost$ ^localhost\\.localdomain$')
-
-# The limit (in kilobytes) on the size of the console buffer
-#(console-limit 1024)
-
-##
-# To bridge network traffic, like this:
-#
-# dom0: ----------------- bridge -> real eth0 -> the network
-#                            |
-# domU: fake eth0 -> vifN.0 -+
-#
-# use
-#
-# (network-script network-bridge)
-#
-# Your default ethernet device is used as the outgoing interface, by default. 
-# To use a different one (e.g. eth1) use
-#
-# (network-script 'network-bridge netdev=eth1')
-#
-# The bridge is named eth0, by default (yes, really!)
-#
-
-# It is normally much better to create the bridge yourself in
-# /etc/network/interfaces.  network-bridge start does nothing if you
-# already have a bridge, and network-bridge stop does nothing if the
-# default bridge name (normally eth0) is not a bridge.  See
-# bridge-utils-interfaces(5) for full information on the syntax in
-# /etc/network/interfaces, but you probably want something like this:
-#    iface xenbr0 inet static
-#        address [etc]
-#        netmask [etc]
-#        [etc]
-#        bridge_ports eth0
-#
-# To have network-bridge create a differently-named bridge, use:
-# (network-script 'network-bridge bridge=<name>')
-#
-# It is possible to use the network-bridge script in more complicated
-# scenarios, such as having two outgoing interfaces, with two bridges, and
-# two fake interfaces per guest domain.  To do things like this, write
-# yourself a wrapper script, and call network-bridge from it, as appropriate.
-#
-(network-script network-bridge)
-
-# The script used to control virtual interfaces.  This can be overridden on a
-# per-vif basis when creating a domain or a configuring a new vif.  The
-# vif-bridge script is designed for use with the network-bridge script, or
-# similar configurations.
-#
-# If you have overridden the bridge name using
-# (network-script 'network-bridge bridge=<name>') then you may wish to do the
-# same here.  The bridge name can also be set when creating a domain or
-# configuring a new vif, but a value specified here would act as a default.
-#
-# If you are using only one bridge, the vif-bridge script will discover that,
-# so there is no need to specify it explicitly.  The default is to use
-# the bridge which is listed first in the output from brctl.
-#
-(vif-script vif-bridge)
-
-
-## Use the following if network traffic is routed, as an alternative to the
-# settings for bridged networking given above.
-#(network-script network-route)
-#(vif-script     vif-route)
-
-
-## Use the following if network traffic is routed with NAT, as an alternative
-# to the settings for bridged networking given above.
-#(network-script network-nat)
-#(vif-script     vif-nat)
-
-# dom0-min-mem is the lowest permissible memory level (in MB) for dom0.
-# This is a minimum both for auto-ballooning (as enabled by
-# enable-dom0-ballooning below) and for xm mem-set when applied to dom0.
-(dom0-min-mem 196)
-
-# Whether to enable auto-ballooning of dom0 to allow domUs to be created.
-# If enable-dom0-ballooning = no, dom0 will never balloon out.
-(enable-dom0-ballooning yes)
-
-# 32-bit paravirtual domains can only consume physical
-# memory below 168GB. On systems with memory beyond that address,
-# they'll be confined to memory below 128GB.
-# Using total_available_memory (in GB) to specify the amount of memory reserved
-# in the memory pool exclusively for 32-bit paravirtual domains.
-# Additionally you should use dom0_mem = <-Value> as a parameter in 
-# xen kernel to reserve the memory for 32-bit paravirtual domains, default 
-# is "0" (0GB).  
-(total_available_memory 0) 
-
-# In SMP system, dom0 will use dom0-cpus # of CPUS
-# If dom0-cpus = 0, dom0 will take all cpus available
-(dom0-cpus 0)
-
-# Whether to enable core-dumps when domains crash.
-#(enable-dump no)
-
-# The tool used for initiating virtual TPM migration
-#(external-migration-tool '')
-
-# The interface for VNC servers to listen on. Defaults
-# to 127.0.0.1  To restore old 'listen everywhere' behaviour
-# set this to 0.0.0.0
-#(vnc-listen '127.0.0.1')
-
-# The default password for VNC console on HVM domain.
-# Empty string is no authentication.
-(vncpasswd '')
-
-# The VNC server can be told to negotiate a TLS session
-# to encryption all traffic, and provide x509 cert to
-# clients enabling them to verify server identity. The
-# GTK-VNC widget, virt-viewer, virt-manager and VeNCrypt
-# all support the VNC extension for TLS used in QEMU. The
-# TightVNC/RealVNC/UltraVNC clients do not.
-#
-# To enable this create x509 certificates / keys in the
-# directory ${XEN_CONFIG_DIR} + vnc
-#
-#  ca-cert.pem       - The CA certificate
-#  server-cert.pem   - The Server certificate signed by the CA
-#  server-key.pem    - The server private key
-#
-# and then uncomment this next line
-# (vnc-tls 1)
-
-# The certificate dir can be pointed elsewhere..
-#
-# (vnc-x509-cert-dir vnc)
-
-# The server can be told to request & validate an x509
-# certificate from the client. Only clients with a cert
-# signed by the trusted CA will be able to connect. This
-# is more secure the password auth alone. Passwd auth can
-# used at the same time if desired. To enable client cert
-# checking uncomment this:
-#
-# (vnc-x509-verify 1)
-
-# The default keymap to use for the VM's virtual keyboard
-# when not specififed in VM's configuration
-#(keymap 'en-us')
-
-# Script to run when the label of a resource has changed.
-#(resource-label-change-script '')
-
-# Rotation count of qemu-dm log file.
-#(qemu-dm-logrotate-count 10)
-
-# Path where persistent domain configuration is stored.
-# Default is /var/lib/xend/domains/
-#(xend-domains-path /var/lib/xend/domains)
-
-# Number of seconds xend will wait for device creation and
-# destruction
-#(device-create-timeout 100)
-#(device-destroy-timeout 100)
-
-# When assigning device to HVM guest, we use the strict check for HVM guest by
-# default. (For PV guest, we use loose check automatically if necessary.)
-# When we assign device to HVM guest, if we meet with the co-assignment
-# issues or the ACS issue, we could try changing the option to 'no' -- however,
-# we have to realize this may incur security issue and we can't make sure the
-# device assignment could really work properly even after we do this.
-#(pci-passthrough-strict-check yes)
-
-# If we have a very big scsi device configuration, start of xend is slow,
-# because xend scans all the device paths to build its internal PSCSI device
-# list.  If we need only a few devices for assigning to a guest, we can reduce
-# the scan to this device. Set list list of device paths in same syntax like in
-# command lsscsi, e.g. ('16:0:0:0' '15:0') 
-# (pscsi-device-mask ('*'))
-
diff --git a/recipes-extended/xen/files/xenminiinit.sh b/recipes-extended/xen/files/xenminiinit.sh
deleted file mode 100755
index 22d5008..0000000
--- a/recipes-extended/xen/files/xenminiinit.sh
+++ /dev/null
@@ -1,59 +0,0 @@
-#!/bin/sh
-
-# This is currently a very raw init script for xen-minimal
-# Feel free to expand and make more useful
-
-STARTDOMAINS="rtos freedos"
-
-# Shutdown Xen domains
-for foo in $STARTDOMAINS ; do
-	xl destroy $foo
-done
-
-# Stop and Startup Xen common
-if test -f /etc/init.d/xencommons ; then
-	echo Using Xen standard init scripts
-#	/etc/init.d/libvirtd stop
-#	/etc/init.d/xendomains stop
-#	/etc/init.d/xencommons stop
-#
-#	/etc/init.d/xencommons start
-#	/etc/init.d/libvirtd start
-#	/etc/init.d/xendomains start
-else
-	echo Skipping Xen standard init scripts
-
-	killall xenstored
-	killall xenconsoled
-	umount /proc/xen
-
-	# Fix up device nodes
-	if pidof udevd ; then 
-		echo Udev running.  Skipping mdev fixups
-	else
-		rm -rf /dev/xen
-		mkdir /dev/xen
-		for foo in /dev/xen!* ; do ln -s $foo /dev/xen/`echo $foo | cut -f 2 -d '!'` ; done
-	fi
-
-	mount -t xenfs xenfs /proc/xen
-	xenstored --pid-file=/var/run/xenstored.pid
-	xenstore-write "/local/domain/0/name" "Domain-0"
-	xenconsoled --pid-file=/var/run/xenconsoled.pid
-fi
-
-# Remove the images we have
-cd /tmp
-rm -rf xen
-
-# Grab and start the VM images
-mkdir xen
-cd xen
-for foo in $STARTDOMAINS ; do
-	wget http://candidates/xen/images/$foo.zip
-	unzip $foo.zip
-	xl create $foo.cfg
-done
-
-# Fix up the Webmin server with a new admin password
-test -f /usr/libexec/webmin/changepass.pl && /usr/libexec/webmin/changepass.pl /etc/webmin admin password
-- 
1.8.4.rc3


