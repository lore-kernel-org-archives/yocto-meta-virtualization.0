Return-Path: <jan.kiszka@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46A62E009F4; Fri, 10 Feb 2017 04:25:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.17.2 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 064A9E009E2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 04:25:44 -0800 (PST)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v1ACPgYY004725
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 13:25:42 +0100
Received: from md1f2u6c.ww002.siemens.net ([139.25.35.33])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v1ACPgai002198
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 13:25:42 +0100
Resent-From: Jan Kiszka <jan.kiszka@siemens.com>
Resent-To: meta-virtualization@yoctoproject.org
Resent-Date: Fri, 10 Feb 2017 13:25:41 +0100
Resent-Message-ID: <4243e6cc-2328-8138-49b3-816b10cbbbdb@siemens.com>
Resent-User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1
	Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
To: <meta-virtualization@yoctoproject.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <91a2ecd5-1f2d-25c4-ee68-972b8920d67c@siemens.com>
Date: Fri, 10 Feb 2017 13:14:41 +0100
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Subject: [PATCH] containerd: Fix build on 386
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
X-List-Received-Date: Fri, 10 Feb 2017 12:25:46 -0000
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

Go only understands "386" as target arch, not "i586". Adjust this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Found while building meta-virtualization for an Intel Quark target.

 recipes-containers/containerd/containerd_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index c257355..5b94dde 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -35,6 +35,9 @@ do_compile() {
 	if [ "${TARGET_ARCH}" = "aarch64" ]; then
 		export GOARCH="arm64"
 	fi
+	if [ "${TARGET_ARCH}" = "i586" ]; then
+		export GOARCH="386"
+	fi
 
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
 	# docker to download its dependencies but rather


