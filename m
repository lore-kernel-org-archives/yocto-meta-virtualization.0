Return-Path: <psaavedra@igalia.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 523FBE01E4C; Thu, 21 Jun 2018 01:27:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [91.117.99.155 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 348 seconds by postgrey-1.32 at yocto-www;
	Thu, 21 Jun 2018 01:27:05 PDT
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D22F5E01E4A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Jun 2018 01:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=yOvQEpxMSeIfnJbIvIK1jAacnCpL3GW0T6LrKgDL6Jg=; 
	b=r3fd88z6iVF5mZN/hkBI19SNPNtX9bnCcEtp9P/nZGVsYESthBheMZ4zVOZPb9rMRGvxuxC6IO6Yut/lecWna7h98apTJosZp290rsk/WpGIR4fjIr+JqYCcIAQtnsHBokh5c2mS727wQKuiPpOObxqCIRPS1sCWoHwyLQ/9ccXcULkWB1xkDues1hVWeZtDHBBU4Scn/LcipCHr/7qbDiPI8e+Oe7SS+XMv2QA4/109b+We44F9Q4+4Hy+RonE+RAb2TuLlOaT45QEh3nFgiYFUCFm9+LkWPh0igppRoOSpbwTb73EIbrERB4xXUREap5G3iv4Sxd2ZCrTSn1XSDw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1fVuvo-0004TQ-KY
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Jun 2018 10:27:04 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 21 Jun 2018 10:26:59 +0200
Message-Id: <20180621082659.55476-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [m-c-s][PATCH] Ruby-shadow upgrade to 2.5.0
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
X-List-Received-Date: Thu, 21 Jun 2018 08:27:07 -0000

Ruby was upgraded to 2.5.0 in sumo. A upgrade in the ruby-shadow is
needed to build

Upstream changes:

* Updates code source reference
* Fixes for rubinius and tests
* Add friendlier method names
* Start to add some smoke tests
* Provide info on implementation

Finally, this version of the package is alrady added in Debian Buster
as well.
---
 recipes-support/ruby-shadow/ruby-shadow_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-support/ruby-shadow/ruby-shadow_git.bb b/recipes-support/ruby-shadow/ruby-shadow_git.bb
index 75588f3..e7db6d1 100644
--- a/recipes-support/ruby-shadow/ruby-shadow_git.bb
+++ b/recipes-support/ruby-shadow/ruby-shadow_git.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "https://github.com/apalmblad/ruby-shadow"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=137882914e5269b7268f0fe8e28a3f89"
 
-PV = "2.4.1"
+PV = "2.5.0"
 
 SRC_URI = "git://github.com/apalmblad/ruby-shadow.git"
-SRCREV = "4231a4838fd50022b112838f114ee0586e119605"
+SRCREV = "d2e822d8a8bda61f0774debbfce363a7347ed893"
 S = "${WORKDIR}/git"
 
 inherit ruby
-- 
2.11.0


