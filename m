Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.17665.1625638107863105733
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 23:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wEA7DujM;
 spf=neutral (domain: fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@fujitsu.com)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
	by mail.yoctoproject.org (Postfix) with ESMTPS id B5F0F38C0677
	for <meta-virtualization@yoctoproject.org>; Wed,  7 Jul 2021 06:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625638104; i=@fujitsu.com;
	bh=4/36NiZv4U16bV5hfyUMH9NATRByt3VKfn2LFHvjVuc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wEA7DujMoe/UvhrmD5gix7I0KF/srlEy6RdHO5GGcBn5QuoqNxVB7s2mcoxia4OED
	 Q4nuf3Cp6ogIVfqcRT89fVQOuWT8fe7zFtWkzTza82byItP8RYCELMhI/hr3U9D0vp
	 2PbcfrUKyY1HK/Y3vVhsLUFFuBjfoRS4/nmYIpx+q9MOvkzQ2vz7hBC3vfsYxZm6t5
	 qrhlmjbOfrKF+gFXbrmPz1DiTC/Eg9W9h4rfFwiQ8b7rMpN2ROkenqNwv4XOERUDv6
	 Y1rZfOw1lDSnEI7RI9KrbKNrEuK6wGw13G7VJ+r2D8hhvvXg1eH9MhONa7gEETuNUw
	 RwFPPT4NrZBjQ==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 20/99-27654-8D445E06; Wed, 07 Jul 2021 06:08:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYonvD5Wm
  CQc98FovbB44wOzB6tJ/oYwtgjGLNzEvKr0hgzXi04TJLwXm2iqPrDrI0ML5g7WLk4hASmMok
  MffpfGYI5zijxMoND4EcTg42AR2JjhfdLCC2iICWRHvrL7C4sICzxOZ9Z9hBbBYBFYkHPVtYQ
  WxeATeJCys3gdVICChITHn4nhkiLihxcuYTsDnMAhISB1+8gKpRlNi+8wwLhF0hMWPGNrYJjD
  yzkLTMQtKygJFpFaNFUlFmekZJbmJmjq6hgYGuoaGRrqGlma6RqaleYpVukl5qqW55anGJrqF
  eYnmxXnFlbnJOil5easkmRmAgpRQc+b+DcfmbD3qHGCU5mJREeaedepIgxJeUn1KZkVicEV9U
  mpNafIhRhoNDSYJ3lcPTBCHBotT01Iq0zBxgUMOkJTh4lER4xZyB0rzFBYm5xZnpEKlTjIpS4
  rwWTkAJAZBERmkeXBsski4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuaVBxnPk5lXAjf9Fd
  BiJqDFN889BFlckoiQkmpg8pL5M+lvUH6ppzLT2pjju/at3fCt54dem+C8E3e+hLFcXa3JKqK
  u5rhkVXq+u6yGuMnq1+2dTF3bNM4+d4v/PK9Ngu1I1p//KwVXpU2sPVJ9dbpd5P7E6CO2j5JT
  1+9uCvLKvK5WrNDEqp1bIK8XoSPKeHZzxeKFDj5SSc8rD+zoWHwh+Jvhy699Ovrvyqanz87p2
  Wf3duvmTScv/Z/b1H9vQf7WqqDIJ3e7zc72aETbZ1+Q+ffwbOnFE5ery/84r8n4n7bAYjlz2P
  NddoomHBlzVO57X9e5Oa+Z43JMl9fnTXwC3iFaHSe6ZjVXHe58MfNu72ymumfFdyY8u/Pl9yQ
  +Rb81K1dvKH3207EjX4mlOCPRUIu5qDgRAM9ueAEfAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-291.messagelabs.com!1625638103!549132!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17973 invoked from network); 7 Jul 2021 06:08:24 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-13.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jul 2021 06:08:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16768EVa003210
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Wed, 7 Jul 2021 07:08:23 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 7 Jul 2021 07:08:12 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] criu: skip QA checks textrel
Date: Wed, 7 Jul 2021 14:08:04 +0800
Message-ID: <1625638084-8262-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

WARNING: criu-3.14+gitAUTOINC+e49ce513c8-r0 do_package_qa: QA Issue: criu: ELF binary /usr/sbin/criu has relocations in .text [textrel]

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 recipes-containers/criu/criu_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index febf81e..6342620 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -22,6 +22,8 @@ SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=criu-dev \
            file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
           "
 
+INSANE_SKIP_${PN} += "textrel"
+
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
 
 DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native libbsd libnet"
-- 
2.25.1

