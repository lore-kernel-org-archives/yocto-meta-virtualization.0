Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.7115.1625713431761315720
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 20:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JBQcVdzg;
 spf=neutral (domain: fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@fujitsu.com)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.81])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 4ED5D38C0882
	for <meta-virtualization@yoctoproject.org>; Thu,  8 Jul 2021 03:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625713428; i=@fujitsu.com;
	bh=6sih+fhGmI29CK1H0GJCGp/I/Gv+9z52ccaMi2qnxFQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JBQcVdzgYPAdi1mGoBW8JEZwvtth6NuqDScRTfHljDAtNrui2RN1i/TCgqCG3ht+l
	 dYpMMNyrww57cdY0KIKtCI6AZt/AoESBM/MVDPkmgyNfUAPtQDK8xKA4JJ0BHCYqKv
	 0h7xTOjn9pUhR0jKTiJZ87Z0/vSSwjHBzI7SZAaLg36CTHe8uqmzv9yoP43JGvDSnt
	 gFZQPimQ7WH13MjB0LkuASYkHTQAzTeItOknCYEhiCQgG8ZJBzjUBpPnyVd6YoBBRW
	 95CrPd9N6dZ8PKiY8MQTwK3wo7m5m+S+jrTtPTFG5anlo7opoAdevi2QeKgk1p9R01
	 almUTdbn0MisQ==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id C6/40-03155-31B66E06; Thu, 08 Jul 2021 03:03:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqiuc/Sz
  BoGennMXtA0eYHRg92k/0sQUwRrFm5iXlVySwZjx4PZ2pYAFXxZt955kaGB9wdDFycQgJTGWS
  WHDiJxuEc5xR4sydDexdjJwcbAI6Eh0vullAbBEBLYn21l/MILawgKvE60tnmboYOThYBFQkW
  k9Vg4R5BdwlWlbcYQOxJQQUJKY8fM8MEReUODnzCdgYZgEJiYMvXjBD1ChKbN95hgXCrpCYMW
  Mb2wRGnllIWmYhaVnAyLSK0SKpKDM9oyQ3MTNH19DAQNfQ0EjX0NJC19DYQC+xSjdJL7VUtzy
  1uETXUC+xvFivuDI3OSdFLy+1ZBMjMIxSCo417WA8+fqD3iFGSQ4mJVHek07PEoT4kvJTKjMS
  izPii0pzUosPMcpwcChJ8G7LBMoJFqWmp1akZeYAQxomLcHBoyTCWw2S5i0uSMwtzkyHSJ1iV
  JQS503IAkoIgCQySvPg2mBxdIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG8QyBSezLwSuO
  mvgBYzAS1mOPwUZHFJIkJKqoFp74LyVyXHd3Nf3e175Xt7icuctl9HH/ayrVFYXmvdKXHSdv1
  FPfbQvO9bls+JtVKx+5yp5eNeUCi0fxGPw+TezO+FfjwX9ZriPvLrpUgqaWjeWq876UPerxjT
  uM3drpv5D25c/HD+kyMGWk1WZ+eFSOyJ6rkYsrVFIXX3qsfvpWxXrDwQXOz71spGRe2q+4o/i
  4Lm9vbIGP2O0uXZu/X84U1n9PY2dPaKeZiZX31nUOxykm2xRX+ehEuFzJ5YcYFizcZXxzoKz7
  d/cmubY5Z4lcVINbLJ4fFkvr+uHw3Uzsg/6W+rPSb5eO+9NKW0BbH37qVHfazR3Pj8boBap8I
  sznkzdbqjsvmvHA8yDldiKc5INNRiLipOBABA/ZYyHgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-285.messagelabs.com!1625713427!543281!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22317 invoked from network); 8 Jul 2021 03:03:47 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Jul 2021 03:03:47 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16833fUU008735
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Thu, 8 Jul 2021 04:03:47 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 8 Jul 2021 04:03:40 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCHv2] criu: skip QA checks textrel
Date: Thu, 8 Jul 2021 11:03:32 +0800
Message-ID: <1625713412-26427-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

For simplicity - compile code in Arm mode without interwork. We could choose 
Thumb mode as default instead - but a dirty experiment shows that with 90Kb PIEs 
Thumb code doesn't save even one page. So, let's stick so far to Arm mode as it's 
more universal around all different Arm variations, until someone will find any 
use for Thumb mode. -dima

Because of the above reasons, the arm platform does not enable PIE, so skip 
the testrel check to avoid warning.

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

