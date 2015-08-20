Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74914E00A75; Wed, 19 Aug 2015 19:56:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB5C6E00A71
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Aug 2015 19:56:16 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7K2uGt1024540
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Aug 2015 19:56:16 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 19 Aug 2015 19:56:16 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 19 Aug 2015 22:56:12 -0400
Message-ID: <1440039372-3073-5-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440039372-3073-1-git-send-email-mark.asselstine@windriver.com>
References: <1440039372-3073-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 5/5] puppet: fixup QA warning
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
X-List-Received-Date: Thu, 20 Aug 2015 02:56:21 -0000
Content-Type: text/plain

Currently we get the following warning when building puppet:

WARNING: QA Issue: /usr/lib/ruby/gems/2.2.0/gems/puppet-3.7.3/
lib/puppet/vendor/safe@underscore@yaml/run@underscore@specs@
underscore@all@underscore@ruby@underscore@versions.sh_puppet
contained in package puppet requires /bin/bash, but no
providers found in its RDEPENDS [file-rdeps]

Adding 'bash' as an RDEPENDS fixes this.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-support/puppet/puppet_3.7.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-support/puppet/puppet_3.7.3.bb b/recipes-support/puppet/puppet_3.7.3.bb
index c1743e6..14e18d9 100644
--- a/recipes-support/puppet/puppet_3.7.3.bb
+++ b/recipes-support/puppet/puppet_3.7.3.bb
@@ -24,6 +24,7 @@ RDEPENDS_${PN} += " \
         facter \
         hiera \
         ruby-shadow \
+        bash \
 "
 
 RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
-- 
2.1.4


