Return-Path: <Liezhi.Yang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 278EFE00F45; Mon, 26 Feb 2018 23:02:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B16AE00D91
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Feb 2018 23:02:35 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1R72ZSY028104
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Feb 2018 23:02:35 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 26 Feb 2018 23:02:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 26 Feb 2018 23:02:34 -0800
Message-ID: <20180227070234.6533-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <CADkTA4OXm3Ji7qM7=Ra7J1qH14zArfUU5kyAUDe5FzfwaMSRJA@mail.gmail.com>
References: <CADkTA4OXm3Ji7qM7=Ra7J1qH14zArfUU5kyAUDe5FzfwaMSRJA@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2] python-pyparsing: fix SRC_URI's checksum
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
X-List-Received-Date: Tue, 27 Feb 2018 07:02:37 -0000
Content-Type: text/plain

The checksum was changed because the source was changed from .zip to .tar.gz,
see 3d512115129e2cea97067d23cb72fea62b70dd39 for more details.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 recipes-devtools/python/python-pyparsing_2.0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/python/python-pyparsing_2.0.1.bb b/recipes-devtools/python/python-pyparsing_2.0.1.bb
index 2ef6df9..c19f137 100644
--- a/recipes-devtools/python/python-pyparsing_2.0.1.bb
+++ b/recipes-devtools/python/python-pyparsing_2.0.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
 
-SRC_URI[md5sum] = "dc7036a6f1ab01c3baed3d97af8d77c0"
-SRC_URI[sha256sum] = "7e1766ee747cca79fe172b670fd53ef58fc55d2b1804fd6c66d857abb62d143a"
+SRC_URI[md5sum] = "37adec94104b98591507218bc82e7c31"
+SRC_URI[sha256sum] = "0007cd3f008eba4a203f1f6b4b133ddc352552c8808b694c88c23db56416e4e4"
 
 inherit distutils pypi
-- 
2.10.2


