Return-Path: <alejandro.delcastillo@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A45DE009EF; Thu, 28 May 2015 09:14:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [130.164.80.23 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD8EEE009CC
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 May 2015 09:14:07 -0700 (PDT)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t4SGE5Vv004250 for <meta-virtualization@yoctoproject.org>;
	Thu, 28 May 2015 11:14:05 -0500
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015052811140561-710036 ;
	Thu, 28 May 2015 11:14:05 -0500 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 28 May 2015 11:13:59 -0500
Message-Id: <1432829639-10143-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 05/28/2015 11:14:05 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 05/28/2015 11:14:05 AM,
	Serialize complete at 05/28/2015 11:14:05 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-05-28_04:, , signatures=0
Subject: [PATCH] salt: upgrade to 2015.5
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
X-List-Received-Date: Thu, 28 May 2015 16:14:12 -0000

python-request is now only a dependency of salt-cloud.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 .../recipes-support/salt/salt_2014.7.4.bb          | 145 ---------------------
 .../recipes-support/salt/salt_2015.5.0.bb          | 144 ++++++++++++++++++++
 2 files changed, 144 insertions(+), 145 deletions(-)
 delete mode 100644 meta-openstack/recipes-support/salt/salt_2014.7.4.bb
 create mode 100644 meta-openstack/recipes-support/salt/salt_2015.5.0.bb

diff --git a/meta-openstack/recipes-support/salt/salt_2014.7.4.bb b/meta-openstack/recipes-support/salt/salt_2014.7.4.bb
deleted file mode 100644
index 5b618e0..0000000
--- a/meta-openstack/recipes-support/salt/salt_2014.7.4.bb
+++ /dev/null
@@ -1,145 +0,0 @@
-HOMEPAGE = "http://saltstack.com/"
-SECTION = "admin"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5357642471cfab4740d1d0a20c51af6a"
-DEPENDS = "\
-           python-msgpack \
-           python-pyyaml \
-           python-jinja2 \
-           python-markupsafe \
-           python-requests \
-           python-pyzmq \
-           python-pycrypto \
-           python-m2crypto \
-"
-
-SRCNAME = "salt"
-SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-           file://set_python_location_hashbang.patch \
-           file://minion \
-           file://salt-minion \
-           file://salt-common.bash_completion \
-           file://salt-common.logrotate \
-           file://salt-api \
-           file://salt-master \
-           file://master \
-           file://salt-syndic \
-           file://cloud \
-           file://roster \
-"
-
-SRC_URI[md5sum] = "622404c0a6c38224f82a4c7b2927db61"
-SRC_URI[sha256sum] = "0adf4c138ebd26745b1d1157be0772d89da3582fe8a6622a8031cbe32a28e9f3"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools update-rc.d
-
-PACKAGES += "\
-           ${PN}-api \
-           ${PN}-cloud \
-           ${PN}-common \
-           ${PN}-master \
-           ${PN}-minion \
-           ${PN}-ssh \
-           ${PN}-syndic \
-           ${PN}-bash-completion \
-"
-
-do_install_append() {
-        install -d ${D}${sysconfdir}/bash_completion.d/
-        install -m 0644 ${WORKDIR}/salt-common.bash_completion ${D}${sysconfdir}/bash_completion.d/${PN}-common
-        install -d ${D}${sysconfdir}/logrotate.d/
-        install -m 0644 ${WORKDIR}/salt-common.logrotate ${D}${sysconfdir}/logrotate.d/${PN}-common
-        install -d ${D}${sysconfdir}/init.d/
-        install -m 0755 ${WORKDIR}/salt-minion ${D}${sysconfdir}/init.d/${PN}-minion
-        install -m 0755 ${WORKDIR}/salt-api ${D}${sysconfdir}/init.d/${PN}-api
-        install -m 0755 ${WORKDIR}/salt-master ${D}${sysconfdir}/init.d/${PN}-master
-        install -m 0755 ${WORKDIR}/salt-syndic ${D}${sysconfdir}/init.d/${PN}-syndic
-        install -d ${D}${sysconfdir}/${PN}/
-        install -m 0644 ${WORKDIR}/minion ${D}${sysconfdir}/${PN}/minion
-        install -m 0644 ${WORKDIR}/master ${D}${sysconfdir}/${PN}/master
-        install -m 0644 ${WORKDIR}/cloud ${D}${sysconfdir}/${PN}/cloud
-        install -m 0644 ${WORKDIR}/roster ${D}${sysconfdir}/${PN}/roster
-        install -d ${D}${sysconfdir}/${PN}/cloud.conf.d ${D}${sysconfdir}/${PN}/cloud.profiles.d ${D}${sysconfdir}/${PN}/cloud.providers.d
-}
-
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN} = ""
-
-INITSCRIPT_PACKAGES = "${PN}-minion ${PN}-api ${PN}-master ${PN}-syndic"
-
-DESCRIPTION_COMMON = "salt is a powerful remote execution manager that can be used to administer servers in a\
- fast and efficient way. It allows commands to be executed across large groups of servers. This means systems\
- can be easily managed, but data can also be easily gathered. Quick introspection into running systems becomes\
- a reality. Remote execution is usually used to set up a certain state on a remote system. Salt addresses this\
- problem as well, the salt state system uses salt state files to define the state a server needs to be in. \
-Between the remote execution system, and state management Salt addresses the backbone of cloud and data center\
- management."
-
-SUMMARY_${PN}-minion = "client package for salt, the distributed remote execution system"
-DESCRIPTION_${PN}-minion = "${DESCRIPTION_COMMON} This particular package provides the worker agent for salt."
-RDEPENDS_${PN}-minion = "python ${PN}-common (= ${EXTENDPKGV}) python-m2crypto python-pycrypto python-msgpack python-pyzmq (>= 13.1.0)"
-RRECOMMENDS_${PN}-minion_append_x64 = "dmidecode"
-RSUGGESTS_${PN}-minion = "python-augeas"
-CONFFILES_${PN}-minion = "${sysconfdir}/${PN}/minion ${sysconfdir}/init.d/${PN}-minion"
-FILES_${PN}-minion = "${bindir}/${PN}-minion ${sysconfdir}/${PN}/minion.d/ ${CONFFILES_${PN}-minion}"
-INITSCRIPT_NAME_${PN}-minion = "${PN}-minion"
-INITSCRIPT_PARAMS_${PN}-minion = "defaults"
-
-SUMMARY_${PN}-common = "shared libraries that salt requires for all packages"
-DESCRIPTION_${PN}-common ="${DESCRIPTION_COMMON} This particular package provides shared libraries that \
-salt-master, salt-minion, and salt-syndic require to function."
-RDEPENDS_${PN}-common = "python (>= 2.7) python (< 2.8) python-jinja2 python-pyyaml python-requests"
-RRECOMMENDS_${PN}-common = "lsb"
-RSUGGESTS_${PN}-common = "python-mako python-git"
-RCONFLICTS_${PN}-common = "python-mako (< 0.7.0)"
-CONFFILES_${PN}-common="${sysconfdir}/logrotate.d/${PN}-common"
-FILES_${PN}-common = "${bindir}/${PN}-call ${libdir}/python2.7/ ${CONFFILES_${PN}-common}"
-
-SUMMARY_${PN}-ssh = "remote manager to administer servers via salt"
-DESCRIPTION_${PN}-ssh = "${DESCRIPTION_COMMON} This particular package provides the salt ssh controller. It \
-is able to run salt modules and states on remote hosts via ssh. No minion or other salt specific software needs\
- to be installed on the remote host."
-RDEPENDS_${PN}-ssh = "python ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
-CONFFILES_${PN}-ssh="${sysconfdir}/${PN}/roster"
-FILES_${PN}-ssh = "${bindir}/${PN}-ssh ${CONFFILES_${PN}-ssh}"
-
-SUMMARY_${PN}-api = "generic, modular network access system"
-DESCRIPTION_${PN}-api = "a modular interface on top of Salt that can provide a variety of entry points into a \
-running Salt system. It can start and manage multiple interfaces allowing a REST API to coexist with XMLRPC or \
-even a Websocket API. The Salt API system is used to expose the fundamental aspects of Salt control to external\
- sources. salt-api acts as the bridge between Salt itself and REST, Websockets, etc. Documentation is available\
- on Read the Docs: http://salt-api.readthedocs.org/"
-RDEPENDS_${PN}-api = "python ${PN}-master"
-RSUGGESTS_${PN}-api = "python-cherrypy"
-CONFFILES_${PN}-api = "${sysconfdir}/init.d/${PN}-api"
-FILES_${PN}-api = "${bindir}/${PN}-api ${CONFFILES_${PN}-api}"
-INITSCRIPT_NAME_${PN}-api = "${PN}-api"
-INITSCRIPT_PARAMS_${PN}-api = "defaults"
-
-SUMMARY_${PN}-master = "remote manager to administer servers via salt"
-DESCRIPTION_${PN}-master ="${DESCRIPTION_COMMON} This particular package provides the salt controller."
-RDEPENDS_${PN}-master = "python ${PN}-common (= ${EXTENDPKGV}) python-m2crypto python-pycrypto python-msgpack python-pyzmq (>= 13.1.0)"
-CONFFILES_${PN}-master="${sysconfdir}/init.d/${PN}-master  ${sysconfdir}/${PN}/master"
-FILES_${PN}-master = "${bindir}/${PN} ${bindir}/${PN}-cp ${bindir}/${PN}-key ${bindir}/${PN}-master ${bindir}/${PN}-run ${bindir}/${PN}-unity ${CONFFILES_${PN}-master}"
-INITSCRIPT_NAME_${PN}-master = "${PN}-master"
-INITSCRIPT_PARAMS_${PN}-master = "defaults"
-
-SUMMARY_${PN}-syndic = "master-of-masters for salt, the distributed remote execution system"
-DESCRIPTION_${PN}-syndic = "${DESCRIPTION_COMMON} This particular package provides the master of masters for \
-salt; it enables the management of multiple masters at a time."
-RDEPENDS_${PN}-syndic = "python ${PN}-master (= ${EXTENDPKGV})"
-CONFFILES_${PN}-syndic="${sysconfdir}/init.d/${PN}-syndic"
-FILES_${PN}-syndic = "${bindir}/${PN}-syndic ${CONFFILES_${PN}-syndic}"
-INITSCRIPT_NAME_${PN}-syndic = "${PN}-syndic"
-INITSCRIPT_PARAMS_${PN}-syndic = "defaults"
-
-SUMMARY_${PN}-cloud = "public cloud VM management system"
-DESCRIPTION_${PN}-cloud = "provision virtual machines on various public clouds via a cleanly controlled profile and mapping system."
-RDEPENDS_${PN}-cloud = "python ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
-RSUGGESTS_${PN}-cloud = "python-netaddr python-botocore"
-CONFFILES_${PN}-cloud = "${sysconfdir}/${PN}/cloud"
-FILES_${PN}-cloud = "${bindir}/${PN}-cloud ${sysconfdir}/${PN}/cloud.conf.d/ ${sysconfdir}/${PN}/cloud.profiles.d/ ${sysconfdir}/${PN}/cloud.providers.d/ ${CONFFILES_${PN}-cloud}"
-
-FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/${PN}-common"
diff --git a/meta-openstack/recipes-support/salt/salt_2015.5.0.bb b/meta-openstack/recipes-support/salt/salt_2015.5.0.bb
new file mode 100644
index 0000000..0eb6f9d
--- /dev/null
+++ b/meta-openstack/recipes-support/salt/salt_2015.5.0.bb
@@ -0,0 +1,144 @@
+HOMEPAGE = "http://saltstack.com/"
+SECTION = "admin"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5357642471cfab4740d1d0a20c51af6a"
+DEPENDS = "\
+           python-msgpack \
+           python-pyyaml \
+           python-jinja2 \
+           python-markupsafe \
+           python-pyzmq \
+           python-pycrypto \
+           python-m2crypto \
+"
+
+SRCNAME = "salt"
+SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+           file://set_python_location_hashbang.patch \
+           file://minion \
+           file://salt-minion \
+           file://salt-common.bash_completion \
+           file://salt-common.logrotate \
+           file://salt-api \
+           file://salt-master \
+           file://master \
+           file://salt-syndic \
+           file://cloud \
+           file://roster \
+"
+
+SRC_URI[md5sum] = "5091f15202c852a3e92692035b05c872"
+SRC_URI[sha256sum] = "e0d5b3ec220d8c956120bf2faa00bb7013e500eef7a697bc428cb179a136a5d2"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools update-rc.d
+
+PACKAGES += "\
+           ${PN}-api \
+           ${PN}-cloud \
+           ${PN}-common \
+           ${PN}-master \
+           ${PN}-minion \
+           ${PN}-ssh \
+           ${PN}-syndic \
+           ${PN}-bash-completion \
+"
+
+do_install_append() {
+        install -d ${D}${sysconfdir}/bash_completion.d/
+        install -m 0644 ${WORKDIR}/salt-common.bash_completion ${D}${sysconfdir}/bash_completion.d/${PN}-common
+        install -d ${D}${sysconfdir}/logrotate.d/
+        install -m 0644 ${WORKDIR}/salt-common.logrotate ${D}${sysconfdir}/logrotate.d/${PN}-common
+        install -d ${D}${sysconfdir}/init.d/
+        install -m 0755 ${WORKDIR}/salt-minion ${D}${sysconfdir}/init.d/${PN}-minion
+        install -m 0755 ${WORKDIR}/salt-api ${D}${sysconfdir}/init.d/${PN}-api
+        install -m 0755 ${WORKDIR}/salt-master ${D}${sysconfdir}/init.d/${PN}-master
+        install -m 0755 ${WORKDIR}/salt-syndic ${D}${sysconfdir}/init.d/${PN}-syndic
+        install -d ${D}${sysconfdir}/${PN}/
+        install -m 0644 ${WORKDIR}/minion ${D}${sysconfdir}/${PN}/minion
+        install -m 0644 ${WORKDIR}/master ${D}${sysconfdir}/${PN}/master
+        install -m 0644 ${WORKDIR}/cloud ${D}${sysconfdir}/${PN}/cloud
+        install -m 0644 ${WORKDIR}/roster ${D}${sysconfdir}/${PN}/roster
+        install -d ${D}${sysconfdir}/${PN}/cloud.conf.d ${D}${sysconfdir}/${PN}/cloud.profiles.d ${D}${sysconfdir}/${PN}/cloud.providers.d
+}
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN} = ""
+
+INITSCRIPT_PACKAGES = "${PN}-minion ${PN}-api ${PN}-master ${PN}-syndic"
+
+DESCRIPTION_COMMON = "salt is a powerful remote execution manager that can be used to administer servers in a\
+ fast and efficient way. It allows commands to be executed across large groups of servers. This means systems\
+ can be easily managed, but data can also be easily gathered. Quick introspection into running systems becomes\
+ a reality. Remote execution is usually used to set up a certain state on a remote system. Salt addresses this\
+ problem as well, the salt state system uses salt state files to define the state a server needs to be in. \
+Between the remote execution system, and state management Salt addresses the backbone of cloud and data center\
+ management."
+
+SUMMARY_${PN}-minion = "client package for salt, the distributed remote execution system"
+DESCRIPTION_${PN}-minion = "${DESCRIPTION_COMMON} This particular package provides the worker agent for salt."
+RDEPENDS_${PN}-minion = "python ${PN}-common (= ${EXTENDPKGV}) python-m2crypto python-pycrypto python-msgpack python-pyzmq (>= 13.1.0)"
+RRECOMMENDS_${PN}-minion_append_x64 = "dmidecode"
+RSUGGESTS_${PN}-minion = "python-augeas"
+CONFFILES_${PN}-minion = "${sysconfdir}/${PN}/minion ${sysconfdir}/init.d/${PN}-minion"
+FILES_${PN}-minion = "${bindir}/${PN}-minion ${sysconfdir}/${PN}/minion.d/ ${CONFFILES_${PN}-minion}"
+INITSCRIPT_NAME_${PN}-minion = "${PN}-minion"
+INITSCRIPT_PARAMS_${PN}-minion = "defaults"
+
+SUMMARY_${PN}-common = "shared libraries that salt requires for all packages"
+DESCRIPTION_${PN}-common ="${DESCRIPTION_COMMON} This particular package provides shared libraries that \
+salt-master, salt-minion, and salt-syndic require to function."
+RDEPENDS_${PN}-common = "python (>= 2.7) python (< 2.8) python-jinja2 python-pyyaml"
+RRECOMMENDS_${PN}-common = "lsb"
+RSUGGESTS_${PN}-common = "python-mako python-git"
+RCONFLICTS_${PN}-common = "python-mako (< 0.7.0)"
+CONFFILES_${PN}-common="${sysconfdir}/logrotate.d/${PN}-common"
+FILES_${PN}-common = "${bindir}/${PN}-call ${libdir}/python2.7/ ${CONFFILES_${PN}-common}"
+
+SUMMARY_${PN}-ssh = "remote manager to administer servers via salt"
+DESCRIPTION_${PN}-ssh = "${DESCRIPTION_COMMON} This particular package provides the salt ssh controller. It \
+is able to run salt modules and states on remote hosts via ssh. No minion or other salt specific software needs\
+ to be installed on the remote host."
+RDEPENDS_${PN}-ssh = "python ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
+CONFFILES_${PN}-ssh="${sysconfdir}/${PN}/roster"
+FILES_${PN}-ssh = "${bindir}/${PN}-ssh ${CONFFILES_${PN}-ssh}"
+
+SUMMARY_${PN}-api = "generic, modular network access system"
+DESCRIPTION_${PN}-api = "a modular interface on top of Salt that can provide a variety of entry points into a \
+running Salt system. It can start and manage multiple interfaces allowing a REST API to coexist with XMLRPC or \
+even a Websocket API. The Salt API system is used to expose the fundamental aspects of Salt control to external\
+ sources. salt-api acts as the bridge between Salt itself and REST, Websockets, etc. Documentation is available\
+ on Read the Docs: http://salt-api.readthedocs.org/"
+RDEPENDS_${PN}-api = "python ${PN}-master"
+RSUGGESTS_${PN}-api = "python-cherrypy"
+CONFFILES_${PN}-api = "${sysconfdir}/init.d/${PN}-api"
+FILES_${PN}-api = "${bindir}/${PN}-api ${CONFFILES_${PN}-api}"
+INITSCRIPT_NAME_${PN}-api = "${PN}-api"
+INITSCRIPT_PARAMS_${PN}-api = "defaults"
+
+SUMMARY_${PN}-master = "remote manager to administer servers via salt"
+DESCRIPTION_${PN}-master ="${DESCRIPTION_COMMON} This particular package provides the salt controller."
+RDEPENDS_${PN}-master = "python ${PN}-common (= ${EXTENDPKGV}) python-m2crypto python-pycrypto python-msgpack python-pyzmq (>= 13.1.0)"
+CONFFILES_${PN}-master="${sysconfdir}/init.d/${PN}-master  ${sysconfdir}/${PN}/master"
+FILES_${PN}-master = "${bindir}/${PN} ${bindir}/${PN}-cp ${bindir}/${PN}-key ${bindir}/${PN}-master ${bindir}/${PN}-run ${bindir}/${PN}-unity ${CONFFILES_${PN}-master}"
+INITSCRIPT_NAME_${PN}-master = "${PN}-master"
+INITSCRIPT_PARAMS_${PN}-master = "defaults"
+
+SUMMARY_${PN}-syndic = "master-of-masters for salt, the distributed remote execution system"
+DESCRIPTION_${PN}-syndic = "${DESCRIPTION_COMMON} This particular package provides the master of masters for \
+salt; it enables the management of multiple masters at a time."
+RDEPENDS_${PN}-syndic = "python ${PN}-master (= ${EXTENDPKGV})"
+CONFFILES_${PN}-syndic="${sysconfdir}/init.d/${PN}-syndic"
+FILES_${PN}-syndic = "${bindir}/${PN}-syndic ${CONFFILES_${PN}-syndic}"
+INITSCRIPT_NAME_${PN}-syndic = "${PN}-syndic"
+INITSCRIPT_PARAMS_${PN}-syndic = "defaults"
+
+SUMMARY_${PN}-cloud = "public cloud VM management system"
+DESCRIPTION_${PN}-cloud = "provision virtual machines on various public clouds via a cleanly controlled profile and mapping system."
+RDEPENDS_${PN}-cloud = "python ${PN}-common (= ${EXTENDPKGV}) python-msgpack python-requests"
+RSUGGESTS_${PN}-cloud = "python-netaddr python-botocore"
+CONFFILES_${PN}-cloud = "${sysconfdir}/${PN}/cloud"
+FILES_${PN}-cloud = "${bindir}/${PN}-cloud ${sysconfdir}/${PN}/cloud.conf.d/ ${sysconfdir}/${PN}/cloud.profiles.d/ ${sysconfdir}/${PN}/cloud.providers.d/ ${CONFFILES_${PN}-cloud}"
+
+FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/${PN}-common"
-- 
1.9.1


