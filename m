Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4B90E00A38; Fri,  7 Aug 2015 02:40:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B166E009FD
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Aug 2015 02:40:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99385944"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2015 17:43:33 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t779cBKK004499
	for <meta-virtualization@yoctoproject.org>;
	Fri, 7 Aug 2015 17:38:11 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 7 Aug 2015 17:40:06 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 7 Aug 2015 17:39:56 +0800
Message-ID: <1438940396-2186-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-cloud-services][PATCH] ruby.bbclass: Error fix
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
X-List-Received-Date: Fri, 07 Aug 2015 09:40:11 -0000
Content-Type: text/plain

When build the recipes which inherit ruby,ERROR will occur as following:
ERROR: QA Issue: non debug package contains .debug directory: json
path /work/core2-64-oe-linux/json/1.8.3-r0/packages-split/json/usr/lib/ruby/
gems/2.2.0/extensions/x86_64-linux/2.2.0/json-1.8.3/json/ext/.debug/generator.so [debug-files]
So modify ruby.bbclass.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/classes/ruby.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openstack/classes/ruby.bbclass b/meta-openstack/classes/ruby.bbclass
index 957abf7..0c842d5 100644
--- a/meta-openstack/classes/ruby.bbclass
+++ b/meta-openstack/classes/ruby.bbclass
@@ -114,6 +114,7 @@ FILES_${PN}-dbg += " \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/.debug \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/.debug \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/*/.debug \
         "
 
 FILES_${PN} += " \
-- 
1.8.4.2


