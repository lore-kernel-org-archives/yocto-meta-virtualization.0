Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.26749.1620615417979655435
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 May 2021 19:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ynEyD0Rv;
 spf=neutral (domain: fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@fujitsu.com)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 876E438C056B
	for <meta-virtualization@yoctoproject.org>; Mon, 10 May 2021 02:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620615414; i=@fujitsu.com;
	bh=3QqSpJinXINscU50ikZdQYTvCxT0skqacQ+sDtnZd24=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ynEyD0RvihHEsxCjL68bC5/bE094XXV/fVVbjK77maqoFsg1F4fxb8zOXHJRMZOEY
	 P/GKw67GXi9snWCQKyJXzfd0ee3GzXIC9DFxuBdvII45Tr+TY8KSnjQ9Tj1zNBecEl
	 PFfiqncugSjLe2tpx9S3MY5L+M1jLuKQxFQ69dbO5kbaEbmMJabs/yVVFtMSK16U5O
	 clpJ005ugnu2R/KSZDIgrCU/CsroYyigWnytI0Mq5rf73Su+pu8F9Kbmn5TgNRDieA
	 jgeaXZ7oc+x2SB0I+HlZ29kLetvW1ulLoL2lIGWsNteDlYW7gP917al2h89VM0e8LF
	 eslWS3ptB45LA==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 86/4C-23163-5F0A8906; Mon, 10 May 2021 02:56:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYqvt1wYw
  Eg5fb9SxuHzjC7MDo0X6ijy2AMYo1My8pvyKBNaN54X3mgiMsFbtW7WVsYGxn6WLk4hASmMYk
  sWLrFGYIZzejxPlVDxm7GDk52AR0Jc49XssOYosIaEm0t/5iBrGFBUIlLn3ezAJiswioSjy5f
  YQNxOYV8JBYevE3WFxCQEFiysP3zBBxQYmTM5+AxZkFJCQOvngBFOcAqlGUmD1dHqK8QmLGjG
  1sExh5ZiHpmIWkYwEj0ypGy6SizPSMktzEzBxdQwMDXUNDY11TXSMTQ73EKt0kvdRS3eTUvJK
  iRKCsXmJ5sV5xZW5yTopeXmrJJkZgIKUUsn7cwXjo9Qe9Q4ySHExKory/Q6cnCPEl5adUZiQW
  Z8QXleakFh9ilOHgUJLgvTJvRoKQYFFqempFWmYOMKhh0hIcPEoivF0gad7igsTc4sx0iNQpR
  kUpcV6z+UAJAZBERmkeXBsski4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEua9CTKFJzOvBG
  76K6DFTECLHyyaBrK4JBEhJdXA5HRoS/LyflfulBdbd9yeEF/13X/+zssOz+5fOj3te87bf6s
  72dOrXj9fkNCf/if05OWl96f8Cllz26pcLkNCrcde71f54zj2d/OmKHcw106tPzlDco+/MI/z
  cekl4Y/YajmDuaes3XXITXGuXONmrvPNBQtby56W2KczSP2Y971polZk6sZ7rOEPdgVtiV6Xk
  37+q/hqCTvPFyIMawticwX3/Iy/N1nt4AJBJ21Dha+f1187viZ1R6lL+95duVn2RXmMQoxPrH
  uXXF6syuynM3ej1J2XAhvWRJ1wmbS4Om3RUv+svkkfOli3qGb6P9jwj9MjX/P1Z9aP5j+kFjy
  Qf5CVHFGw/Pfbt0/nl9+JO6TEUpyRaKjFXFScCABjZ1lHHwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-31.tower-248.messagelabs.com!1620615413!844094!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11914 invoked from network); 10 May 2021 02:56:53 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-31.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 May 2021 02:56:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14A2ul4I024971
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Mon, 10 May 2021 03:56:53 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 10 May 2021 03:56:46 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization][PATCH] initrd: bump busybox to 1.33.1 to match oe-core
Date: Mon, 10 May 2021 10:56:29 +0800
Message-ID: <1620615389-72870-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

    OE core has updated busybox, so we bump to match.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{busybox-initrd_1.33.0.bb => busybox-initrd_1.33.1.bb}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-core/busybox/{busybox-initrd_1.33.0.bb => busybox-initrd_1.33.1.bb} (100%)

diff --git a/recipes-core/busybox/busybox-initrd_1.33.0.bb b/recipes-core/busybox/busybox-initrd_1.33.1.bb
similarity index 100%
rename from recipes-core/busybox/busybox-initrd_1.33.0.bb
rename to recipes-core/busybox/busybox-initrd_1.33.1.bb
-- 
2.25.1

