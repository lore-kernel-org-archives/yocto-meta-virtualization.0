Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7EFDFE00A73; Wed, 19 Aug 2015 19:56:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 530C7E009EF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Aug 2015 19:56:13 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7K2uDx8024531
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Aug 2015 19:56:13 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 19 Aug 2015 19:56:12 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 19 Aug 2015 22:56:08 -0400
Message-ID: <1440039372-3073-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 1/5] Fix the puppet run failure issue
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

From: Guojian Zhou <guojian.zhou@windriver.com>

The puppet's execution depends on the facter, so add the required
RDEPENDS in the bb file.

The puppet tool run failure information:
==============================================
root@# puppet help
/usr/lib64/ruby/rubygems/custom_require.rb:36:in `require': cannot load such file -- facter (LoadError)
from /usr/lib64/ruby/rubygems/custom_require.rb:36:in `require'
from /usr/lib64/ruby/gems/1.9.1/gems/puppet-3.7.3/lib/puppet.rb:6:in `<top (required)>'
from /usr/lib64/ruby/rubygems/custom_require.rb:36:in `require'
from /usr/lib64/ruby/rubygems/custom_require.rb:36:in `require'
from /usr/lib64/ruby/gems/1.9.1/gems/puppet-3.7.3/lib/puppet/util/command_line.rb:12:in `<top (required)>'
from /usr/lib64/ruby/rubygems/custom_require.rb:36:in `require'
from /usr/lib64/ruby/rubygems/custom_require.rb:36:in `require'
from /usr/lib64/ruby/gems/1.9.1/gems/puppet-3.7.3/bin/puppet:7:in `<top (required)>'
from /usr/bin/puppet:23:in `load'
from /usr/bin/puppet:23:in `<main>'

Signed-off-by: Guojian Zhou <guojian.zhou@windriver.com>
Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-support/puppet/puppet_3.7.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
index afd9a23..22376cf 100644
--- a/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
+++ b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
@@ -18,6 +18,12 @@ DEPENDS += " \
         hiera \
 "
 
+RDEPENDS_${PN} += " \
+        ruby \
+        facter \
+        hiera \
+"
+
 RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
 
 do_install_append() {
-- 
2.1.4


