Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0600E00D77; Wed,  9 Sep 2015 09:02:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 56FB8E00ABE
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Sep 2015 09:02:26 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Wed, 9 Sep 2015
	18:02:24 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 9 Sep 2015 18:02:24 +0200
Message-ID: <1441814544-7657-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [fido-kilo][PATCH] python-memcache: add missing dependency
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
X-List-Received-Date: Wed, 09 Sep 2015 16:02:30 -0000
Content-Type: text/plain

python-memcache requires python-nose, this fixes this build error:

|   File ".../x86_64-linux/usr/lib/python2.7/site-packages/distribute-0.6.32-py2.7.egg/setuptools/command/easy_install.py", line 592, in easy_install
|     raise DistutilsError(msg)
| distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('nose>=1.0')
| ERROR: python setup.py build_ext execution failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at .../python-memcache/1.2.5-r0/temp/log.do_compile.24701)

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb b/meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb
index 6597e86..3e6f3f6 100644
--- a/meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-memcache_1.2.5.bb
@@ -20,8 +20,10 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-nose \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-nose \
         "
-- 
1.9.1


