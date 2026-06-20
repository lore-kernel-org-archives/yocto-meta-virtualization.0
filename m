Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6417CDB46B
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 03:42:45 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.514.1781926958956938562
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 20:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cLWN2Mrr;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-517de710886so20786771cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Jun 2026 20:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781926958; x=1782531758; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJfPcTw6ISGETYVLx55ossS/6ZjDwnUR0oTE8x50OUA=;
        b=cLWN2MrrEMVlqCEubgdaXtidgXFFYatvF7LxzvTqfFND8tox+hNRDYZhUOoT52jAIj
         Xz4cU/AAv7R9e/llliKJKPfWMg7woPETG+GEFg2KqEtC/FZWgaUqGmrF1AMAHfrWUNsw
         13c9Qq2H3s0dlE6A/CgGMnkmU4RcD4zTknKrOOOdUhVLVNX5TP81nYUND6On0YsJl773
         QFImK64AYToJPj2vZkYicZ2cL9dEvASd/ScIdv/o9rav6dyuqFxEgsioW/ddJzGVX4KW
         2wVtXXj2Y9qQ/M+qg3wYc6rzv9oqLATeYiN7BKb7DIT+zbx59aFWyqRUKeTJaOBGx0nq
         m9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781926958; x=1782531758;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xJfPcTw6ISGETYVLx55ossS/6ZjDwnUR0oTE8x50OUA=;
        b=OG/nJQj7V960QHoyDi7YSTP1rKloCgXZ46S4VRlwLQDl+Lp2M9Wr8A71k4gVCx/Gso
         4pDxJeFEfy+j/Bw4gyXZ0grE+pCofMKhyVRYEN93Lny3sfroAuNCL3xOs6SU0pysu6yE
         ni636dBmpII0IQndbildh9j90tr8I4w766w07qdJIjIw4ZcrwYLdvYmA1V1YO44FF0kG
         hRPXRUfW6C8kjE+8h3PwypoElE1YNEVEnwcPklTcCzPm/XSjUxdS70iiYSHOiXzLUfqm
         sgG64QrhynetAQIUz9Gd+c9c+XUlF398ClG0dajpF6Z87q/d98DA0uruSFNQGkLvqxxt
         8E5w==
X-Forwarded-Encrypted: i=1; AFNElJ/EnDo0Bk4zitGKMkEQTijAQ6LUepmzvy/rBP/wk2oM/GV0mhGCrHzIGx5Jbp50EMftypBp9LfSYlJAhrNCMGrng39x@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yx1Jkrpa+8GK7hrruIek61gvr2gCxl3GvcGRuKPwpTt0WYMQnob
	JlNYX1jBV5oeZh42LqGm8X73Z6K7tLYXNvl89YOWZCsDTk56wSH6mt5lX0UCl4X5
X-Gm-Gg: AfdE7cl7/UF1w2MUKO/Eu6YsbNwOwP0fCjBVaJuQxt8NhqIX1Y5rCG474rKuWfDzCDW
	gfsLAGkkaQ89I4k/YjTBGEvOpXM6p4N11yIaCUgGXskujpg+fBngMqmQVyNmmcnRaUSmikGVe+H
	NSKpVimNIxf3ws0xHuCAesmLJCiG7/0FDqn9zLZUDAf5NxOS13vg3yrGZpsqFUKmzDH4QeNh6DT
	e5KV/qpAKOcDdFjZ0cS6F7LqlXE8nEw4ZUBdQSCXXX1WZXnxSC+xQWmRmdPOlbaZDMXt8xdhN2x
	6h5WVi5vOTXP865gQQA5Ve9cTJQCWFiL0ArWeh+wzpRdNCEaT1mgbgFXsQ0KypfaMSrohxNPHKV
	iG9AoEuSLyuQyaauu3W32yvWd6e8x1G/ED/PpjyKi2VvFKy9c79yz6xOhJW7y3x+H5yr9lSDddY
	SXsonlYKMg6MgAoEI0GWMteNl9743RQNdogDIYB8ywXZ6oin4maJ5e7uB1WU4IM8f9mx2Fnk1UJ
	+G5awvrx9JrMx2IjG4eaqf87tEm+vivbfM2ScoQuBSJGUvEOXs5B/zZ3Beb0HCvvkgnO8oVJf3T
	djR9cHC9gtvAFg==
X-Received: by 2002:ac8:5a85:0:b0:516:e086:89a with SMTP id d75a77b69052e-519f0491881mr70093291cf.26.1781926957922;
        Fri, 19 Jun 2026 20:42:37 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df826927cesm20285396d6.41.2026.06.19.20.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 20:42:37 -0700 (PDT)
Message-ID: <6a360c2d.dfaa6ae2.184890.bc53@mx.google.com>
Date: Fri, 19 Jun 2026 20:42:37 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kraghava@qti.qualcomm.com, meta-virtualization@lists.yoctoproject.org
Cc: vkraleti@qti.qualcomm.com, anujmitt@qti.qualcomm.com,
 sbanerje@qti.qualcomm.com
Subject: Re: [PATCH v2 2/2] crosvm-image-minimal: add a reference image for
 crosvm demo
In-Reply-To: <20260613060743.3120135-3-kraghava@qti.qualcomm.com>
References: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
 <20260613060743.3120135-3-kraghava@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 20 Jun 2026 03:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9896

Mostly looks good. The "host kernel is the guest kernel" pattern is
honest for a demo, the dependency wiring (do_rootfs[depends] on guest
image + kernel deploy) is correct, and bundle_crosvm_guest is
defensive (readlink -f, install -m 0644, bbfatal on missing inputs).
README is concrete and reproducible.

Two minor things:

  - SUMMARY typo: "demo its uage." → "demo its usage."

  - KVM_MODULES:aarch64 = "" is identical to the unconditional
    KVM_MODULES = "" default. Either drop the override, or keep it
    only if you want the explicit per-arch line as documentation
    of the "kvm is built-in on arm64" fact.

Bruce

