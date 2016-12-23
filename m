Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A85F8E009DF; Fri, 23 Dec 2016 07:37:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79EB5E00828
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Dec 2016 07:37:12 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBNFbBdW000753
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Dec 2016 07:37:11 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 23 Dec 2016 07:37:10 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 23 Dec 2016 10:36:58 -0500
Message-ID: <1482507418-26713-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [mcs][PATCH] meta-openstack: layer.conf: update the preferred versions
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
X-List-Received-Date: Fri, 23 Dec 2016 15:37:15 -0000
Content-Type: text/plain

Many of the packages we have preferred versions for no longer have
recipes available for the defined versions, or the preferred version
was incorrect. Set the preferred versions to something that actually
exists. Since meta-openstack is currently not buildable there is no
way to test these changes, other than 'it builds' and 'no more
warnings about mismatched preferred versions' but there is more work
being done currently which will eventually be merged and allow us to
revisit these to ensure they are correctly set.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 1406e4e..19e3cb1 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -11,10 +11,10 @@ BBFILE_PRIORITY_openstack-layer = "5"
 BB_DANGLINGAPPENDS_WARNONLY ?= "true"
 
 # pre 0.4.0 greenlet versions segfault python
-PREFERRED_VERSION_python-greenlet = "0.4.1"
-PREFERRED_VERSION_python-sqlalchemy = "0.9.7"
+PREFERRED_VERSION_python-greenlet = "0.4.5"
+PREFERRED_VERSION_python-sqlalchemy = "1.0.8"
 PREFERRED_VERSION_python-pexpect = "3.3"
-PREFERRED_VERSION_python-futures = "3.0.3"
+PREFERRED_VERSION_python-futures = "3.0.3%"
 PREFERRED_VERSION_python-django = "1.8.6"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.7.4


