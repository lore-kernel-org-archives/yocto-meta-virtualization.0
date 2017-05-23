Return-Path: <Adrian.Dudau@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4583BE00B81; Tue, 23 May 2017 05:15:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [185.38.180.32 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 65 seconds by postgrey-1.32 at yocto-www;
	Tue, 23 May 2017 05:15:02 PDT
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.32])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27D99E00B05
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 May 2017 05:15:02 -0700 (PDT)
Received: from 1dD8hH-0003aZ-Ug by out10a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1dD8hH-0003aq-VL
	for meta-virtualization@yoctoproject.org;
	Tue, 23 May 2017 05:13:55 -0700
Received: by emcmailer; Tue, 23 May 2017 05:13:55 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10a.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <Adrian.Dudau@enea.com>)
	id 1dD8hH-0003aZ-Ug for meta-virtualization@yoctoproject.org;
	Tue, 23 May 2017 05:13:55 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Tue, 23 May 2017 14:13:55 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id 3B2FD4404F5;
	Tue, 23 May 2017 14:13:55 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 23 May 2017 14:13:55 +0200
Message-ID: <1495541635-40607-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [meta-cloud-services][PATCH] python: Inherit setuptools instead of distutils for several packages
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
X-List-Received-Date: Tue, 23 May 2017 12:15:25 -0000
Content-Type: text/plain

python-appdirs
python-keystoneauth
python-lesscpy
python-os-client-config

The setup scripts of these modules use setuptools instead of distutils,
resulting in errors like this:

|   File "setup.py", line 5, in <module>
|     from setuptools import setup
| ImportError: No module named setuptools

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 meta-openstack/recipes-devtools/python/python-appdirs_git.bb          | 2 +-
 meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb | 2 +-
 meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb       | 2 +-
 meta-openstack/recipes-devtools/python/python-os-client-config_git.bb | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-appdirs_git.bb b/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
index 8e40f26..2482871 100644
--- a/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ActiveState/${SRCNAME}.git"
 
 S = "${WORKDIR}/git"
 
-inherit distutils
+inherit setuptools
 
 DEPENDS += " \
         python-pip \
diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb
index 1fdf9e1..83582c5 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "075a9ca7a8877c5885fa2487699015e45260c4e6be119683effe0ad2ab
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit distutils
+inherit setuptools
 
 DEPENDS += " \
         python-pbr \
diff --git a/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb b/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
index 61ae935..71e0dc0 100644
--- a/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "ccad1ad2a89ced1875c5ca4e16e5478b791d31fb187fe29f1541859318
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit distutils
+inherit setuptools
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
diff --git a/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb b/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
index 7b55dbb..5393bb7 100644
--- a/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
 
 S = "${WORKDIR}/git"
 
-inherit distutils
+inherit setuptools
 
 DEPENDS += " \
         python-pbr \
-- 
2.7.4


