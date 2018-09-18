Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4DACE00BC4; Tue, 18 Sep 2018 13:29:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 860D1E00B47
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 13:28:29 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8IKS9wP017431
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 13:28:19 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 18 Sep 2018 13:27:58 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Sep 2018 16:27:28 -0400
Message-ID: <1537302451-32569-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537302451-32569-1-git-send-email-mark.asselstine@windriver.com>
References: <1537302451-32569-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 3/6] consul: remove unneeded DEPENDS
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

GO package dependencies are a tricky beast. They are source
dependencies and if you have two packages which share a dependency
they could very well require different versions of the dependency. So
supplying the dependencies via bitbake recipes is not an easy
proposition. As such we are better off populating the build source
with the dependencies using SRC_URIs and not traditional DEPENDS.

That being said, the consul source repository actually includes copies
of the dependencies (and the dependency's dependencies) so having
these DEPENDS is actually useless and we can simply drop them.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-connectivity/consul/consul_git.bb | 34 -------------------------------
 1 file changed, 34 deletions(-)

diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
index bcfb5aa..5f86597 100644
--- a/recipes-connectivity/consul/consul_git.bb
+++ b/recipes-connectivity/consul/consul_git.bb
@@ -3,40 +3,6 @@ HOMEPAGE = "https://www.consul.io/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b278a92d2c1509760384428817710378"
 
-DEPENDS += "circbuf \
-    consul-migrate \
-    go-checkpoint \
-    go-msgpack \
-    go-metrics \
-    go-bindata \
-    go-sys \
-    go-syslog \
-    dockerclient \
-    logutils \
-    memberlist \
-    raft \
-    raft-boltdb \
-    scada-client \
-    serf-go \
-    yamux \
-    muxado \
-    dns \
-    cli \
-    mapstructure \
-    copystructure \
-    reflectwalk \
-    columnize \
-    go-radix \
-    golang-lru \
-    hashicorp-hil \
-    hashicorp-hcl \
-    hashicorp-go-cleanhttp \
-    hashicorp-go-memdb \
-    hashicorp-go-reap \
-    hashicorp-go-uuid \
-    net-rpc-msgpackrpc \
-    "
-
 PKG_NAME = "github.com/hashicorp/consul"
 SRC_URI = "git://${PKG_NAME}.git \
            file://consul.service \
-- 
2.7.4


