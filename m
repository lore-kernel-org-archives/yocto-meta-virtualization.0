Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 604D2E00D72; Tue, 31 May 2016 00:08:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BCA1E00D2F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 May 2016 00:08:36 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4V78W2X019037
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 May 2016 00:08:32 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 31 May 2016 00:08:31 -0700
From: <jackie.huang@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 31 May 2016 03:08:30 -0400
Message-ID: <1464678510-29698-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [meta-cloud-services][PATCH] spice: add PACKAGECONFIG for xinerama
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
X-List-Received-Date: Tue, 31 May 2016 07:08:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

spice auto detect Xinerama library to enable the feature,
but it causes error when using sstate between different
builds, e.g. previous build have xinerama but the later
one doesn't, then it fails on the later one with:

"Package 'xinerama', required by 'spice-server', not found"

Add PACKAGECONFIG for xinerama to ensure we have
deterministic builds.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-support/spice/spice_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/spice_git.bb
index 95f7156..0524c27 100644
--- a/recipes-support/spice/spice_git.bb
+++ b/recipes-support/spice/spice_git.bb
@@ -53,6 +53,7 @@ PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,"
 PACKAGECONFIG[client] = "--enable-client,--disable-client,,"
 PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,,"
 PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,,"
+PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
 
 PACKAGES =+ "${PN}-protocol"
 LICENSE_${PN}-protocol = "BSD"
-- 
2.8.1


