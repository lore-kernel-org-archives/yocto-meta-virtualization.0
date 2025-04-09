Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1834C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 04:02:30 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.760.1744171349030866418
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 21:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TqsvO7AB;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476af5479feso62195591cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Apr 2025 21:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744171348; x=1744776148; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9wSyTrNgeg1BHbVs09R03UIEFpD3t0LjF40izD+rSpY=;
        b=TqsvO7ABtLUExHFkLBGA0EpohbAt0c6yRyBRJpm59KJKFTVjaLIBKt6rPRm2Oraqtu
         X3Yjwu8GxqwT3o3D9zljmlm4uTR98wiDHryKo37/tAFrHgw17LLAI84W9EffpLIWslOQ
         eO+nRMZanvuVWEluX77KB5J6s0wb+5nCR7/cNYbrylEqkfIfxb84tvHxzxrwzFbVFiiM
         +5bnQB8FO7olRiSTQI75O+6Vx63dNd4IqEACH8JEVK07hy9LtAGC9kRoRh0Sd0h0rXJ8
         8nhuft8O6eBG/8sFadvkAqIpLQW/MmwHRRH2ifk8u+cUSUR3pBomVTf2aRt1bRQ3OyIg
         VqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744171348; x=1744776148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wSyTrNgeg1BHbVs09R03UIEFpD3t0LjF40izD+rSpY=;
        b=FGAhyhgfvuGAwks0v+tgXEWaSZDa9r/11BIIvyUW0DHFyu5+9pcmzJVaL8warzwTH5
         h52jgqV9a6N/0NpbWfU/opswGQMnDXkmpPZjaWsixPYmrYV0jXzX0ED8YVrY+GQc6+zV
         sAE2nW5odHANFVUUqPMOnS2P+KEIaUsHZ0BcUgLdWz7UuysP5zjeikgp1WoG8v2WMu/e
         6A9N1r8g/6KXrVvkGnO7aN5Pnaq7wOR4xqxB/FA8QXMl+BjqKIQznvplIE05zM0REv+0
         Wwm1EgYKwF6qa6xqLr8ynd/2WSTQTilvGJ3yVYPegsDFJ/890etdfBlOV7Z3bks8hZ0s
         08ag==
X-Gm-Message-State: AOJu0YySHGce9xdWT+k3s1Ljb/0rCq4zVRPQ84EfOqLoepRy89IJ4z77
	RFvV+9rdezuGJOU35LIa94SP5WyCyO7hj6SsAV90WbeOKsKaEi8j
X-Gm-Gg: ASbGncv8BJhBKUccuGlfoXBRHO7tuxDmO1u2WO8JLnFJYoD5cuAGjdCMXF81ubil3z1
	8vW6w5fMwzdh1WaWFAZ162A1D5PNu0Y87sU5ESL4gQKxAhK4C9BHl7OPYNTslKlIY9bv2P2ofEY
	20ig6GCb+o11jFxpIVvD2pjjC1WiLNjOn2anPxOJepZBfF46ULjqvzLr1OvFfZPi8c2WNtGifQx
	adPBKM0lxY86drBjOao1O97m/EWBciKLXG2mkPYqPPRFbv2jfJ9Kc+dZOqT9Uh9VSHJ2S5OTX7p
	tW6XlIYhr164URs5b6QkeoIgYu0JnjPFlOlddl8dl0tNXu8qMpFcB8svKUdIwoGodBl3BD8vcv7
	xyKxfBws3wJGe7kDRjY1m7PI=
X-Google-Smtp-Source: AGHT+IHpt4V4jAmm+P+avYUo4+tu8tlbBZawa1Ov0cUPDJHKaMB4vF05wOmrXOQNuXTOrBhJvnNwEw==
X-Received: by 2002:ac8:7d52:0:b0:476:9847:7c6e with SMTP id d75a77b69052e-479600a5771mr15341191cf.19.1744171347744;
        Tue, 08 Apr 2025 21:02:27 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47964ef7299sm1588601cf.69.2025.04.08.21.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 21:02:27 -0700 (PDT)
Date: Wed, 9 Apr 2025 04:02:25 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yogita.Urade@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] ceph: fix
 CVE-2023-43040
Message-ID: <Z_XxUZFWBxPkBkC5@gmail.com>
References: <20250404100409.3558585-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404100409.3558585-1-yogita.urade@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 04:02:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9208

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH 1/1] ceph: fix CVE-2023-43040
on 04/04/2025 Urade, Yogita via lists.yoctoproject.org wrote:

> From: Yogita Urade <yogita.urade@windriver.com>
> 
> IBM Spectrum Fusion HCI 2.5.2 through 2.7.2 could allow an
> attacker to perform unauthorized actions in RGW for Ceph due
> to improper bucket access. IBM X-Force ID: 266807.
> 
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2023-43040
> 
> Upstream patch:
> https://github.com/ceph/ceph/commit/98bfb71cb38899333deb58dd2562037450fd7fa8
> 
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  .../ceph/ceph/CVE-2023-43040.patch            | 56 +++++++++++++++++++
>  recipes-extended/ceph/ceph_15.2.17.bb         |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 recipes-extended/ceph/ceph/CVE-2023-43040.patch
> 
> diff --git a/recipes-extended/ceph/ceph/CVE-2023-43040.patch b/recipes-extended/ceph/ceph/CVE-2023-43040.patch
> new file mode 100644
> index 00000000..18fca583
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/CVE-2023-43040.patch
> @@ -0,0 +1,56 @@
> +From 98bfb71cb38899333deb58dd2562037450fd7fa8 Mon Sep 17 00:00:00 2001
> +From: Joshua Baergen <jbaergen@digitalocean.com>
> +Date: Wed, 17 May 2023 12:17:09 -0600
> +Subject: [PATCH] rgw: Fix bucket validation against POST policies
> +
> +It's possible that user could provide a form part as a part of a POST
> +object upload that uses 'bucket' as a key; in this case, it was
> +overriding what was being set in the validation env (which is the real
> +bucket being modified). The result of this is that a user could actually
> +upload to any bucket accessible by the specified access key by matching
> +the bucket in the POST policy in said POST form part.
> +
> +Fix this simply by setting the bucket to the correct value after the
> +POST form parts are processed, ignoring the form part above if
> +specified.
> +
> +Fixes: https://tracker.ceph.com/issues/63004
> +
> +Signed-off-by: Joshua Baergen <jbaergen@digitalocean.com>
> +
> +CVE: CVE-2023-43040
> +Upstream-Status: Backport [https://github.com/ceph/ceph/commit/98bfb71cb38899333deb58dd2562037450fd7fa8]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + src/rgw/rgw_rest_s3.cc | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/rgw/rgw_rest_s3.cc b/src/rgw/rgw_rest_s3.cc
> +index cb026714..40b4ff92 100644
> +--- a/src/rgw/rgw_rest_s3.cc
> ++++ b/src/rgw/rgw_rest_s3.cc
> +@@ -2735,10 +2735,6 @@ int RGWPostObj_ObjStore_S3::get_params()
> +
> +   map_qs_metadata(s);
> +
> +-  ldpp_dout(this, 20) << "adding bucket to policy env: " << s->bucket.name
> +-		    << dendl;
> +-  env.add_var("bucket", s->bucket.name);
> +-
> +   bool done;
> +   do {
> +     struct post_form_part part;
> +@@ -2789,6 +2785,10 @@ int RGWPostObj_ObjStore_S3::get_params()
> +     env.add_var(part.name, part_str);
> +   } while (!done);
> +
> ++  ldpp_dout(this, 20) << "adding bucket to policy env: " << s->bucket.name
> ++                    << dendl;
> ++  env.add_var("bucket", s->bucket.name);
> ++
> +   string object_str;
> +   if (!part_str(parts, "key", &object_str)) {
> +     err_msg = "Key not specified";
> +--
> +2.40.0
> diff --git a/recipes-extended/ceph/ceph_15.2.17.bb b/recipes-extended/ceph/ceph_15.2.17.bb
> index 9fb2e722..4f32db0e 100644
> --- a/recipes-extended/ceph/ceph_15.2.17.bb
> +++ b/recipes-extended/ceph/ceph_15.2.17.bb
> @@ -14,6 +14,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://ceph.conf \
>             file://0001-cmake-add-support-for-python3.10.patch \
>             file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
> +           file://CVE-2023-43040.patch \
>  "
>  
>  SRC_URI[sha256sum] = "d8efe4996aeb01dd2f1cc939c5e434e5a7e2aeaf3f659c0510ffd550477a32e2"
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9200): https://lists.yoctoproject.org/g/meta-virtualization/message/9200
> Mute This Topic: https://lists.yoctoproject.org/mt/112081662/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


