Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A1F0E01480
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:48 -0800 (PST)
Received: by mail-ee0-f53.google.com with SMTP id e53so3348701eek.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=0UH6iw0iTdzfEF/pMZvqY+la7OA76g0KgUopam+pgZA=;
	b=lJ1zQIgBkNYs8PP2wWXj533wNlyYytlapKirJpvlPugn92sNvtO4lXa2jUu7aLAt6l
	hBS8N+SKkC571N4T3UPpxr+sBEcghOSvwBcn4W3OYb507WRPI41qShrNJkMjMF8LQhjM
	UvP7IMNo1n0Sbs1w4snOPP7tU46OM3c/Of2gTdxQeAuU8XPCjHiIez7Mn08HhF3hF9rz
	wyeh7RiAGKV5twK9g8Z5wntuvyFoWcLBw51LWjeVdgBezrgI0hSffqR+28xWALIb/KeY
	gVepMOvwz/At81CBpJwK0XYx6itNHZe0NOIZKSeUqMUewnbrBm6ldQDmWDrMVncceksS
	jPIg==
X-Received: by 10.14.174.198 with SMTP id x46mr72062826eel.23.1358858866691;
	Tue, 22 Jan 2013 04:47:46 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id d3sm26899152eeo.13.2013.01.22.04.47.44
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:47:45 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id D5595400AD2; Tue, 22 Jan 2013 13:47:31 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Jan 2013 13:47:15 +0100
Message-Id: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/6] Bugfixes needed to build against upstream latest
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
X-List-Received-Date: Tue, 22 Jan 2013 12:47:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixed build breakage when updating to latest.
Tested with:

Build Configuration:
BB_VERSION        = "1.17.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "x86_64-poky-linux"
MACHINE           = "qemux86-64"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3+snapshot-20130122"
TUNE_FEATURES     = "m64"
TARGET_FPU        = ""
meta              
meta-yocto        
meta-yocto-bsp      = "master:2ad18945202c46cd71fe6823c80b472ec434000d"
meta-oe           
meta-networking     = "master:26debc05d8b1b9d06d66612bb52de36e3c37f09a"
meta-virtualization = "master:da3865d5fbfec9ece87e7b2bd266e9fcc4818bd0"


David Nyström (6):
  Added meta-networking dependency
  Changed libvirt dependency to netcat-openbsd to match meta-networking
  Removed openbsd-netcat since it now recides in meta-networking
  Removed ebtables, since it now recides in meta-networking
  Moved bbappend to match updated master branch in oe-core
  Fixed build breakage in iasl-native

 README                                             |    2 +
 .../ebtables-2.0.9-2/01debian_defaultconfig.patch  |   50 ------
 .../04compensate-for-missing-aligned-u64.patch     |   16 --
 .../ebtables/ebtables-2.0.9-2/ebtables.init        |  186 --------------------
 .../ebtables-2.0.9-2/installcreatedirs.patch       |   25 ---
 .../ebtables/ebtables-2.0.9-2/installnonroot.patch |   45 -----
 recipes-extended/ebtables/ebtables_2.0.9-2.bb      |   64 -------
 recipes-extended/iasl/iasl_20120215.bb             |    4 +-
 ..._1.4.15.bbappend => iptables_1.4.16.3.bbappend} |    0
 recipes-extended/libvirt/libvirt_1.0.0.bb          |    2 +-
 recipes-networking/netcat/openbsd-netcat_1.6.bb    |   29 ---
 11 files changed, 5 insertions(+), 418 deletions(-)
 delete mode 100644 recipes-extended/ebtables/ebtables-2.0.9-2/01debian_defaultconfig.patch
 delete mode 100644 recipes-extended/ebtables/ebtables-2.0.9-2/04compensate-for-missing-aligned-u64.patch
 delete mode 100755 recipes-extended/ebtables/ebtables-2.0.9-2/ebtables.init
 delete mode 100644 recipes-extended/ebtables/ebtables-2.0.9-2/installcreatedirs.patch
 delete mode 100644 recipes-extended/ebtables/ebtables-2.0.9-2/installnonroot.patch
 delete mode 100644 recipes-extended/ebtables/ebtables_2.0.9-2.bb
 rename recipes-extended/iptables/{iptables_1.4.15.bbappend => iptables_1.4.16.3.bbappend} (100%)
 delete mode 100644 recipes-networking/netcat/openbsd-netcat_1.6.bb

-- 
1.7.9.5


