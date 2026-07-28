Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8BAC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:37:39 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1931.1785260252166314605
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zx3gi9/c;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bf9466867cso22206e0c.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785260251; x=1785865051; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KbBXa5FEddoXkJlDuRYGtHwa108VCdrQE7fR+0heczA=;
        b=Zx3gi9/cybrjMXxTkxWqZwuIz4Kw+X+CV8haN3NBvqIiIuG3IUie4ldmdYxi+1421+
         K3UgxU7jkFhsgMSRwCc73yIT/1hf6BKPd99jsLGtaY0y4FmwY/X/PtDP/hzn7HzNYgXS
         WyboEQbUl4Nw1Q0y6BO9mwfT+s59r+Ax6wXrcXQDTBxmxJzlhEf0znoRHBkGtqkKZsjC
         IyaCVtJoWwxQF0hmtujfSkRsCatEkDGqqOIMp7sdM9PlB5LFpV1oHwnO4nsUos91i+hT
         jZ8Ucjmj1/RYcBOl+r9Ul20DMFAN29VW2eTDlH7sLVu1FIJnxHzDFxl7XTxKf0Eyj5G/
         Qprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260251; x=1785865051;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbBXa5FEddoXkJlDuRYGtHwa108VCdrQE7fR+0heczA=;
        b=mkLLwV9m2goaFJJQc2QgyEhwzIUcHnlhrvFMFnXNgffgN4EmhDJ/pcqR8RhjcYWBtl
         tf2ouO8IJQFKLtvKl7e2KXTiuYYwwnltjuK3DHNpBWtY6Ws3vEz0dP2dU6HixT2lN7FB
         /RajVMefa9dLl4OYMlmwuspcwyIPNJphKF9Mr4G44PN6q+VPAC1krOrMkGZUihFbvD1W
         vhIGFe+3PNNlB30P4DqqFoGv/0XMOKVHf3kjfmhXoPPHdbcR8W6LUmuTw7GVSckNfnkx
         6T+9KTFZ+0AXkYBWQbhyBKgWWBrebKov4RwE2nilIRZxtsJOLH2Bh/buSqknSjB4x02n
         bNQg==
X-Gm-Message-State: AOJu0YxjNmsOfUIKuzX8gsV1+oxr4bcdSkPjJU+Pf1YwqvYwcAGy/qj5
	ec7FluawdxS/AiBoeF2Lbqk64oVblMrJarZiElcq8JqcnNV7wfKsYOq85Y/hUzZ6
X-Gm-Gg: AR+sD12RDRPt/PPNpGbiMFa6u4SewS439PSOQIYqkhBLUpOIrcE2aDPYWBXYsr4cCtd
	vH1wJl+zqN85+mKBn13SstEh26VE7OLGudPiA7SOkewbFjpYEQe7IS+Wxcmh9dOQFtuSUyTiWKN
	tKH2c2zHZmT9wQEuhy4Xu8LH+vW3faE3VBYSOvOTcgkuX+TwP7NsmM9EJjYdkBIjToXi3wiuIVE
	LPQxJ8sCrxfAiqeT6wTzPyNkkoTPK/nafvK/O60iQ4Bppoxgev/dwJ29RkRz+j/Q3LYoFdI2PzP
	SUa21XKCX1s9lig/vXzly4bkM2qIbHYSBochox4jU9gwJgid2BR9vq2SdRv/XtLR8jOHHOm5+0T
	O3yPpQBWS/FiHR4wnA/5rCtGUte+4KwtYv3wqAmRqSyhUi5zTmU/tITLyDZG2Z3AtIXZpDG68Ry
	adnIapXxf5XMZh5OUpTgoZDh72G/Gg5mKi8QcLp7Gzeq5BF0h5Hr6S/VkTPHeeC5wQu70XQYQbJ
	6w++T/TBSJaGBvXZcdqjhtFwGgCjVcGlJryOnhYP9lDzff6RJoUKfjDzq2TjLX/wpO/HICyiU96
	fO4=
X-Received: by 2002:a05:6122:f92:b0:5bd:ddab:59a7 with SMTP id 71dfb90a1353d-5c33fa33b02mr1574164e0c.10.1785260250992;
        Tue, 28 Jul 2026 10:37:30 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c34f14b121sm7149e0c.12.2026.07.28.10.37.30
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:37:30 -0700 (PDT)
Message-ID: <6a68e8da.c40671ba.2ba795.19ab@mx.google.com>
Date: Tue, 28 Jul 2026 10:37:30 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [PATCH v1] crosvm: replace monolithic DEPENDS with PACKAGECONFIG flags
In-Reply-To: <20260726202028.509096-1-kraghava@qti.qualcomm.com>
References: <20260726202028.509096-1-kraghava@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:37:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10002

Thanks Keerthivasan — this cleanly addresses the TODO we left in v4 and
it's pretty close for a v1. A few questions before I take it; so let's
do them in a v2.

1. protobuf-native

   The old DEPENDS carried protobuf-native unconditionally, and the
   new base DEPENDS drops it without mapping it into any PACKAGECONFIG
   entry. Please confirm whether it's actually unused (in which case
   removing it as dead weight is fine — a one-liner in the commit
   message noting so would be great), or whether it's needed by a
   specific feature (in which case it should be attached to that
   feature's PACKAGECONFIG line, not left dangling).

   The test you ran ("default PACKAGECONFIG boots on x86-64") wouldn't
   necessarily exercise this — if some non-default feature (GPU,
   something else) pulls in protobuf codegen via a build.rs, that path
   is off in your test. A quick check with `--all-features` (or the
   full upstream default set) would answer it.

2. config-file in the default set

   Upstream crosvm's default features are approximately:

     ["audio", "balloon", "config-file", "document-features",
      "gpu", "libvda-stub", "net", "qcow", "slirp", "usb"]

   Your PACKAGECONFIG default is "audio balloon document-features qcow
   usb libvda-stub net slirp" — i.e. upstream's default minus gpu
   *and* minus config-file. GPU-off is deliberate and explained; the
   config-file omission isn't. Is that intentional (and if so, why)
   or an oversight? I'd lean toward matching upstream on this so our
   "default minus GPU" claim is exact.

3. document-features in the default set

   document-features is an attribute-macro crate whose sole purpose
   is generating documentation from feature declarations — it's a
   build-time doc helper, not a runtime feature. If this recipe isn't
   building or shipping docs by default (and it isn't), enabling it
   by default doesn't serve anyone. Please drop it from the default
   PACKAGECONFIG set. Keep it as a PACKAGECONFIG entry so someone
   who does want the doc build can flip it on.

I'll wait on a v2. Everything else looks good.

Bruce

