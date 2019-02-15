Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB6ACE00C43; Fri, 15 Feb 2019 08:32:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEF68E009EB
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Feb 2019 08:32:55 -0800 (PST)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 58EE25C029B;
	Fri, 15 Feb 2019 17:32:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1550248374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=2LfkMO6e277YZs4oTcx2duG73mhUizAwvmdwotEW8+k=;
	b=Y5+UKipuxVZa+r7Beh2AvSdEBqcLYuvRppmv7WwGPl5rzrYvztICNIwtFCEpaX0R4mhObv
	sJJKLdVVaBMs5p2w21phym9XkF6xRPW5qOrtXKQxAO9Z79WN8f6K2QJzeqOIdiQRJY5p1h
	4ThvLoWCHqbOdby5Z37iD1wXADx+ddk=
From: Stefan Agner <stefan@agner.ch>
To: bruce.ashfield@gmail.com,
	meta-virtualization@yoctoproject.org
Date: Fri, 15 Feb 2019 17:32:38 +0100
Message-Id: <20190215163238.28369-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH v2] runc: address CVE-2019-5736
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
X-List-Received-Date: Fri, 15 Feb 2019 16:32:56 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Use git hash which addresses CVE-2019-5736. Use the same git hash
used in top of Docker 18.09 branch.

Changes in runc since
  6635b4f0 merge branch 'cve-2019-5736'
  0a8e4117 nsenter: clone /proc/self/exe to avoid exposing host binary to container
  dd023c45 merge branch 'pr-1972'

Fixes: CVE-2019-5736
Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/runc/runc-docker_git.bb         | 2 +-
 recipes-containers/runc/runc-opencontainers_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 27c5f23..5f65940 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,6 +1,6 @@
 include runc.inc
 
-SRCREV = "4a600c04ed480084b2351b3e32c26cb4a2d5d533"
+SRCREV = "6635b4f0c6af3810594d2770f662f34ddc15b40d"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=master \
     "
-- 
2.13.6


