Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8AC22E00BEF; Tue,  8 Dec 2015 09:34:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id BE9C5E00B94
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:10 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:09 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:20 +0100
Message-ID: <1449596034-8308-9-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 08/42] python-nova: add missing rdepends
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:25 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add the missing rdepends on python-oslo.log, python-psutil
and python-amqp or it fails with:

  File "/usr/lib64/python2.7/site-packages/nova/cmd/compute.py", line 23, in <module>
    from oslo_log import log as logging
  ImportError: No module named oslo_log

  File "/usr/lib64/python2.7/site-packages/nova/openstack/common/report/generators/process.py", line 23, in <module>
    import psutil
  ImportError: No module named psutil

  File "/usr/lib64/python2.7/site-packages/stevedore/driver.py", line 50, in _default_on_load_failure
    raise err
  ImportError: No module named amqp

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-nova_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index 8bfcbea..4af1ded 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -277,6 +277,7 @@ RDEPENDS_${PN} = " libvirt \
 		   python-keystonemiddleware \
 		   python-modules \
 		   python-misc \
+		   python-amqp \
 		   python-amqplib \
 		   python-anyjson \
 		   python-babel \
@@ -300,9 +301,11 @@ RDEPENDS_${PN} = " libvirt \
 		   python-oslo.concurrency \
 		   python-oslo.middleware \
 		   python-oslo.context \
+		   python-oslo.log \
 		   python-paste \
 		   python-pastedeploy \
 		   python-paramiko \
+		   python-psutil \
 		   python-pyasn1 \
 		   python-setuptools-git \
 		   python-simplejson \
-- 
2.5.0


