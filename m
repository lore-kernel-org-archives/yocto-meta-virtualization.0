Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web08.5806.1627350294681929170
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 18:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yw+D+ixe;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627350292; i=@fujitsu.com;
	bh=RFtmFfKrFBYZJ5b4ZfGj5czbGuISwWqEOWHvwkG36eA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yw+D+ixewDmOnXMRjRFmJSqRhbUOY6STqgn5C9uUG53lMmEFhLzHppU7wpjFWSWxr
	 wujgQZw9w8BWN1dbhJjjfECX4dBgc2OkBMe6Fm3Dmx5aTMWIEZ/ptJOTAezAhhyBrc
	 c/88YOaHqE3B24Jk2K58p6LZiJk/vQPlfDzneiRV1VqHvp9D367xFyX6XmS1LPUu+h
	 0pDiDyoF9KvHvNrGXi29GdMJtpFiryfn7Sa16oXYMMiMW19nq12XtlkbkLU6qY0rs1
	 gHDrW/SV9pLFFBGj4YPmzwZdcMQEB5ECfihJKIPn/3GzQpDDPYMHDx68nHyGTQgZWB
	 TX+iqq9OkbchA==
Received: from [100.113.4.133] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 12/D1-07224-4156FF06; Tue, 27 Jul 2021 01:44:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI0RVO/Z9
  gcH+xjcWiL89YHRg9Zp56xBzAGMWamZeUX5HAmnF75hLmgptcFTuObWBtYOzl7GLk4hASmMMk
  cW/RN0YI5wSjxNYHi4EcTg42AR2JjhfdLCC2iICBxLlz85lBbGEBd4mdU/8xgdgsAqoS3X8us
  ILYvEDx/t0nwHolBBQkpjx8zwwRF5Q4OfMJ2BxmAQmJgy9eMEPUKEps33mGBcKukHh9+BLzBE
  aeWUhaZiFpWcDItIrRMqkoMz2jJDcxM0fX0MBA19DQWNdc18jYUC+xSjdJL7VUNzk1r6QoESi
  rl1herFdcmZuck6KXl1qyiREYSimF7M93MK5680HvEKMkB5OSKO/UxP8JQnxJ+SmVGYnFGfFF
  pTmpxYcYZTg4lCR43yYD5QSLUtNTK9Iyc4BhDZOW4OBREoFI8xYXJOYWZ6ZDpE4xKkqJ8/KBJ
  ARAEhmleXBtsFi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9zfIFJ7MvBK46a+AFjMBLQ
  6u/wuyuCQRISXVwBTJu1Ld6bZqCv+JY/U18x9U2sTM9tc0LgmcwLvx+qGn7AZzN8294PGgclL
  CFf3zRyLkbNY3JB/eu3GSIcvPDMt/X66+e6VaoeDxrtjES2qq9Pe5uo86Jt9evPSgdumDIp4j
  Stotym/iHdkDDKfn7ykyVDI3YZ8fv/TR5Z/8Ud5MlSst0puzl82amhk+58IM27ZjLt94NVzap
  r8N55ksJ51dXi1+77NlmuHCneuscu65ZzhwaMS/3WS0/J4oG0uG/rTcGtf/ySdXmwacXRhzsv
  qMZUP85/mbv4cvfKzBb3DDUzJJwOp7R8CdB2FLZMNmX5Q8+33tk5pD3fZsUrdiREviVi2zktx
  9Z3Pliu8KEUosxRmJhlrMRcWJAOYRUBkgAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-248.messagelabs.com!1627350291!514412!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15417 invoked from network); 27 Jul 2021 01:44:51 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-15.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Jul 2021 01:44:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16R1ijYT009202
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Jul 2021 02:44:51 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 27 Jul 2021 02:44:44 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization] [PATCH] open-iscsi-user: Fix link errors
Date: Tue, 27 Jul 2021 21:44:37 +0800
Message-ID: <1627393477-28317-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

The wrong link caused conflicts with other packages, so the link error was fixed and the conflict handling was removed.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../open-iscsi/open-iscsi-user_2.1.4.bb                   | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
index 73b5a66..b71d8dc 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
@@ -29,12 +29,6 @@ do_compile () {
         oe_runmake user
 }
 
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "60"
-ALTERNATIVE_${PN}-dev = "libcap-ng.so"
-ALTERNATIVE_LINK_NAME[libcap-ng.so] = "${libdir}/libcap-ng.so"
-
 do_install () {
         oe_runmake DESTDIR="${D}" install_user
         install ${S}/etc/initd/initd.debian ${D}/etc/init.d/open-iscsi
@@ -42,7 +36,7 @@ do_install () {
 
         install -d ${D}${libdir}
         install -Dm 0644 ${S}/libopeniscsiusr/libopeniscsiusr.so.0.2.0 ${D}${libdir}/
-        ln -sf ${libdir}/libopeniscsiusr.so.0.2.0 ${D}${libdir}/libcap-ng.so 
+        ln -sf ${libdir}/libopeniscsiusr.so.0.2.0 ${D}${libdir}/libopeniscsiusr.so
 }
 
 # systemd support
-- 
2.25.1

