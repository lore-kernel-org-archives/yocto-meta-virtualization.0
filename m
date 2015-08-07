Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EAB91E00A3C; Fri,  7 Aug 2015 05:55:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF563E00A31
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Aug 2015 05:54:59 -0700 (PDT)
Received: by ykoo205 with SMTP id o205so87758344yko.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 07 Aug 2015 05:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o9M60XUbuOBL7ftiOuohEI8KBZlnb4Kv50v9Yf8Nf5U=;
	b=XJrXCKzGg/n427GrqZMoP+BHdgoMmt9iyWBpeB8U9EQqB7ONvP48tGaEsRtbCep0YM
	9OvN4gp9vazqp1RwZb3glGqbNhoBb7Ahh8oWJiA2g8XBWAio0EIsQebSatzZXtQD2YRI
	ru5hHafTJnslCiRF8RdSYHgoeY4iYVFOodNyI+/loQC+32qRaK5yMus53mv4px09/BHj
	Dsn6Ab+4dyZnB7Z7gisa5oa4fpggluT4HYTRn5h9P32GkF2GKRJiBIKKbXEC24i+afLV
	mdrzXoikbvrb2Ti1GCUNm6nwfYt4xEQyoN8aKIHaff72g/eaVCvevIvYbxIR/iQ6aPYl
	entg==
X-Gm-Message-State: ALoCoQlpS0DiMSkCDSSe2AwmzcfD945sdOldpWEs3IYVI6aif/uuoMtM1jrR20Bg6jXZM1mn45sT
X-Received: by 10.170.170.6 with SMTP id m6mr7242909ykd.102.1438952098855;
	Fri, 07 Aug 2015 05:54:58 -0700 (PDT)
Received: from doug-t430.lan ([67.63.141.2])
	by smtp.gmail.com with ESMTPSA id c3sm9302397ywd.39.2015.08.07.05.54.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Aug 2015 05:54:58 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  7 Aug 2015 07:54:36 -0500
Message-Id: <1438952077-9400-1-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] README: don't advertise obsolete layer URLs
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
X-List-Received-Date: Fri, 07 Aug 2015 12:55:03 -0000

This layer depends on openembedded-core and meta-openembedded so
recommend the actual URLs and not the obsolete ones.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README b/README
index beb3760..652d98f 100644
--- a/README
+++ b/README
@@ -8,12 +8,12 @@ Dependencies
 ------------
 This layer depends on:
 
-URI: git://github.com/openembedded/oe-core.git
+URI: git://github.com/openembedded/openembedded-core.git
 branch: master
 revision: HEAD
 prio: default
 
-URI: git://github.com/openembedded/meta-oe.git
+URI: git://github.com/openembedded/meta-openembedded.git
 branch: master
 revision: HEAD
 layers: meta-oe
-- 
2.1.4


