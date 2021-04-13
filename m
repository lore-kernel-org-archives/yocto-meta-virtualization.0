Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.4873.1618291060146060331
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 22:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Tg8w/inx;
 spf=neutral (domain: fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@fujitsu.com)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7B23E38C0830
	for <meta-virtualization@yoctoproject.org>; Tue, 13 Apr 2021 05:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618291056; i=@fujitsu.com;
	bh=2U2P5Dy7e84OOMkK0OAhIHFxTWGu8Hptu4xRxYuEoWY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Tg8w/inx7b5LNFZvoHLXU0WG0gXxQiiLy+JyM+HP+JNS6+HSg5b3PI6AhE6JCTMHp
	 u4uWxRxrNoDEdxssnzT2IUFTKZumSSQBy0cJdnUO0NtiO/aAaqlOylKlpFQdN/FVHN
	 fJRueA8yu+ZQbGK8gyVNwMfEClGpRZEuDBUhXtmmYkB/SaeInKRwSY3AEgOCMIe4eB
	 P8935jlnrxXlvMHYZT6ZdH5QBo9Tq/zxVdSoWjHYvip2aVLZ9pIScZcmv8g/SAoYAr
	 ntvTeHnc6iP7ct52gRRELR0dgF53GUX1+77eoenHy7Pfzob5EqIiiYM5IrqB1trYPN
	 ZzDfEZMs5ZKfA==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 7A/81-24644-07925706; Tue, 13 Apr 2021 05:17:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0S3QLE0
  wmNHIb3H7wBFmB0aP9hN9bAGMUayZeUn5FQmsGU3tE9gKnrJWHPu/mamBcRprFyMnh5DANCaJ
  iZdKuxi5gOzjjBKv59xnA0mwCehIdLzoZgGxRQS0JNpbfzF3MXJwCAvYSqz+agESZhFQlbh5/
  Ck7iM0r4CZxfdYpZhBbQkBBYsrD98wQcUGJkzOfgI1hFpCQOPjiBVSNosT2nWdYIOxKie3Tzj
  JOYOSZhaRlFpKWBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdA0tjXSNDEz0Eqt0E/VSS3XLU4t
  LdA31EsuL9Yorc5NzUvTyUks2MQKDKKXgwJkdjKdef9A7xCjJwaQkyruhqyRBiC8pP6UyI7E4
  I76oNCe1+BCjDAeHkgRvsEZpgpBgUWp6akVaZg4woGHSEhw8SiK871SA0rzFBYm5xZnpEKlTj
  IpS4rxzQfoEQBIZpXlwbbAousQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNddHWgKT2ZeCd
  z0V0CLmYAWX9xaCLK4JBEhJdXA5F1to7Gq13b2GrbbVf6Jy0Mdp2fULFg/uSYy99puUcUnU4z
  8Pr5KyLQ3atzuEZXbpcRSXuF7YEJWwYGDbe52k/SW/ixyYrNjyfLcGrx93k+fgA1yDRvLhMQf
  LuCWu237dK/dt1nfU5wmNJ85vkxNZXGlqvK01462EldfCzLPtdVVd7/650J3l+vnSYuP5i+r1
  nHcF/PjYHDrp6/b0lWSe4/27asumMMeG/x9t07xpuDDr+6sm2349GDk7xfnsyUmPqos1Enxvn
  fP1Veez8v3wcqJjnrz5y+4cm568NJNMcscf8/zPWS74vKTUu4nelfLIlc6zE+Wfapk71ws/DH
  TWd9lu9XMJQduMfw7leE/X4mlOCPRUIu5qDgRAPxcKDcdAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-271.messagelabs.com!1618291055!684721!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23306 invoked from network); 13 Apr 2021 05:17:36 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-22.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Apr 2021 05:17:36 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13D5HTjX021873
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Tue, 13 Apr 2021 06:17:35 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 06:17:28 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] novnc: Correct LICENSE
Date: Wed, 14 Apr 2021 01:17:18 +0800
Message-ID: <1618334238-4306-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

The LICENSE.txt file is described as follows:
The default noVNC license is MPL-2.0.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-openstack/recipes-extended/novnc/novnc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/novnc/novnc_git.bb b/meta-openstack/recipes-extended/novnc/novnc_git.bb
index ee20e3b..7099d85 100644
--- a/meta-openstack/recipes-extended/novnc/novnc_git.bb
+++ b/meta-openstack/recipes-extended/novnc/novnc_git.bb
@@ -4,7 +4,7 @@ SECTION = "web"
 
 PR = "r0"
 
-LICENSE = "MIT"
+LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ac06308a999996ffc2d24d81b3a39f1b"
 
 SRCREV = "8f12ca7a5a64144fe548cada332d5d19ef26a1fe"
-- 
2.25.1

