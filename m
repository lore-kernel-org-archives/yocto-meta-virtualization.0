Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B71EE00C9F; Fri, 15 Feb 2019 07:01:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34C9AE00C71
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Feb 2019 07:01:47 -0800 (PST)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id B33485C263B;
	Fri, 15 Feb 2019 15:56:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1550242577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=j64fZI4BxhdJq1gRDREz//8UiKUk2KwGk97pMuNbvKM=;
	b=xAFCTple6FcavYxolR6Y/4GdTWZR6A9BaO0ev7fPEuyold/ryUZj7lc1MPWJatj/KKMCwX
	2m7G0XXTziNEpFxVstY9xi4/DSZfbl/BQkE+Al1/XIuI+aCvHt7j5rSuUA8XA0V1BY4ZpX
	AURDcOlIqPHKfRyUaRHx642FGBiMA5w=
From: Stefan Agner <stefan@agner.ch>
To: bruce.ashfield@gmail.com,
	meta-virtualization@yoctoproject.org
Date: Fri, 15 Feb 2019 15:56:13 +0100
Message-Id: <20190215145613.11794-2-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190215145613.11794-1-stefan@agner.ch>
References: <20190215145613.11794-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 2/2] runc: address CVE-2019-5736
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
X-List-Received-Date: Fri, 15 Feb 2019 15:01:48 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Use git hash which addresses CVE-2019-5736. Use the same git hash
used in top of 18.09 Docker branch.

Fixes: CVE-2019-5736
Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/runc/runc-docker_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 41c82f7..4eb2d07 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -4,7 +4,7 @@ RRECOMMENDS_${PN} = "lxc docker"
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV_runc-docker = "4a600c04ed480084b2351b3e32c26cb4a2d5d533"
+SRCREV_runc-docker = "6635b4f0c6af3810594d2770f662f34ddc15b40d"
 SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch \
-- 
2.13.6


