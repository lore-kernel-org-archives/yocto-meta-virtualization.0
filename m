Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F2010ED67F
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 14:07:00 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74027.1774620419032728176
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 Mar 2026 07:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=uiouZkRy;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.52, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b8ebe6bd1so86255f8f.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Mar 2026 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1774620417; x=1775225217; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLaJ7zPCMq1TsrO+wBJgYDEGG1iy4taK29GLRJh9i6Q=;
        b=uiouZkRyu2QF73VUH9cyMmnKAM/t5LymuweuTv362tKNLXB827k4BYtklnM3kJ71dr
         ZZMh7/Fpocrxonw0ZfpOS7j8tssmqBi6g62ipo8fFu0oTcECESEWL2jeQ5SOW5+gO4Zb
         bhZ35EA/ht8Uh0tZwQ1l9RPrdQVt44f0thdWS8EnlyAtSgRkCDA1ifL5NgVHN/zq6DOF
         PE+qLkeqkUYsgh0dzhup5pXrOl33Mv7uiji85N3/b2a1U1dxM56S1lBhw1rc8UWWdfGN
         cMmYHoCJBMBIQd9IDMEOu8llJLBKdGxeE1alrwL0K/t+GEMYrszeK1Klj6OQkPnz9Ovu
         UYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620417; x=1775225217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLaJ7zPCMq1TsrO+wBJgYDEGG1iy4taK29GLRJh9i6Q=;
        b=rsVfadn18kLvqVXmAT1wrkEMgEFMgqyfZjcrXGVgcmKX7khRfaAw5s3ERKYA2Rvc7W
         jQuNiY2QIFMptdceocWzOn/T4dd/9o83wW7WSQseb6DQ4ahtutB8BqhJcPUsHwguF6zb
         mBShZIhs1XuaT8bvqJhjQIFjn/O+k/HPxVrCuUmDNopJO6ekQMvmwiA8IT6g/7Px4OaI
         8mXTZVOUU/cFWyT94B7DKcgASzuSjQV3mn5SVM2Zp2LQ+uk6EJlWemS63ReQuiKEBE+N
         b6Hg8QHVnUPBxx/VDL+hbVWynJN3LSKx0B6/LhhfszWhSupRUdDZgARW5xhrrl7rh13l
         ZB1w==
X-Gm-Message-State: AOJu0YzdVRg/z3SZCcjqSZUGim92Rl1w5VlY3QFQtMNKjU1enBmLJSIt
	mtIKwMbNUTA16YVeGa2KlXwb9WKI0EjldlGgSXWjhrKNYRl21lTrikmAJoKPmer6/cZ6KyVK6lF
	1XQvomgIZ+auSH8wBsFn4h2sqQeX7ALt3aMLkhlzdrFyZUKlPz5XTHThDSRSzLQyXbWMaF5R3pK
	r/wB47M3oYdd2G7CC6Cw==
X-Gm-Gg: ATEYQzzkERPyRuXohLKgStYWWuboxq9Pbsiyv3g5nG5jOVoOpjjzorBCwQbGYv8N7pG
	Y1kHjek2aqxpTKPgK86C4J6K2Qb+Y/A9oX7YbyJTRqZYBvvpcGnXiuHaDwAFVJPhWycTIW1qElK
	M1sKGgsch0gvC1D5IA/K+dz3SYdEhOkNSSJVeG3ubmE4efEaNZzvwkn5+QbD9Bjkco7dRjJ7efZ
	Y/UZJvb6gruMg3uLui9TN51bh/CMyqSYL49OOO9G3H1u2kHG4kGaoWlMEKMd9R4V36GBP361GO2
	xn15A48wtgnd7dCT3j2/x/0g6TAVeoZIunT43Hic0hnR3Oc2Biem6TaIhkkIUOSXFGmaNoiGKkV
	T2UsXCBCD9lgHWhN5iyfRlKALjCF4afi+wlzaL2KNBn+ycrPTgoLqGzr0xwIgMZfwql2sqoFKRl
	tImH1P6eu5SD6Kmeew1ajjUOf2kdYNH3z3NXIEYhev7eZHiE0dPwNK78KaUctyKNYOcyo8gVqh/
	Mxesz3aAppXh/qu
X-Received: by 2002:a05:6000:2b0e:b0:43b:9df3:a1d1 with SMTP id ffacd0b85a97d-43b9ea59ab1mr1430940f8f.8.1774620416962;
        Fri, 27 Mar 2026 07:06:56 -0700 (PDT)
Received: from localhost (dslb-002-205-018-238.002.205.pools.vodafone-ip.de. [2.205.18.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43c9876ffafsm224779f8f.37.2026.03.27.07.06.55
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:06:55 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 0/4] runc: update to 1.1.15
Date: Fri, 27 Mar 2026 15:06:36 +0100
Message-ID: <20260327140640.126833-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Mar 2026 14:07:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9677

runc has been stuck at 1.1.4 for long while in kirkstone, and the last
attempt at updating it had to be reverted.

In order to reduce the amount of open vulnerabilities, update it to the
latest 1.1 release, 1.1.15, by first updating it to 1.1.12, which was
the last 1.1 release in master, then updating it to 1.1.15.

To keep the amount of patches short, I squashed the cherry-picked
updates from master to a single patch each.

In case anyone wonders, runc-opencontainers and runc-docker were at
different commits before they were both bumped to 1.2.0-rc2, which is
why their diffs looks different.

I runtested runc-opencontainers, and compile-tested runc-docker.

Jonas Gorski (4):
  runc-opencontainers: update to 1.1.12
  runc-docker: update to 1.1.12
  runc-opencontainers: update to 1.1.15
  runc-docker: update to 1.1.15

 ...spect-GOBUILDFLAGS-for-runc-and-remove-re.patch | 14 +++++++-------
 recipes-containers/runc/runc-docker_git.bb         |  4 ++--
 recipes-containers/runc/runc-opencontainers_git.bb |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

--=20
2.53.0


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany
Phone: +49 30 610 816 100
Managing Directors:=A0Dr.-Ing. Hagen Woesner, Andreas K=F6psel


Commercial=20
register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569 B
VAT ID No:=A0
DE283257294




