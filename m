Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B337E00A31; Thu, 13 Aug 2015 13:51:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01677E00767
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 13:51:49 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7DKpldR023837
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 13:51:48 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.86)
	(envelope-from <amy.fong@windriver.com>) id 1ZPzTN-0000Rv-FO
	for meta-virtualization@yoctoproject.org;
	Thu, 13 Aug 2015 16:51:37 -0400
Date: Thu, 13 Aug 2015 16:51:37 -0400
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Message-ID: <20150813205137.GA1707@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] docker-registry dependency update
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
X-List-Received-Date: Thu, 13 Aug 2015 20:51:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From f0c34c20d253412d8e43e58cb4141c5028101bde Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Thu, 13 Aug 2015 16:47:23 -0400
Subject: [PATCH] docker-registry dependency update

With the recent python-simplejson:upgrade 3.6.2->3.7.3, docker-registry
was broken due to unsatisfied dependencies. The docker-registry builds and
passes basic testing with 3.7.3 (verified by jason.wessel@windriver.com),
updating the dependency requirement to >= 3.6.2

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-containers/docker-registry/docker-registry_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker-registry/docker-registry_git.bb b/recipes-containers/docker-registry/docker-registry_git.bb
index fe766d2..3d8d74b 100644
--- a/recipes-containers/docker-registry/docker-registry_git.bb
+++ b/recipes-containers/docker-registry/docker-registry_git.bb
@@ -42,7 +42,7 @@ RDEPENDS_${PN} += "\
   python-itsdangerous (>= 0.21) \
   python-jinja2 (>= 2.4) \
   python-werkzeug (>= 0.7) \
-  python-simplejson (= 3.6.2) \
+  python-simplejson (>= 3.6.2) \
   python-redis (= 2.10.3) \
   python-boto (= 2.34.0) \
   python-webob \
-- 
2.4.6


