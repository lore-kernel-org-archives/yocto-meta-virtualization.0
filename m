Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.33648.1623057431119222250
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 02:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wUFBx2d9;
 spf=neutral (domain: fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@fujitsu.com)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
	by mail.yoctoproject.org (Postfix) with ESMTPS id B756A38C049A
	for <meta-virtualization@yoctoproject.org>; Mon,  7 Jun 2021 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623057419; i=@fujitsu.com;
	bh=4L+AGT6+KUSoaD8SosRRAGz4r7ouRWkWWoSXq18QtDE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wUFBx2d9wP9HOUNFvQghiwcdrmU203Yl/MlD4I5oxAC5Hyye1xu/K9r+BX+fB16OY
	 gq3+w9Bhml5wHojah7vArsn6v7PYljpKBDoNz96pAOtiTwuVRknCv/MCrqWEolO5a9
	 edAwHV1+LCb4kn9+zNono6bfim3MDbE5a93lyPGlhKbn5wa5LEi7mKQztFC4Z36C4I
	 UrYpvOqyBm3X5qGAr8yeB+5izaMgvCBbD+xZqpc6v/fe4SSES7zT5/qPYrGOQy7Wy0
	 AjOO79wouXqi8IggDBHN0Muqy+RM1/LiXhbRz4ImD6lWMkruY+Z3Rcx91G/Eg7HobN
	 RTuCE4sapysow==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 7C/51-25406-B04EDB06; Mon, 07 Jun 2021 09:16:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0eV6sjf
  BYE2/gcXtA0eYHRg92k/0sQUwRrFm5iXlVySwZjSducJc8IC9YtuSo2wNjDfZuhi5OIQEpjJJ
  NE78x9jFyAnkHGeUOPs9BcRmE9CR6HjRzQJiiwhoSbS3/mIGsYUF3CSezFoOZrMIqEj8OdUNZ
  vMKuEt8an7PDmJLCChITHn4HiouKHFy5hOwOcwCEhIHX7xghqhRlNi+8wwLhF0hMWPGNrYJjD
  yzkLTMQtKygJFpFaNFUlFmekZJbmJmjq6hgYGuoaGRrqGlha6hubFeYpVukl5qqW55anGJrqF
  eYnmxXnFlbnJOil5easkmRmAYpRQcW7uDsefNB71DjJIcTEqivNdv7U0Q4kvKT6nMSCzOiC8q
  zUktPsQow8GhJMH78hFQTrAoNT21Ii0zBxjSMGkJDh4lEV4pkDRvcUFibnFmOkTqFKOilDivx
  GOghABIIqM0D64NFkeXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzloJM4cnMK4Gb/gpoMR
  PQ4mr7XSCLSxIRUlINTNsOJC0Uriyr5Vq8ZXPOrO+LtE7c5RXz+7yJ69fCDbKc3WXc+fl2fI8
  01C8VM0zie3GwRjm1hnn+o5rLKhvF5lXafC//73hSvPhLcEf0Ylc2gYTnC+8/S9hb+GuysLyB
  xkTBScpLxRWWfl8iWFHNpvlW3fHSl6hA8/L7HX52V0L7pvY+L7rgvHJ/C6NUE7fbwmS9WqO0E
  quXHk+UwhquBXIZ3o/6Xr66UCu/P/04S80UJfnSc2xb75Vlr3W2/vZDuPyWRKLHAwX7ZXM8tx
  4//tVk9od9ivMmPehuNV/7jDNkf/Gt5NkVE7yn/Xy80yKfKaXxXaCVZuUCri8zOb/ev341Jet
  lduTlw3wFLXEiSizFGYmGWsxFxYkAMHoZvh4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-291.messagelabs.com!1623057418!270736!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2471 invoked from network); 7 Jun 2021 09:16:58 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-6.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jun 2021 09:16:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1579Gq4g028156
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Mon, 7 Jun 2021 10:16:58 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 7 Jun 2021 10:16:50 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] novnc: Correct permission error
Date: Mon, 7 Jun 2021 17:16:42 +0800
Message-ID: <1623057402-21919-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

The permission of novnc-server was set incorrectly when copying.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-openstack/recipes-extended/novnc/novnc_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-extended/novnc/novnc_git.bb b/meta-openstack/recipes-extended/novnc/novnc_git.bb
index 53a7056..9032a62 100644
--- a/meta-openstack/recipes-extended/novnc/novnc_git.bb
+++ b/meta-openstack/recipes-extended/novnc/novnc_git.bb
@@ -23,11 +23,11 @@ do_install() {
     install -m 755 -d ${D}${datadir}/novnc
    
     cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/novnc
-    
+ 
     install -m 444 ${S}/vnc.html ${D}${datadir}/novnc/index.html
     install -m 444 ${S}/vnc_lite.html ${D}${datadir}/novnc/vnc_auto.html
 
     install -m 755 -d ${D}${bindir}
-    install -m 644 ${S}/utils/launch.sh ${D}${bindir}/novnc_server
+    install ${S}/utils/launch.sh ${D}${bindir}/novnc_server
 }
 
-- 
2.25.1

