Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6AC18E00A3B; Sun, 26 Jul 2015 19:31:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCE46E00984
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Jul 2015 19:31:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98911003"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jul 2015 10:35:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6R2Te6n020890
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Jul 2015 10:29:40 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 27 Jul 2015 10:31:30 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 Jul 2015 10:31:00 +0800
Message-ID: <1437964261-1851-8-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1437964261-1851-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1437964261-1851-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 7/8] net-ssh-multi: upgrade 1.2.0 -> 1.2.1
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
X-List-Received-Date: Mon, 27 Jul 2015 02:31:50 -0000
Content-Type: text/plain

update gemspec-don-t-force-the-use-of-gem-private_key.pem.patch,
since net-ssh-multi.gemspec content has been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 ...gemspec-don-t-force-the-use-of-gem-private_key.pem.patch | 13 +++++++------
 meta-openstack/recipes-devtools/ruby/net-ssh-multi_git.bb   |  4 ++--
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta-openstack/recipes-devtools/ruby/net-ssh-multi/gemspec-don-t-force-the-use-of-gem-private_key.pem.patch b/meta-openstack/recipes-devtools/ruby/net-ssh-multi/gemspec-don-t-force-the-use-of-gem-private_key.pem.patch
index db78b05..ece0465 100644
--- a/meta-openstack/recipes-devtools/ruby/net-ssh-multi/gemspec-don-t-force-the-use-of-gem-private_key.pem.patch
+++ b/meta-openstack/recipes-devtools/ruby/net-ssh-multi/gemspec-don-t-force-the-use-of-gem-private_key.pem.patch
@@ -1,6 +1,6 @@
-From 2c32d889b64510e1547fa85407beb65c2c3ee89a Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Wed, 14 May 2014 09:21:45 -0400
+From f9bade1e428b924de09228acbd6545ffb3c9c04c Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Mon, 20 Jul 2015 22:24:10 +0900
 Subject: [PATCH] gemspec: don't force the use of gem-private_key.pem
 
 This will have security implications but it doesn't affect
@@ -8,18 +8,19 @@ core functionality and allows the build to complete when
 this certificate is not available.
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
  net-ssh-multi.gemspec | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/net-ssh-multi.gemspec b/net-ssh-multi.gemspec
-index 2232ad1..f595779 100644
+index 5b3bbe7..f499739 100644
 --- a/net-ssh-multi.gemspec
 +++ b/net-ssh-multi.gemspec
 @@ -48,7 +48,9 @@ Gem::Specification.new do |s|
    s.require_paths = ["lib"]
    s.rubyforge_project = "net-ssh-multi"
-   s.rubygems_version = "1.8.25"
+   s.rubygems_version = "1.8.23"
 -  s.signing_key = "/mnt/gem/gem-private_key.pem"
 +  if File.exists?("/mnt/gem/gem-private_key.pem")
 +    s.signing_key = "/mnt/gem/gem-private_key.pem"
@@ -28,5 +29,5 @@ index 2232ad1..f595779 100644
  
    if s.respond_to? :specification_version then
 -- 
-1.8.3.2
+1.8.4.2
 
diff --git a/meta-openstack/recipes-devtools/ruby/net-ssh-multi_git.bb b/meta-openstack/recipes-devtools/ruby/net-ssh-multi_git.bb
index 86f2807..7da0566 100644
--- a/meta-openstack/recipes-devtools/ruby/net-ssh-multi_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/net-ssh-multi_git.bb
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c99c0cc0901fbc3607fe997f9898d69"
 
 PR = "r0"
 
-BPV = "1.2.0"
+BPV = "1.2.1"
 PV = "${BPV}"
-SRCREV = "b659f2884b2c9abdbe3bbf3c844937a0799ed5ac"
+SRCREV = "5b668d5ef34102c9ac159a8f21c889fdc7f99f1b"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.4.2


