Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33777E00C14; Wed,  9 Sep 2015 08:52:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id A61C3E00ABE
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Sep 2015 08:52:09 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Wed, 9 Sep 2015
	17:52:07 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 9 Sep 2015 17:52:07 +0200
Message-ID: <1441813927-40182-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [fido-kilo][PATCH] python-cliff: account for dependency on python-pbr
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
X-List-Received-Date: Wed, 09 Sep 2015 15:52:12 -0000
Content-Type: text/plain

This fixes this build error:
|   File ".../x86_64-linux/usr/lib/python2.7/site-packages/distribute-0.6.32-py2.7.egg/setuptools/command/easy_install.py", line 592, in easy_install
|     raise DistutilsError(msg)
| distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('pbr')
| ERROR: python setup.py build_ext execution failed.
| WARNING: exit code 1 from a shell command.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
index 7a6bb83..e107a28 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
@@ -16,8 +16,14 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
+DEPENDS += " \
+	python-pbr \
+	"
+
 RDEPENDS_${PN} += "python-prettytable \
             python-cmd2 \
-            python-pyparsing"
+            python-pyparsing \
+            python-pbr \
+            "
 
 CLEANBROKEN = "1"
-- 
1.9.1


