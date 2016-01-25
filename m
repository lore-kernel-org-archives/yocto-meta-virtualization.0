Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBE25E00AAB; Mon, 25 Jan 2016 07:29:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f193.google.com (mail-yk0-f193.google.com
	[209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A41E4E008F5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 07:29:33 -0800 (PST)
Received: by mail-yk0-f193.google.com with SMTP id a85so12305936ykb.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 07:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VvBXZg1PcRef3RgV6EXHJX4JfbszIGICecFkBovx/CE=;
	b=rCe4xzBdoavvAB1esg/VfWAVRJQizx3o5CYxHFHTiL4w55pHCeCzv443KISAmTaPoM
	zz/IAe+4SVYNlQQmGpQMeW9LISFsbRxQZwDhfL05D+4EgDhT7SIGOFVQQA0qGP+lV8Pp
	jyPeUGk8itLYU8XyZGyIqYOjyNdrWPu+zbTRtmvSUVWOe/ipJhEX0N9xvCghjUJx+69W
	MCquLL+zT1oTB0P6finEPrO960Enp604EfZHwdrz7zvnOwwTTpnb59StEcRVXsC7GZvU
	THH43odCeEtrE7Z22Y+wgGsTc1NpBm0e7bHyB1S8yt+DmiZIEATWz0izlE9zCBMNy/c9
	3Y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VvBXZg1PcRef3RgV6EXHJX4JfbszIGICecFkBovx/CE=;
	b=PUy+p5O+hNsem118D9NEMq/MolQiFddcVT4M7KbO30IMcqhmVwFXmk6QIfJYusGAQD
	m+kvfIEKgH2EX4X3EE3QrFgV/50sKPOdUHPL8occePv3gqvX85WPA3deL10va59qFwOR
	tV/r54s9NcTiJ0OtGbTT2S3s0V6jJ7/vo2Q7/4yzx3YzoLVuyHxTF/NTM+8ghylprcOM
	5sRKlnq9ryg2vc6QcrAw46/muivFYBkoBdRfU+mF6KSzcDkZ/AgiYz9ZDsMURPNLYfED
	25w8nqfCB0P+sVtBb5Ts196JrSYwpW8nh+b7aLOQ5dvx9/Eq6a4LE2tDrR7xSAsbnBgq
	M6Pg==
X-Gm-Message-State: AG10YORNOXO+g+8h0iQVURHU4Kt/VzIg0pP73JFj1KG4IRcgoGeynL4I5OfWfWahk5F7QA==
X-Received: by 10.37.24.195 with SMTP id 186mr8431210yby.162.1453735772484;
	Mon, 25 Jan 2016 07:29:32 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	193sm14422579ywe.22.2016.01.25.07.29.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 07:29:31 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 25 Jan 2016 09:29:08 -0600
Message-Id: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
Subject: [PATCH 1/5] xen: update git version to 4.6.x
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
X-List-Received-Date: Mon, 25 Jan 2016 15:29:37 -0000

Since xen.inc has been updated to support only Xen 4.6.x, the xen_git.bb
should be updated to a revision in the 4.6.x stable series.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 88145a3..9e74d7a 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,8 +1,8 @@
 require xen.inc
 
-SRCREV = "68bd172e6fa565899c846eb72755c8ffd8562c8a"
+SRCREV = "1fd615aa0108490ffc558d27627f509183cbfdaf"
 
-PV = "4.4.0+git${SRCPV}"
+PV = "4.6.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.4.10


