Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1D8C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 14:07:38 +0000 (UTC)
Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15862.1789567654988872549
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 07:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aAYsiQVc;
 spf=pass (domain: gmail.com, ip: 74.125.228.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f55efe5so167436266b.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Sep 2026 07:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789567653; x=1790172453; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k9Xjcb5mCH+dvYkxfw/aDMWtl7PuEDDvK4KVyxaBOE4=;
        b=aAYsiQVc/2biX6O3YwzmgTequBbGuMVhPDWHBMA+hUjFuzXW+OsCZmv9htvLdpXy+g
         fypEfxgoMvBA7CyuciiooJVc6wV/SldpXzsGr0Diuqu/XP4u4LRK5aP+mShEqaMaaEe6
         /TM7FFgfPOKnqVYmQktr/0RvIvCCooDRLKMSAVpK0mJhYo0zXkdvZfxALUoCy+LbQ4OR
         +OnDbXr00kfZVr8bAtzMCQv3b+lVzutdbzukfdiMD30gV0muoPLTTXlQNfwKTBJCpubh
         tdmsyYg9v278c/zoM89zYjW+HZ+3vBgoiUh+Ijgfi66z1pt/JDdjThGUsIjSoiGE3hrx
         SjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567653; x=1790172453;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k9Xjcb5mCH+dvYkxfw/aDMWtl7PuEDDvK4KVyxaBOE4=;
        b=DHpGLivsueagliVPB24Ff5N3/RmZpipYktMrFTQx+cEo+m8DS+Y3vSTVpCWmImLARZ
         vVYLSe3LzkKdkUSJaM6SrJl7BTgZxeNOv10H3Z1BQm/gwvgLCbah6LRzR5Z8Y+i4QZ28
         ebP77hrfdlGoXt6aH2YE8mJn07SfyajknT2WWgF35cowPQalVONYsJyM5hsZl39ZMifg
         v5vlwLOSwcPJ+OELAyZnFRBpQ3Q9pEoD4P3PbXnBuRdwCNB/zqCBPONX78sw7JHMdQ74
         JDcOmPEq3cZ5y7XzGJFpjNhEFY2lxYwYP//kwLacXvsp4xJKfVMgh3FIZ+Mee/b/TAbZ
         OZfQ==
X-Gm-Message-State: AFuF++nwHoy1uVAiyXUGl7m9DytWiIG8uc7h5ejiC0AT+0VFNnuHHmk1
	/FR4XR0t48qdLW6y1Sq78QOT9uLQMFmjqfXskPPNe40KITHG7jLn2+Yh2b7EGHin
X-Gm-Gg: AYBFou0szXYmeGNIIU8OWoSFjDeqUGxuioGfgX7OG241Vc0s/smRmLojelzR5UG47Fw
	hR50eYfLwb2jb1yT1Hcx8ViC5KPgLKiANXULUOv+JNk4sh6kjP9Zx4XMxWOhwoXbNpARrqzdUdQ
	Ypx9Nt4BT4j+KHWn0svKIVBlXT2LlCV3Osz7Lja9XFDUsDU32vS3AKln5427m/JNuwPSD7jqeIi
	XxNDpFfiGzlXkUyr2gyESeWy8zEpEY+OxZcNwjSzN4CoeuLjD+u5JTiDd99u0+FsBO1sCYlUdqa
	xuXV9Tr6UqmJFz8wtpXwXKJEbX+0Iu3hgX7oGmOgTA7ogvy7bnhEt8/uBUW5I8A6pHUTGMzLFR5
	qQvsgkLO7QhrhcI7WPQMkK6xRZyqK/2kDc6jp/t2BXO1mAOT3ivjkdTxbmtRwkRaIAHxQpzU9f0
	t+C31rOGdzRXeJIekBz6GTyZu0hU4V7EpB3XErjGyKi9o3ejX3FCNODo2QN9RoUbgV883pqJRT4
	L8P03jQMseiHLIRZ+RgXA4E6TlmPSfupDJUnLOkHUBRGjt8ZrnN6Hmi7vEYsy62EBkJYiuMrrx0
	AZpYkFFuPTSWFUE4+NXW5kGlop53BavGKXzMl/NsWpOBCDoyEO+94uV575tVwhARa4ajCyg=
X-Received: by 2002:a17:906:7315:b0:c26:3566:5b47 with SMTP id a640c23a62f3a-c29e51f1537mr205513766b.12.1789567652971;
        Wed, 16 Sep 2026 07:07:32 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de690880sm149740666b.62.2026.09.16.07.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:07:31 -0700 (PDT)
Message-ID: <6aaaa2a3.98235939.208b75.d30f@mx.google.com>
Date: Wed, 16 Sep 2026 07:07:31 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kaloyan.rusev@elektrobit.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH] ankaios: add Eclipse
 Ankaios container orchestrator recipe at v1.0.3
In-Reply-To: <20260915122238.1558501-1-kaloyan.rusev@elektrobit.com>
References: <20260915122238.1558501-1-kaloyan.rusev@elektrobit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Sep 2026 14:07:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10082

Hi Kaloyan,

Two things on this one!

First, same issue as the master-branch v1.0.3 update: the patch has no
Signed-off-by trailer. The body ends and jumps straight to the diff
separator. Please resend as v2 with:

    Signed-off-by: Kaloyan Rusev <kaloyan.rusev@elektrobit.com>

on the last line of the commit body.

Second .. the decision on a backport. The normal stable-branch policy
is only 3rd-digit bugfix and security bumps. New functionality doesn't
land on old release branches, since that's where downstream users have
set their expectations. A new recipe is more than a version bump.

That said, I confirmed the risk is zero here: there is no
recipes-containers/ankaios/ on wrynose today, nothing else in the
wrynose tree references ankaios (no IMAGE_INSTALL, no RDEPENDS, no
packagegroup), and the patch is 100% additive. There's no path by
which merging this could break anything else in the layer.

I'd rather meta-virtualization be useful as a collaboration point when
the risk is that clean, so I lean toward taking this once the
Signed-off-by is in. Just want to be explicit that this is an
exception rather than the norm for stable.

Resend with the SoB and  I'll take it.

Bruce

