Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D22EE007B2; Wed,  9 Dec 2015 04:40:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 49E44E007B2
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Dec 2015 04:40:21 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.224.2;
	Wed, 9 Dec 2015 13:40:19 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 9 Dec 2015 13:40:19 +0100
Message-ID: <1449664819-2613-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-43-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-43-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH v2] Use a bbclass to remove argparse from requirements
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
X-List-Received-Date: Wed, 09 Dec 2015 12:40:27 -0000
Content-Type: text/plain

argparse is required by some of the CLI applications of openstack. The
module is provided by python 2.7, however python-distribute (used in
fido), is not able to find it:

Python 2.7.9 (default, Oct 27 2015, 18:12:55)
[GCC 4.9.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import pkg_resources
>>> pkg_resources.get_distribution('argparse')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File
"/usr/lib/python2.7/site-packages/distribute-0.6.49-py2.7.egg/pkg_resources.py",
line 338, in get_distribution
    if isinstance(dist,Requirement): dist = get_provider(dist)
  File
"/usr/lib/python2.7/site-packages/distribute-0.6.49-py2.7.egg/pkg_resources.py",
line 217, in get_provider
    return working_set.find(moduleOrReq) or require(str(moduleOrReq))[0]
  File
"/usr/lib/python2.7/site-packages/distribute-0.6.49-py2.7.egg/pkg_resources.py",
line 698, in require
    needed = self.resolve(parse_requirements(requirements))
  File
"/usr/lib/python2.7/site-packages/distribute-0.6.49-py2.7.egg/pkg_resources.py",
line 596, in resolve
    raise DistributionNotFound(req)
pkg_resources.DistributionNotFound: argparse
>>> import argparse
>>>

This patch adds a class that when inherited will remove argparse from
requirements.txt. Also with this patch, those python modules used by
openstackclient inherit the class.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/classes/rmargparse.bbclass                           | 3 +++
 meta-openstack/recipes-devtools/python/python-cinderclient_git.bb   | 2 +-
 meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb       | 2 +-
 meta-openstack/recipes-devtools/python/python-glanceclient_git.bb   | 2 +-
 meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb | 2 +-
 meta-openstack/recipes-devtools/python/python-neutronclient_git.bb  | 2 +-
 meta-openstack/recipes-devtools/python/python-novaclient_git.bb     | 2 +-
 meta-openstack/recipes-devtools/python/python-oslo.config_1.9.3.bb  | 2 +-
 meta-openstack/recipes-devtools/python/python-stevedore_1.3.0.bb    | 2 +-
 9 files changed, 11 insertions(+), 8 deletions(-)
 create mode 100644 meta-openstack/classes/rmargparse.bbclass

diff --git a/meta-openstack/classes/rmargparse.bbclass b/meta-openstack/classes/rmargparse.bbclass
new file mode 100644
index 0000000..65d8459
--- /dev/null
+++ b/meta-openstack/classes/rmargparse.bbclass
@@ -0,0 +1,3 @@
+do_install_append() {
+    sed -i '/argparse/d' ${D}${libdir}/python2.7/site-packages/*/requires.txt
+}
diff --git a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
index 951198d..1590ed4 100644
--- a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
@@ -17,7 +17,7 @@ PV="1.1.2+git${SRCPV}"
 SRCREV="b44d32d02b014748044b5b18d27a9d1f8312145c"
 S = "${WORKDIR}/git"
 
-inherit setuptools monitor
+inherit setuptools monitor rmargparse
 
 DEPENDS += " \
         python-pip \
diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
index e7e1f7e..4a9dc9f 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "209882e199fdf98aeed0db44b922aa688e5a66d81c45148a5743804f9a
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit setuptools
+inherit setuptools rmargparse
 
 DEPENDS += " \
 	python-pbr \
diff --git a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
index 430e32d..2ced1e9 100644
--- a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "\
 
 S = "${WORKDIR}/git"
 
-inherit setuptools monitor
+inherit setuptools monitor rmargparse
 
 FILES_${PN} += "${datadir}/${SRCNAME}"
 
diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
index 5c5d98c..b538cbf 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
@@ -16,7 +16,7 @@ PV = "1.3.3+git${SRCPV}"
 SRCREV = "ec70eb02f8a5889828cde786694283240f64c5c4"
 S = "${WORKDIR}/git"
 
-inherit setuptools monitor
+inherit setuptools monitor rmargparse
 
 FILES_${PN}-doc += "${datadir}/keystoneclient" 
 
diff --git a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
index e35be5d..16a2e92 100644
--- a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
@@ -29,7 +29,7 @@ PV = "2.4.0+git${SRCPV}"
 SRCREV = "aa1215a5ad063b299d32ef319eb63d5210249a9b"
 S = "${WORKDIR}/git"
 
-inherit setuptools monitor
+inherit setuptools monitor rmargparse
 
 PACKAGECONFIG ?= "bash-completion"
 PACKAGECONFIG[bash-completion] = ",,bash-completion,bash-completion ${BPN}-bash-completion"
diff --git a/meta-openstack/recipes-devtools/python/python-novaclient_git.bb b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
index 1e60fb4..dd0151a 100644
--- a/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
@@ -13,7 +13,7 @@ PV = "2.23.2+git${SRCPV}"
 SRCREV = "4ab9db648653f7ea6b9f8b1c78bff672b20b913f"
 S = "${WORKDIR}/git"
 
-inherit setuptools monitor
+inherit setuptools monitor rmargparse
 
 DEPENDS = "python-setuptools-git"
 DEPENDS += " \
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_1.9.3.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_1.9.3.bb
index 3094b1e..ec1340d 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.config_1.9.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.config_1.9.3.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "ab54e67776d9bbee86ba8cce9393ba3186e6e63de926e9797598dc35fe
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit setuptools
+inherit setuptools rmargparse
 
 DEPENDS += " \
         python-pbr \
diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.3.0.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.3.0.bb
index 6100f68..73b054a 100644
--- a/meta-openstack/recipes-devtools/python/python-stevedore_1.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.3.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI[md5sum] = "e9ed2a1cf91ee76fd9045f902fa58089"
 SRC_URI[sha256sum] = "beab2b7f91966d259796392c39ed6f260b32851861561dd9f3b9be2fd0c426a5"
 
-inherit pypi
+inherit pypi rmargparse
 
 DEPENDS += " \
         python-pip \
-- 
2.5.0


