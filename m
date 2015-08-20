Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FD11E00A71; Wed, 19 Aug 2015 19:56:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55665E00A6C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Aug 2015 19:56:14 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7K2uE2V026623
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Aug 2015 19:56:14 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 19 Aug 2015 19:56:13 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 19 Aug 2015 22:56:09 -0400
Message-ID: <1440039372-3073-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440039372-3073-1-git-send-email-mark.asselstine@windriver.com>
References: <1440039372-3073-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 2/5] Add the puppet.conf for the puppet agent
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

The puppet agent requires the /etc/puppet/puppet.conf.

Signed-off-by: Guojian Zhou <guojian.zhou@windriver.com>
Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-support/puppet/puppet/puppet.conf | 9 +++++++++
 meta-openstack/recipes-support/puppet/puppet_3.7.3.bb    | 2 ++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-openstack/recipes-support/puppet/puppet/puppet.conf

diff --git a/meta-openstack/recipes-support/puppet/puppet/puppet.conf b/meta-openstack/recipes-support/puppet/puppet/puppet.conf
new file mode 100644
index 0000000..efe143c
--- /dev/null
+++ b/meta-openstack/recipes-support/puppet/puppet/puppet.conf
@@ -0,0 +1,9 @@
+[main]
+logdir=/var/log/puppet
+vardir=/var/lib/puppet
+ssldir=/var/lib/puppet/ssl
+rundir=/var/run/puppet
+factpath=$vardir/lib/facter
+
+[agent]
+server=puppet-server
diff --git a/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
index 22376cf..f201a7b 100644
--- a/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
+++ b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f257790c70561550fd666c6e0044fd89"
 SRC_URI = " \
     https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
     file://add_puppet_gemspec.patch \
+    file://puppet.conf \
 "
 SRC_URI[md5sum] = "cc294da1d51df07bcc7f6cf78bd90ce0"
 SRC_URI[sha256sum] = "4a3bd7ddb51072c3dd898a8de158cde204a2d8fd0b84e8ac806b84c074348637"
@@ -34,4 +35,5 @@ do_install_append() {
     install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/
     install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/puppet/
     install -m 655 ${S}/conf/tagmail.conf ${D}${sysconfdir}/puppet/
+    install -m 655 ${WORKDIR}/puppet.conf ${D}${sysconfdir}/puppet/
 }
-- 
2.1.4


