Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83DCBE00902; Wed, 22 Jul 2015 19:52:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 132FBE008D4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jul 2015 19:52:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98752064"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2015 10:56:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6N2oih3029755
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 Jul 2015 10:50:44 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 23 Jul 2015 10:52:32 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 23 Jul 2015 10:52:25 +0800
Message-ID: <1437619945-3926-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH] ruby.bbclass: WARNING Fix
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
X-List-Received-Date: Thu, 23 Jul 2015 02:52:45 -0000
Content-Type: text/plain

When build the recipes which inherit ruby,WARNING will occur as following:
WARNING: QA Issue: mixlib-log: Files/directories were installed but not shipped in any package:
  /usr/lib/ruby/gems/2.2.0/build_info
  /usr/lib/ruby/gems/2.2.0/extensions
Please set FILES such that these items are packaged. Alternatively if they are unneeded,
avoid installing them or delete them within do_install. [installed-vs-shipped]
So modify ruby.bbclass

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/classes/ruby.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-openstack/classes/ruby.bbclass b/meta-openstack/classes/ruby.bbclass
index 947613e..957abf7 100644
--- a/meta-openstack/classes/ruby.bbclass
+++ b/meta-openstack/classes/ruby.bbclass
@@ -121,6 +121,8 @@ FILES_${PN} += " \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/cache \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/specifications \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/build_info \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions \
         "
 
 FILES_${PN}-doc += " \
-- 
1.8.4.2


