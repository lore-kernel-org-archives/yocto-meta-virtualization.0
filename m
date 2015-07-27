Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A32FE00530; Sun, 26 Jul 2015 19:31:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3FAFE0049B
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Jul 2015 19:31:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98910987"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jul 2015 10:34:48 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6R2TL8L020862
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Jul 2015 10:29:21 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 27 Jul 2015 10:31:11 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 Jul 2015 10:30:53 +0800
Message-ID: <1437964261-1851-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 0/8] upgrade recipes
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
X-List-Received-Date: Mon, 27 Jul 2015 02:31:23 -0000
Content-Type: text/plain

these recipes inherit ruby.
After ruby upgrade to 2.2.2, the recipes will occur an
Warning like this:
WARNING: QA Issue: mixlib-log: Files/directories were installed but not shipped in any package:
  /usr/lib/ruby/gems/2.2.0/build_info
  /usr/lib/ruby/gems/2.2.0/extensions
So,it is needed to apply the "[PATCH] ruby.bbclass: WARNING Fix" to avoid build Warnings.

Li xin (8):
  chef-zero: upgrade 2.0.2 -> 4.2.3
  hashie: upgrade 2.1.1 -> 3.4.2
  highline: upgrade 1.6.21 -> 1.7.3
  mime-types: upgrade 1.25.1 -> 2.5
  mixlib-config: upgrade 2.1.0 -> 2.2.1
  mixlib-shellout: upgrade 1.4.0 -> 2.1.0
  net-ssh-multi: upgrade 1.2.0 -> 1.2.1
  ohai: upgrade 7.0.4 -> 8.5.0

 meta-openstack/recipes-devtools/ruby/chef-zero_git.bb       |  6 ++----
 meta-openstack/recipes-devtools/ruby/hashie_git.bb          |  4 ++--
 meta-openstack/recipes-devtools/ruby/highline_git.bb        |  4 ++--
 meta-openstack/recipes-devtools/ruby/mime-types_git.bb      |  8 ++++----
 meta-openstack/recipes-devtools/ruby/mixlib-config_git.bb   |  4 ++--
 meta-openstack/recipes-devtools/ruby/mixlib-shellout_git.bb |  4 ++--
 ...gemspec-don-t-force-the-use-of-gem-private_key.pem.patch | 13 +++++++------
 meta-openstack/recipes-devtools/ruby/net-ssh-multi_git.bb   |  4 ++--
 meta-openstack/recipes-devtools/ruby/ohai_git.bb            |  6 +++---
 9 files changed, 26 insertions(+), 27 deletions(-)

-- 
1.8.4.2


