Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C135BE00A92; Fri, 22 Jan 2016 21:01:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.177 listed in list.dnswl.org]
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12325E009EA
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Jan 2016 21:01:31 -0800 (PST)
Received: by mail-yk0-f177.google.com with SMTP id s126so84715186ykf.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Jan 2016 21:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZhQWsoCIPvexm2yiyeKpQOv5QWfIS08YswTSlcbuXXo=;
	b=pCSknHrKszQGpK3poov1e+v2FpoEE6muFDxAWkj7azI/xTZ/KURj8AJ2O5+AmzEDGt
	WN3vIPbDnekvT2Jvnw+VidP88YTIf/jRxA9+5vg4ZV8gRG/EiQ2eyzvLUEuI/Adoeqx9
	q28Dj+kMwvDLGBymQDha7KKuVF2c3gYgdmTCcK5krDYMgAFvH5GR0Od5pxJeluKi8HC1
	dH7em49DW92nTtLa+9W56LfjkjNU6sCEUJT1Q8ztquu+u8ACu4Zrv/exwK+WOsICFnDb
	zMQQLVp31Txz5zywPOIPTr/v3+LRqJQVJcQMLyO4ir7yw0sEQAgbR+YlJNvWx+HrpGZU
	2zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZhQWsoCIPvexm2yiyeKpQOv5QWfIS08YswTSlcbuXXo=;
	b=govZdUvdnuNJnY0sltrrD0MWH0tbmG1CGtUo/4PuXTiSdLsMFx6vtW1K6nKf7/n1io
	vo2CcoS3KkUvkebhLtAeZV3/tzDHQ9dZX6904LlPI33Y+2sVH7dFE6/tuQ7wI95DfgL1
	8iRw5Ylc6fFom/SKTNwhPY9weYXB4DoeYd1h06B0qrS++PDy8XoL3daAB0CwdIafpLD2
	eTrvJPJGFaPA3Vdvr+SHrYVBofepZdl5xvIkTDfXG7DaWq/acyK3Q3X59lLQt8eiOvev
	XP2DlMvNh2jVN2cFHxdBkll4SdWLqq74PmsacQ+JHZOMhr5gEwpdAz3RxjBP6wEkDjz/
	nzKg==
X-Gm-Message-State: AG10YOT8g7Qfdmz7ELCNj+N9MFKhZ3ZHjU7bjV8GQ702jYueALl5IpiHZV0b6BEoNaXVAA==
X-Received: by 10.37.90.139 with SMTP id o133mr3504489ybb.85.1453525291035;
	Fri, 22 Jan 2016 21:01:31 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185])
	by smtp.gmail.com with ESMTPSA id i3sm6443654ywc.52.2016.01.22.21.01.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 21:01:26 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 22 Jan 2016 23:01:23 -0600
Message-Id: <1453525283-3307-1-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
Subject: [PATCH] README: make it easier to copy and paste send command
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
X-List-Received-Date: Sat, 23 Jan 2016 05:01:36 -0000

The git send-email command on most shells requires the subject-prefix to
be quoted and with the trailing quote I always think it is from the
README and then realize after the fact I have to edit it. I used $ to
imply the shell prompt since that seems pretty common across the
internet.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index c60044d..2578f90 100644
--- a/README
+++ b/README
@@ -42,7 +42,7 @@ Maintainers: Raymond Danks <ray.danks@se-eng.com>
              Bruce Ashfield <bruce.ashfield@gmail.com>
 
 When sending single patches, please using something like:
-'git send-email -1 --to meta-virtualization@yoctoproject.org --subject-prefix=meta-virtualization][PATCH'
+$ git send-email -1 --to meta-virtualization@yoctoproject.org --subject-prefix='meta-virtualization][PATCH'
 
 License
 -------
-- 
2.4.10


