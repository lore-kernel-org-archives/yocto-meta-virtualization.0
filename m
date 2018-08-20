Return-Path: <prvs=7770f27c63=adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E3BAE00A86; Mon, 20 Aug 2018 09:20:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [148.163.156.75 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1311 seconds by postgrey-1.32 at yocto-www;
	Mon, 20 Aug 2018 09:20:28 PDT
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E05BE003D7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 09:20:28 -0700 (PDT)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7KFthf2030386 for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 10:58:38 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2kxfg0ebru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 10:58:37 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w7KFwaIH003186
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 10:58:36 -0500
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 20 Aug 2018 10:58:36 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 20 Aug 2018 10:58:36 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 20 Aug 2018 10:58:35 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 20 Aug 2018 19:00:23 +0300
Message-ID: <20180820160023.5432-2-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820160023.5432-1-adrian.ratiu@ni.com>
References: <20180820160023.5432-1-adrian.ratiu@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-20_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Cc: Sergey Kizunov <sergey.kizunov@ni.com>
Subject: [meta-cloud-services][PATCH 2/2] salt: bump 2016.11 -> 2018.3
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
X-List-Received-Date: Mon, 20 Aug 2018 16:20:29 -0000
Content-Type: text/plain

From: Sergey Kizunov <sergey.kizunov@ni.com>

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../{salt_2016.11.0.bb => salt_2018.3.0.bb}   | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)
 rename meta-openstack/recipes-support/salt/{salt_2016.11.0.bb => salt_2018.3.0.bb} (89%)

diff --git a/meta-openstack/recipes-support/salt/salt_2016.11.0.bb b/meta-openstack/recipes-support/salt/salt_2018.3.0.bb
similarity index 89%
rename from meta-openstack/recipes-support/salt/salt_2016.11.0.bb
rename to meta-openstack/recipes-support/salt/salt_2018.3.0.bb
index ba1def7..a4022be 100644
--- a/meta-openstack/recipes-support/salt/salt_2016.11.0.bb
+++ b/meta-openstack/recipes-support/salt/salt_2018.3.0.bb
@@ -13,8 +13,7 @@ PACKAGECONFIG ??= "zeromq"
 PACKAGECONFIG[zeromq] = ",,python-pyzmq python-pycrypto,"
 PACKAGECONFIG[tcp] = ",,python-pycrypto"
 
-SRCNAME = "salt"
-SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+SRC_URI = "https://files.pythonhosted.org/packages/source/s/${PN}/${PN}-${PV}.tar.gz \
            file://set_python_location_hashbang.patch \
            file://minion \
            file://salt-minion \
@@ -28,10 +27,10 @@ SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME
            file://roster \
 "
 
-SRC_URI[md5sum] = "eced07a652cc6a31870fc098d5325a9c"
-SRC_URI[sha256sum] = "b516285926ee95cedc64ecddab05d14422b7c8819c9f6d046a431c41d608e6bc"
+SRC_URI[md5sum] = "b6ec271b59554b9af7ff4005028434b5"
+SRC_URI[sha256sum] = "a0a45d22fdf6961542a419b7e09568a3118e2b019ffe7bab9dee5aeb55b56b31"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/${PN}-${PV}"
 
 inherit setuptools update-rc.d
 
@@ -89,7 +88,7 @@ Between the remote execution system, and state management Salt addresses the bac
 
 SUMMARY_${PN}-minion = "client package for salt, the distributed remote execution system"
 DESCRIPTION_${PN}-minion = "${DESCRIPTION_COMMON} This particular package provides the worker agent for salt."
-RDEPENDS_${PN}-minion = "python (>=2.6), ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
+RDEPENDS_${PN}-minion = "${PN}-common (= ${EXTENDPKGV}) python-msgpack"
 RDEPENDS_${PN}-minion += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python-pycrypto python-pyzmq (>= 13.1.0)', '',d)}"
 RDEPENDS_${PN}-minion += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python-pycrypto', '',d)}"
 RRECOMMENDS_${PN}-minion_append_x64 = "dmidecode"
@@ -102,7 +101,7 @@ INITSCRIPT_PARAMS_${PN}-minion = "defaults"
 SUMMARY_${PN}-common = "shared libraries that salt requires for all packages"
 DESCRIPTION_${PN}-common ="${DESCRIPTION_COMMON} This particular package provides shared libraries that \
 salt-master, salt-minion, and salt-syndic require to function."
-RDEPENDS_${PN}-common = "python (>= 2.7.5-5) python (< 2.8) python-dateutil python-jinja2 python-pyyaml python-requests (>= 1.0.0) python-tornado (>= 4.2.1)"
+RDEPENDS_${PN}-common = "python-dateutil python-jinja2 python-pyyaml python-requests (>= 1.0.0) python-tornado (>= 4.2.1)"
 RRECOMMENDS_${PN}-common = "lsb python-futures"
 RSUGGESTS_${PN}-common = "python-mako python-git"
 RCONFLICTS_${PN}-common = "python-mako (< 0.7.0)"
@@ -113,7 +112,7 @@ SUMMARY_${PN}-ssh = "remote manager to administer servers via salt"
 DESCRIPTION_${PN}-ssh = "${DESCRIPTION_COMMON} This particular package provides the salt ssh controller. It \
 is able to run salt modules and states on remote hosts via ssh. No minion or other salt specific software needs\
  to be installed on the remote host."
-RDEPENDS_${PN}-ssh = "python (>= 2.6) ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
+RDEPENDS_${PN}-ssh = "${PN}-common (= ${EXTENDPKGV}) python-msgpack"
 CONFFILES_${PN}-ssh="${sysconfdir}/${PN}/roster"
 FILES_${PN}-ssh = "${bindir}/${PN}-ssh ${CONFFILES_${PN}-ssh}"
 
@@ -123,7 +122,7 @@ running Salt system. It can start and manage multiple interfaces allowing a REST
 even a Websocket API. The Salt API system is used to expose the fundamental aspects of Salt control to external\
  sources. salt-api acts as the bridge between Salt itself and REST, Websockets, etc. Documentation is available\
  on Read the Docs: http://salt-api.readthedocs.org/"
-RDEPENDS_${PN}-api = "python (>= 2.6) ${PN}-master"
+RDEPENDS_${PN}-api = "${PN}-master"
 RSUGGESTS_${PN}-api = "python-cherrypy"
 CONFFILES_${PN}-api = "${sysconfdir}/init.d/${PN}-api"
 FILES_${PN}-api = "${bindir}/${PN}-api ${CONFFILES_${PN}-api}"
@@ -132,7 +131,7 @@ INITSCRIPT_PARAMS_${PN}-api = "defaults"
 
 SUMMARY_${PN}-master = "remote manager to administer servers via salt"
 DESCRIPTION_${PN}-master ="${DESCRIPTION_COMMON} This particular package provides the salt controller."
-RDEPENDS_${PN}-master = "python (>= 2.6) ${PN}-common (= ${EXTENDPKGV}) python-msgpack"
+RDEPENDS_${PN}-master = "${PN}-common (= ${EXTENDPKGV}) python-msgpack"
 RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python-pycrypto python-pyzmq (>= 13.1.0)', '',d)}"
 RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python-pycrypto', '',d)}"
 CONFFILES_${PN}-master="${sysconfdir}/init.d/${PN}-master  ${sysconfdir}/${PN}/master"
@@ -144,7 +143,7 @@ INITSCRIPT_PARAMS_${PN}-master = "defaults"
 SUMMARY_${PN}-syndic = "master-of-masters for salt, the distributed remote execution system"
 DESCRIPTION_${PN}-syndic = "${DESCRIPTION_COMMON} This particular package provides the master of masters for \
 salt; it enables the management of multiple masters at a time."
-RDEPENDS_${PN}-syndic = "python (>= 2.6) ${PN}-master (= ${EXTENDPKGV})"
+RDEPENDS_${PN}-syndic = "${PN}-master (= ${EXTENDPKGV})"
 CONFFILES_${PN}-syndic="${sysconfdir}/init.d/${PN}-syndic"
 FILES_${PN}-syndic = "${bindir}/${PN}-syndic ${CONFFILES_${PN}-syndic}"
 INITSCRIPT_NAME_${PN}-syndic = "${PN}-syndic"
@@ -152,14 +151,14 @@ INITSCRIPT_PARAMS_${PN}-syndic = "defaults"
 
 SUMMARY_${PN}-cloud = "public cloud VM management system"
 DESCRIPTION_${PN}-cloud = "provision virtual machines on various public clouds via a cleanly controlled profile and mapping system."
-RDEPENDS_${PN}-cloud = "python (>= 2.6) ${PN}-common (= ${EXTENDPKGV})"
+RDEPENDS_${PN}-cloud = "${PN}-common (= ${EXTENDPKGV})"
 RSUGGESTS_${PN}-cloud = "python-netaddr python-botocore"
 CONFFILES_${PN}-cloud = "${sysconfdir}/${PN}/cloud"
 FILES_${PN}-cloud = "${bindir}/${PN}-cloud ${sysconfdir}/${PN}/cloud.conf.d/ ${sysconfdir}/${PN}/cloud.profiles.d/ ${sysconfdir}/${PN}/cloud.providers.d/ ${CONFFILES_${PN}-cloud}"
 
 SUMMARY_${PN}-tests = "salt stack test suite"
 DESCRIPTION_${PN}-tests ="${DESCRIPTION_COMMON} This particular package provides the salt unit test suite."
-RDEPENDS_${PN}-tests = "${PN}-common python-salttesting python-tests python-image bash"
+RDEPENDS_${PN}-tests = "${PN}-common python-pytest-salt python-tests python-image bash"
 FILES_${PN}-tests = "${PYTHON_SITEPACKAGES_DIR}/salt-tests/tests/"
 
 FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/${PN}-common"
-- 
2.18.0


