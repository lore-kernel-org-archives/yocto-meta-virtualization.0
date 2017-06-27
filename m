Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8B51E009C2; Tue, 27 Jun 2017 01:23:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 866ABE00524
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 01:23:10 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5R8N97U016796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 01:23:10 -0700
Received: from pek-zhe-d1.corp.ad.wrs.com (128.224.162.196) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 27 Jun 2017 01:23:09 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 27 Jun 2017 16:23:00 +0800
Message-ID: <1498551781-10414-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] python-greenlet: uprev to 0.4.9
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
X-List-Received-Date: Tue, 27 Jun 2017 08:23:14 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

python-greenlet bugfixes from 0.3.4 - unstable issues. This resulted in
the docker-registry (in some build scenarios) crashing repeatedly.

    Traceback (most recent call last):
      File "/usr/lib64/python2.7/site-packages/gunicorn/arbiter.py", line 507, in spawn_worker
        worker.init_process()
      File "/usr/lib64/python2.7/site-packages/gunicorn/workers/ggevent.py", line 193, in init_process
        super(GeventWorker, self).init_process()
      File "/usr/lib64/python2.7/site-packages/gunicorn/workers/base.py", line 120, in init_process
        self.run()
      File "/usr/lib64/python2.7/site-packages/gunicorn/workers/ggevent.py", line 117, in run
        gevent.sleep(1.0)
      File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 75, in sleep
        hub.wait(loop.timer(seconds, ref=ref))
      File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 341, in wait
        result = waiter.get()
      File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 568, in get
        return self.hub.switch()
      File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 331, in switch
        return greenlet.switch(self)
    SystemError: NULL result without error in PyObject_Call

    <repeat>

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-devtools/python/python-greenlet_0.4.9.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-devtools/python/python-greenlet_0.4.9.bb

diff --git a/recipes-devtools/python/python-greenlet_0.4.9.bb b/recipes-devtools/python/python-greenlet_0.4.9.bb
new file mode 100644
index 0000000..fa35fa8
--- /dev/null
+++ b/recipes-devtools/python/python-greenlet_0.4.9.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Python lightweight in-process concurrent programming"
+HOMEPAGE = "http://pypi.python.org/pypi/greenlet"
+SECTION = "devel/python"
+LICENSE = "MIT & PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
+                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
+SRC_URI = "http://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.tar.gz"
+SRC_URI[md5sum] = "00bb1822d8511cc85f052e89d1fd919b"
+SRC_URI[sha256sum] = "79f9b8bbbb1c599c66aed5e643e8b53bae697cae46e0acfc4ee461df48a90012"
+
+S = "${WORKDIR}/greenlet-${PV}"
+
+inherit distutils
+
-- 
2.8.1


