Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F20BDE00A73; Wed, 19 Aug 2015 19:56:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 543D4E00A5B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Aug 2015 19:56:15 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7K2uFuv026626
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Aug 2015 19:56:15 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 19 Aug 2015 19:56:15 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 19 Aug 2015 22:56:11 -0400
Message-ID: <1440039372-3073-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440039372-3073-1-git-send-email-mark.asselstine@windriver.com>
References: <1440039372-3073-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 4/5] puppet: move to base layer
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
X-List-Received-Date: Thu, 20 Aug 2015 02:56:20 -0000
Content-Type: text/plain

Puppet can be used by many 'cloud services', it is not openstack
specific, so moving puppet and puppet related recipes to the
meta-cloud-services base layer. This allows either internal sub-layers
found in meta-cloud-services or external layers to include
meta-cloud-services without being burdened by bbappends and configs
found in meta-openstack.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../facter/facter/add_facter_gemspec.patch                                | 0
 .../recipes-support => recipes-support}/facter/facter_2.3.0.bb            | 0
 .../hiera/hiera/add_hiera_gemspec.patch                                   | 0
 {meta-openstack/recipes-support => recipes-support}/hiera/hiera_1.3.4.bb  | 0
 {meta-openstack/recipes-support => recipes-support}/puppet/README         | 0
 .../puppet/puppet/add_puppet_gemspec.patch                                | 0
 .../recipes-support => recipes-support}/puppet/puppet/puppet.conf         | 0
 .../recipes-support => recipes-support}/puppet/puppet_3.7.3.bb            | 0
 .../recipes-support => recipes-support}/ruby-shadow/ruby-shadow_git.bb    | 0
 9 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-openstack/recipes-support => recipes-support}/facter/facter/add_facter_gemspec.patch (100%)
 rename {meta-openstack/recipes-support => recipes-support}/facter/facter_2.3.0.bb (100%)
 rename {meta-openstack/recipes-support => recipes-support}/hiera/hiera/add_hiera_gemspec.patch (100%)
 rename {meta-openstack/recipes-support => recipes-support}/hiera/hiera_1.3.4.bb (100%)
 rename {meta-openstack/recipes-support => recipes-support}/puppet/README (100%)
 rename {meta-openstack/recipes-support => recipes-support}/puppet/puppet/add_puppet_gemspec.patch (100%)
 rename {meta-openstack/recipes-support => recipes-support}/puppet/puppet/puppet.conf (100%)
 rename {meta-openstack/recipes-support => recipes-support}/puppet/puppet_3.7.3.bb (100%)
 rename {meta-openstack/recipes-support => recipes-support}/ruby-shadow/ruby-shadow_git.bb (100%)

diff --git a/meta-openstack/recipes-support/facter/facter/add_facter_gemspec.patch b/recipes-support/facter/facter/add_facter_gemspec.patch
similarity index 100%
rename from meta-openstack/recipes-support/facter/facter/add_facter_gemspec.patch
rename to recipes-support/facter/facter/add_facter_gemspec.patch
diff --git a/meta-openstack/recipes-support/facter/facter_2.3.0.bb b/recipes-support/facter/facter_2.3.0.bb
similarity index 100%
rename from meta-openstack/recipes-support/facter/facter_2.3.0.bb
rename to recipes-support/facter/facter_2.3.0.bb
diff --git a/meta-openstack/recipes-support/hiera/hiera/add_hiera_gemspec.patch b/recipes-support/hiera/hiera/add_hiera_gemspec.patch
similarity index 100%
rename from meta-openstack/recipes-support/hiera/hiera/add_hiera_gemspec.patch
rename to recipes-support/hiera/hiera/add_hiera_gemspec.patch
diff --git a/meta-openstack/recipes-support/hiera/hiera_1.3.4.bb b/recipes-support/hiera/hiera_1.3.4.bb
similarity index 100%
rename from meta-openstack/recipes-support/hiera/hiera_1.3.4.bb
rename to recipes-support/hiera/hiera_1.3.4.bb
diff --git a/meta-openstack/recipes-support/puppet/README b/recipes-support/puppet/README
similarity index 100%
rename from meta-openstack/recipes-support/puppet/README
rename to recipes-support/puppet/README
diff --git a/meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch b/recipes-support/puppet/puppet/add_puppet_gemspec.patch
similarity index 100%
rename from meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch
rename to recipes-support/puppet/puppet/add_puppet_gemspec.patch
diff --git a/meta-openstack/recipes-support/puppet/puppet/puppet.conf b/recipes-support/puppet/puppet/puppet.conf
similarity index 100%
rename from meta-openstack/recipes-support/puppet/puppet/puppet.conf
rename to recipes-support/puppet/puppet/puppet.conf
diff --git a/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb b/recipes-support/puppet/puppet_3.7.3.bb
similarity index 100%
rename from meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
rename to recipes-support/puppet/puppet_3.7.3.bb
diff --git a/meta-openstack/recipes-support/ruby-shadow/ruby-shadow_git.bb b/recipes-support/ruby-shadow/ruby-shadow_git.bb
similarity index 100%
rename from meta-openstack/recipes-support/ruby-shadow/ruby-shadow_git.bb
rename to recipes-support/ruby-shadow/ruby-shadow_git.bb
-- 
2.1.4


