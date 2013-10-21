Return-Path: <jonatan.palsson@pelagicore.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40497E01732
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Oct 2013 05:01:51 -0700 (PDT)
Received: by mail-lb0-f171.google.com with SMTP id x18so3634730lbi.30
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Oct 2013 05:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=t1XDEDMJSvQX109Fp64lxfeb68LNk6uDZVYBcoQfxRA=;
	b=j2lXs+NCtSxkVtEYWrS6VM2gpo0E3GTOx20mPZNjkQjQ//wKGJDFaqprF2Ix+DEzUf
	/ss5j/Qr3PR7UWpwnBa5JkSjxhcH9yZXMJa09MUVaxDRfCFcHBw1Qf/oUpqwYr0y67it
	0ZLj3HJUdN/qZguIJkZpy/1au6VkA6p1hz844lquFxFvvJEeHjpfj5PWCDZZwvTBOftu
	SdcbltQy4306O5NuJYuPLDHeqMWd9CUjsjJOEU5Qr7UumbZxvsRrujKN6SqPabPE/qlj
	L9vRWNJjMQ2HuKWlxW44/fQwStqcC5hxAnpsNPn8smYel7LQJ9pN5P4zf4QF0BLyVLeS
	uX7A==
X-Gm-Message-State: ALoCoQnreqTFSh9L/US0Jvic2oFbpuZCMsCXa7OBYUXRP5ccXJfjRhoLFaP1XHZmFOnpIxL9IRLo
X-Received: by 10.152.8.51 with SMTP id o19mr1044524laa.42.1382356910696;
	Mon, 21 Oct 2013 05:01:50 -0700 (PDT)
Received: from Wheezy3.office.pelagicore.net
	(194-237-7-146.customer.telia.com. [194.237.7.146])
	by mx.google.com with ESMTPSA id u20sm12017525lbh.7.2013.10.21.05.01.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Oct 2013 05:01:50 -0700 (PDT)
From: =?UTF-8?q?Jonatan=20P=C3=A5lsson?= <jonatan.palsson@pelagicore.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 21 Oct 2013 14:00:57 +0200
Message-Id: <1382356857-17517-1-git-send-email-jonatan.palsson@pelagicore.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Subject: [PATCH] lxc: fixed URL for tarball
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
X-List-Received-Date: Mon, 21 Oct 2013 12:01:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Jonatan Pålsson <jonatan.palsson@pelagicore.com>
---
 recipes-containers/lxc/lxc_0.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index 563131f..8f7736b 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -21,7 +21,7 @@ RDEPENDS_${PN} = " \
 		perl-module-exporter-heavy \
 "
 
-SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
+SRC_URI = "http://linuxcontainers.org/downloads/${PN}-${PV}.tar.gz \
 	file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
 	file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
     file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
-- 
1.8.4.rc3


