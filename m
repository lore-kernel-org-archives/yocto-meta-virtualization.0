Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD4D7E009B8; Mon, 18 May 2015 23:54:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67545E00998
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 May 2015 23:54:23 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4J6sNaB018316
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 May 2015 23:54:23 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 18 May 2015 23:54:22 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 19 May 2015 14:54:23 +0800
Message-ID: <1432018463-21203-2-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1432018463-21203-1-git-send-email-jackie.huang@windriver.com>
References: <1432018463-21203-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python-nova: add missing rdepends
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
X-List-Received-Date: Tue, 19 May 2015 06:54:26 -0000
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
---
 meta-openstack/recipes-devtools/python/python-nova_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index 4e96341..423b0c3 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -274,6 +274,7 @@ RDEPENDS_${PN} = " libvirt \
 		   python-keystonemiddleware \
 		   python-modules \
 		   python-misc \
+		   python-amqp \
 		   python-amqplib \
 		   python-anyjson \
 		   python-babel \
@@ -297,9 +298,11 @@ RDEPENDS_${PN} = " libvirt \
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
1.9.1


