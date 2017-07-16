Return-Path: <jan.kiszka@web.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DACFE00C25; Sun, 16 Jul 2017 07:57:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jan.kiszka[at]web.de)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [217.72.192.78 listed in list.dnswl.org]
X-Greylist: delayed 568 seconds by postgrey-1.32 at yocto-www;
	Sun, 16 Jul 2017 07:57:52 PDT
Received: from mout.web.de (mout.web.de [217.72.192.78])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DF61E00C2B
	for <meta-virtualization@yoctoproject.org>;
	Sun, 16 Jul 2017 07:57:52 -0700 (PDT)
Received: from md1f2u6c.ww002.siemens.net ([95.157.57.47]) by smtp.web.de
	(mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
	0M6mTI-1dttz13atA-00wVJv for <meta-virtualization@yoctoproject.org>;
	Sun, 16 Jul 2017 16:57:51 +0200
Resent-From: Jan Kiszka <jan.kiszka@web.de>
Resent-To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Resent-Date: Sun, 16 Jul 2017 16:57:51 +0200
Resent-Message-ID: <d465589c-8940-4e1d-45a6-f4c578b27918@web.de>
Resent-User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1
	Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <3f9e4f77-e3bb-cbc8-51bb-a007bf7919fa@web.de>
Date: Sun, 16 Jul 2017 16:48:25 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
X-Provags-ID: V03:K0:crwNpXArzV65FEwa06kWbIkWkczzmzGgBkMwndlrDjVBAD0SaaJ
	7txL6cIu7OB+wlYVM1L0G9OHMOd7vSQnpdtCSRvkddcm3ElU114NY7NY1CcLBFaPrpFoVdo
	AlOD+rcsQgpgAPjbuyh+9U99w4EXZ3bop1tO7yLQ6RJqfw85rRsZ1xP//HvRRBFv5qP9jNu
	vaXpO/61zGbEy6vpOpzIw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:P3SlkUJeHnE=:fwcBJWtZe5PjbCtcAQgoPz
	wVbyrhGa0fAtgHe1NVniBZCwen83UwXvlscMBsw1u7UzNdgtYhSLG0/+8ilw5/kZsgp8WMqvO
	6ZaHL9nNpU1CYEPKWSlMN5pq18JOs32UKD1qaZQTRJf4JVGikNB5ccW1/yOa7gchqrJnpSWEW
	rSiHyzvPgN4SLB/my52q9Wxfu8eCryfSo1nc/e6YrR5RoR6pfHKdQbg/zXT0yUmKC42BX331l
	mX72UoiDwHKmv48P87TeoXEUI1s0RFFk708NVllqZyYS6V8iwxhnji9AtX17FPAhx6bjfky5m
	XkEBnNkD42FLSzu0yjUwtjd4czWx6VOZSGRV+Lyxr7DJ3yeULF1uApeBOvG4mMjitYG5PjJRR
	vmdQ52Cn7LZkHaG+7Km4HzDJqHE0G/0z3bUitWn6N10JshaQAeKU9TcYXBV1w7Yo1ayfcXLiq
	NZGNPyNAYNOo4HtxV8mr5Px3r6amJjkqyafN2G+nz46k8nzrr/odb1D3y/hk7sJ/zxG6F9r5T
	jX6wXrsRCCp5ffr+m/r8q9SEI9hJ8d4tM8FhoqCuMyT2jn6uvkYQRe9eBmi65Yb2T/5XgvzjY
	4NjgRnyr8UKMN4hdGnRZYuHi1NzUC9TmPTQIPTdN64kvWb88D9BMXYdUoBAIPAWZStbADsD/i
	hlUTsN+2pOwqiKbaT4O4Ambeh2HlTmygft9g0nDLkEo4hvzDuGgnD7Am3t8Q3mSkRZ/Xp/bLb
	x9inyKtAWC9+K5Cafj8exPJWxue97H+Ak1lKnrvvGW/EW8Y2dWhjlHd1Vckp7LAw0aWL9YvUQ
	J3c1ciYXR4oVoRXj9vZ++3cdaLpH3iCJw4deWW5uukdPc5id08=
Subject: [PATCH] lxc: Fix INITSCRIPT_PARAMS value
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
X-List-Received-Date: Sun, 16 Jul 2017 14:57:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

From: Jan Kiszka <jan.kiszka@siemens.com>

Analogously to docker: There is no variable
OS_DEFAULT_INITSCRIPT_PARAMS, just use "defaults".

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-containers/lxc/lxc_2.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index f4d1102..8b5d77f 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -79,7 +79,7 @@ SYSTEMD_AUTO_ENABLE_${PN}-setup = "disable"
 
 INITSCRIPT_PACKAGES = "${PN}-setup"
 INITSCRIPT_NAME_{PN}-setup = "lxc"
-INITSCRIPT_PARAMS_${PN}-setup = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
+INITSCRIPT_PARAMS_${PN}-setup = "defaults"
 
 FILES_${PN}-doc = "${mandir} ${infodir}"
 # For LXC the docdir only contains example configuration files and should be included in the lxc package
-- 
2.12.3

