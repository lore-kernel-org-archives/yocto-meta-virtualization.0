Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32326C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 12:48:15 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.5803.1655210891077126634
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 05:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20210112.gappssmtp.com header.s=20210112
 header.b=hGsvB+PI;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.218.53,
 mailfrom: jonas.gorski@bisdn.de)
Received: by mail-ej1-f53.google.com with SMTP id me5so16996748ejb.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eqVIkYe6g+flTS0vaP0BT0lz8dTFvP7K30CNFotmaf8=;
        b=hGsvB+PIRS5F2sXMO6cMuDvos0Ey0e+Irk+tG1WMijYELmN2lhh+YYq+BOdpfs6E3X
         JTasBcqLM7IoQkEg3pA2gXGks7c+sDEas+G/Gn8rictk7ji0+ut041QUx67zwxWIlEQm
         YUtQU3UZLj+oq7zuok6yo7hAOuDpgHPIrNSZf+gatRS7RsacHuzxUTpbzheBJg/e+dqN
         ShBmATi+AJqBow1niYcoxr8DTx6N7zXH/y0SnI/OAAN7wcHCso1JfiDazBN6RqNxr+qH
         ge1XuIbL5dXC9Gk/pt16aHalEPOrDdFq8X/o0baMY3dEc+stgWK7HNb8YUuw9lFXP65U
         97yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eqVIkYe6g+flTS0vaP0BT0lz8dTFvP7K30CNFotmaf8=;
        b=6edb3+p6c2kFHcq4uDaMfJ2LOG/1vq/9Lpw0CbpTqa+HZSy6CM92Yx+468+i4XUcb9
         +lmCIhCGV71S1ADhdJYa1hf3G0sOADnMJc9hvDcRIk85fgTTiWn6F5Le8Vf0o0IDfCvC
         Qy/TIqULI9eZCkmURnR4gH1Kk0QugyFjg9lejRavYEqEk/55mR/VciKOFkgmyF3cYk/R
         he0y8I26pyR9BLN+fkXRr8TFghHV7skw2gvx6HGu/NNBMCNRUGdbko9lHwa47wJezJg4
         cUjpSLfDv12UcyualG52Lq3v24q/qM16WtwtL2soHUVj5qwMqo8v/7/C68b2vUWUGAR+
         Y+Fw==
X-Gm-Message-State: AOAM532g4OM3199tj2Ols+UZwm8Ztp8HjdGfAMpJnZFNoIeIDr9SpcEk
	b4L36HKxAA2WVHddZ/23f6DzaNAKuNgsh2bIOJQeB1oeGk3uonT6D2vw7c2A5o4UvPXIQ88Ym47
	g+WGo2+7E62N4l89HuISQ6qTLD6rPQuR3TtTWk+i7zrpI
X-Google-Smtp-Source: 
 AGRyM1vZ5XLNKrjQpJqucjILhSSS+3QQIzPGZeGkO58Xmo0vwRqzSHjWkjZuzvCHzcsiizsrxxCTyw==
X-Received: by 2002:a17:906:ca91:b0:70d:52ca:7e7d with SMTP id
 js17-20020a170906ca9100b0070d52ca7e7dmr4094978ejb.552.1655210889015;
        Tue, 14 Jun 2022 05:48:09 -0700 (PDT)
Received: from dummy-pc.bisdn.de ([62.80.99.152])
        by smtp.gmail.com with ESMTPSA id
 vp5-20020a17090712c500b006f3ef214ddesm4998084ejb.68.2022.06.14.05.48.08
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 05:48:08 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-cloud-services][PATCH] python3-arrow: drop
 python3-backports-functools-lru-cache dependency
Date: Tue, 14 Jun 2022 14:47:56 +0200
Message-Id: <20220614124756.14013-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Jun 2022 12:48:15 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7380

python3-backports-functools-lru-cache was recently dropped from
meta-python with 620689d4efba ("python3-backports-functional-lru-cache:
remove, not needed for Python 3").

Since the functionality it provides is already part of python3, we can
just drop the dependency.

Fixes the following error when trying to build python3-arrow in
kirkstone or newer:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'python3-backports-functools-lru-cache' (but /home=
/jonas/poky/meta-cloud-services/meta-openstack/recipes-devtools/python/pyth=
on3-arrow_0.17.0.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-backports-functools-lru-cache' is unbuildable=
, removing...
Missing or unbuildable dependency chain was: ['python3-backports-functools-=
lru-cache']
ERROR: Required build target 'python3-arrow' has no buildable providers.
Missing or unbuildable dependency chain was: ['python3-arrow', 'python3-bac=
kports-functools-lru-cache']

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
I hope this is the right list. As mentioned in the commit message, this
applies to kirkstone and master (but not e.g. honister, since the
dependency still exists there). Patch is based on master.

 meta-openstack/recipes-devtools/python/python3-arrow_0.17.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-arrow_0.17.0.bb=
 b/meta-openstack/recipes-devtools/python/python3-arrow_0.17.0.bb
index 449063f0b6fb..9ef1d8faa2c4 100644
--- a/meta-openstack/recipes-devtools/python/python3-arrow_0.17.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-arrow_0.17.0.bb
@@ -11,5 +11,4 @@ inherit setuptools3 pypi
=20
 RDEPENDS:${PN} +=3D " \
         ${PYTHON_PN}-dateutil \
-        ${PYTHON_PN}-backports-functools-lru-cache \
         "
--=20
2.36.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


