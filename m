Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FCFFE00BA2; Tue, 18 Sep 2018 13:29:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33D87E00B45
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 13:28:21 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8IKSKVv001130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 13:28:20 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 18 Sep 2018 13:28:20 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Sep 2018 16:27:30 -0400
Message-ID: <1537302451-32569-6-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537302451-32569-1-git-send-email-mark.asselstine@windriver.com>
References: <1537302451-32569-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 5/6] consul-migrate: use SRC_URIs not DEPENDS
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
X-List-Received-Date: Tue, 18 Sep 2018 20:29:07 -0000
Content-Type: text/plain

It is common to have two GO packages, A and B, and they both depend on
a GO dependency, C. This can be satisfied using the current technique
of writing recipes for each dependency.

BUT it is also common for GO packages to not only specify other
packages in their GoDeps but also specific dependency versions. In the
case that A and B share a dependency on C, but require different
versions, there is no easy way to accomplish this using recipes.

Since GO dependencies are also source dependencies and these
dependencies are overwhelmingly useless on their own, writing recipes
for each is overkill.

We therefor replace DEPENDS with SRC_URIs and SRCREVs as a mechanism
to provide build dependencies.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-connectivity/consul/consul-migrate_git.bb | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/recipes-connectivity/consul/consul-migrate_git.bb b/recipes-connectivity/consul/consul-migrate_git.bb
index 4cc53b2..935d663 100644
--- a/recipes-connectivity/consul/consul-migrate_git.bb
+++ b/recipes-connectivity/consul/consul-migrate_git.bb
@@ -3,12 +3,28 @@ HOMEPAGE = "https://github.com/hashicorp/consul-migrate"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b278a92d2c1509760384428817710378"
 
-DEPENDS += "raft raft-boltdb raft-mdb"
-
 PKG_NAME = "github.com/hashicorp/consul-migrate"
 SRC_URI = "git://${PKG_NAME}.git"
 SRCREV = "678fb10cdeae25ab309e99e655148f0bf65f9710"
 
+SRCREV_raft = "057b893fd996696719e98b6c44649ea14968c811"
+SRCREV_go-metrics = "f303b03b91d770a11a39677f1d3b55da4002bbcb"
+SRCREV_raft-boltdb = "d1e82c1ec3f15ee991f7cc7ffd5b67ff6f5bbaee"
+SRCREV_raft-mdb = "4ec3694ffbc74d34f7532e70ef2e9c3546a0c0b0"
+SRCREV_gomdb = "151f2e08ef45cb0e57d694b2562f351955dff572"
+SRCREV_bolt = "c6ba97b89e0454fec9aa92e1d33a4e2c5fc1f631"
+SRCREV_go-msgpack = "fa3f63826f7c23912c15263591e65d54d080b458"
+
+SRC_URI += " \
+   git://github.com/hashicorp/raft;name=raft;destsuffix=git/src/github.com/hashicorp/raft \
+   git://github.com/armon/go-metrics;name=go-metrics;destsuffix=git/src/github.com/armon/go-metrics \
+   git://github.com/hashicorp/raft-boltdb;name=raft-boltdb;destsuffix=git/src/github.com/hashicorp/raft-boltdb \
+   git://github.com/hashicorp/raft-mdb;name=raft-mdb;destsuffix=git/src/github.com/hashicorp/raft-mdb \
+   git://github.com/armon/gomdb;name=gomdb;destsuffix=git/src/github.com/armon/gomdb \
+   git://github.com/boltdb/bolt;name=bolt;destsuffix=git/src/github.com/boltdb/bolt \
+   git://github.com/hashicorp/go-msgpack;name=go-msgpack;destsuffix=git/src/github.com/hashicorp/go-msgpack \
+"
+
 inherit golang
 
 SYSROOT_PREPROCESS_FUNCS += "consul_migrate_sysroot_preprocess"
-- 
2.7.4


