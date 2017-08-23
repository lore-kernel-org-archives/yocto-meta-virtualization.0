Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23B65E00CA6; Wed, 23 Aug 2017 12:20:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF0F5E00B8D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 12:20:45 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7NJKi0J027192
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 12:20:44 -0700
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 12:20:44 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 23 Aug 2017 15:20:39 -0400
Message-ID: <1503516039-18494-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] erlang-native: Add DEPENDS for ncurses-native
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
X-List-Received-Date: Wed, 23 Aug 2017 19:20:47 -0000
Content-Type: text/plain

This was most likely being provided by another pkg pulling in
ncurses-native before erlang-native was being built. With RSS this is
no longer the case and we need to add the explicit DEPENDS. Without
this we are seeing erlang-native fail to configure:

| checking for tgetent in -lncurses... no
| checking for tgetent in -lcurses... no
| checking for tgetent in -ltermcap... no
| checking for tgetent in -ltermlib... no
| configure: error: No curses library functions found

While we are at it we drop the setting of PR as this will be handled
by the PR server.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb b/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb
index ca6a48f..61fc027 100644
--- a/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb
+++ b/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb
@@ -2,7 +2,7 @@ include erlang.inc
 
 inherit native
 
-PR = "r0"
+DEPENDS += "ncurses-native"
 
 EXTRA_OECONF = '--without-ssl'
 
-- 
2.7.4


