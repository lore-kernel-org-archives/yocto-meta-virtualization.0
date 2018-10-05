Return-Path: <okaya@kernel.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 798E6E00A0C; Fri,  5 Oct 2018 09:33:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.145.29.99 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7EAA3E0053F
	for <meta-virtualization@yoctoproject.org>;
	Fri,  5 Oct 2018 09:33:21 -0700 (PDT)
Received: from [192.168.0.106] (cpe-174-109-247-98.nc.res.rr.com
	[174.109.247.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3C124206B2
	for <meta-virtualization@yoctoproject.org>;
	Fri,  5 Oct 2018 16:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1538757201;
	bh=p3zBAdzp3Z0HZyK7jAZiuZ/OoaKcA3MCLNsKERHuhow=;
	h=Subject:References:To:From:Date:In-Reply-To:From;
	b=xL9edAEMcajB8qFJW4VLxCpCVwCP42XmnTE0j8bs2+NHQY9gWYbUeckV0lxUAP0Fb
	DPUTI7wcwJAfWYDtLfi8qyEkLy3qq25PmOLSdpFhyYDN9gHxOT3BrPAYoBiKHRRLbc
	yi4TaHOZbLefUYkok5O9eDInqebmFrb0vlo8aanU=
References: <fe502ba2-ec63-285a-9e43-1a72d8e9365d@kernel.org>
To: meta-virtualization@yoctoproject.org
From: Sinan Kaya <okaya@kernel.org>
X-Forwarded-Message-Id: <fe502ba2-ec63-285a-9e43-1a72d8e9365d@kernel.org>
Message-ID: <f5dde7bb-cce9-1dfd-8c71-7a1b5fb4ed59@kernel.org>
Date: Fri, 5 Oct 2018 12:33:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <fe502ba2-ec63-285a-9e43-1a72d8e9365d@kernel.org>
Subject: [sumo] [PATCH v1] docker: CVE-2018-10892
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
X-List-Received-Date: Fri, 05 Oct 2018 16:33:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

* CVE-2018-10892
Docker does not block /proc/acpi pathnames. The flaw allows an attacker to
modify host's hardware like enabling/disabling Bluetooth or turning up/down
keyboard brightness.

Affects < 18.03.01

CVE: CVE-2018-10892
Ref: https://access.redhat.com/security/cve/cve-2018-10892
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
  recipes-containers/docker/docker_git.bb       |  2 ++
  .../docker/files/CVE-2018-10892.patch         | 34 +++++++++++++++++++
  2 files changed, 36 insertions(+)
  create mode 100644 recipes-containers/docker/files/CVE-2018-10892.patch

diff --git a/recipes-containers/docker/docker_git.bb 
b/recipes-containers/docker/docker_git.bb
index e055a4f..7c7bd4c 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -30,6 +30,8 @@ SRC_URI = "\
          file://0001-libnetwork-use-GO-instead-of-go.patch \
  	"

+SRC_URI_append_docker += "CVE-2018-10892.patch"
+
  # Apache-2.0 for docker
  LICENSE = "Apache-2.0"
  LIC_FILES_CHKSUM = 
"file://src/import/LICENSE;md5=9740d093a080530b5c5c6573df9af45a"
diff --git a/recipes-containers/docker/files/CVE-2018-10892.patch 
b/recipes-containers/docker/files/CVE-2018-10892.patch
new file mode 100644
index 0000000..60d0496
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2018-10892.patch
@@ -0,0 +1,34 @@
+From af52f266ea15e6000ed057b13d62d27ddd5441a0 Mon Sep 17 00:00:00 2001
+From: Antonio Murdaca <runcom@redhat.com>
+Date: Thu, 5 Jul 2018 17:06:08 +0200
+Subject: [PATCH] Add /proc/acpi to masked paths
+
+The deafult OCI linux spec in oci/defaults{_linux}.go in Docker/Moby
+from 1.11 to current upstream master does not block /proc/acpi pathnames
+allowing attackers to modify host's hardware like enabling/disabling
+bluetooth or turning up/down keyboard brightness. SELinux prevents all
+of this if enabled.
+
+Signed-off-by: Antonio Murdaca <runcom@redhat.com>
+CVE: CVE-2018-10892
+Upstream-Status: Backport 
[https://github.com/moby/moby/pull/37404/commits/569b9702a59804617e1cd3611fbbe953e4247b3e]
+Signed-off-by: Sinan Kaya<okaya@kernel.org>
+---
+ oci/defaults.go | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/oci/defaults.go b/oci/defaults.go
+index 4145412dd..992157b0f 100644
+--- a/oci/defaults.go
++++ b/oci/defaults.go
+@@ -114,6 +114,7 @@ func DefaultLinuxSpec() specs.Spec {
+
+ 	s.Linux = &specs.Linux{
+ 		MaskedPaths: []string{
++			"/proc/acpi",
+ 			"/proc/kcore",
+ 			"/proc/keys",
+ 			"/proc/latency_stats",
+--
+2.19.0
+
-- 
2.19.0


