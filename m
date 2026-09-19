Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E14AC982D8
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 18:25:00 +0000 (UTC)
Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17138.1789842290422427422
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 19 Sep 2026 11:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g6pNFi47;
 spf=pass (domain: gmail.com, ip: 74.125.230.234, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bef17c191so41393585a.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 19 Sep 2026 11:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789842289; x=1790447089; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TKgrPmyI2jheHOSWauKrYE+L0B5gwQ482UIngptFmo8=;
        b=g6pNFi47Nu8pThT8vRwUVsLKUBdoUwGQAINGh/bJTolAGLAZ4fI8c/6l/UWM3OONzl
         s7nmcjA0Xvl97aKHyrgmcsWhqIz1xrUbumIvKqT6vDeoy9TyrDU2xJkF1wMqYJLjejD4
         RVGqPtCrF6vwPTJiZA+sAQMv3W9/E9qrZ1smPIe8epmRA/AouAW0eww3SyF5GkPX9VlR
         2mldkBSNEYDinqbH5L+Y1zKpeGHEGRpc3UwVNqBp2KHP4WIPm+haeqDyH4QbwFDOhL/x
         vRnAlLbexulgN4p9dHa5GspRZpeRFH4t6w85LBJZu1OvNSLltx4gyBV0QWR+NdSL64Wb
         7i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789842289; x=1790447089;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKgrPmyI2jheHOSWauKrYE+L0B5gwQ482UIngptFmo8=;
        b=GnNQGLD+8QC7NLC/RcobY5/pPM5dWvNu/p6pTbJ0IaWIZHUfKHA9cBPWi+LToETZS8
         pCDKfb85W6oWtg4ZLZ+2jXI+kJbojR4oSNXX2tMPt8cXGkTVIkcyw2DU3cHeLnv46j0I
         zA+YCrlVVCioDt7ZWEkB+DZ4vL37xUtpTOj5zZ+6x8Hw1ZnfQeDUaJ2E19efqY7xUO/C
         ozSM4ugYiAmIulYGxnyi5Bc/Li0HbT6/twJustwCKnMB9Rh0zP2tR8LMO5GKy5kq0PDd
         f3qFgcEWtSeBYkojmHZUTWFgsXc+XaIOATiLl5kMFmiv/c7WYlTYUUhQmQ9iGhYJfvMJ
         p1Vw==
X-Gm-Message-State: AFuF++mnV5MutOPaA832wTAPXU8z5ZsXddAzZ/YXPel0djKcap0rC9nb
	tqG3UBEewINp6oRxPa4Di+ZGF/pF+VbdS1NabvqrH+Ns97sRMAjgL9HvMGjDgPsVFrU=
X-Gm-Gg: AYBFou0KfLN1/gwkREBTGdCCALB7epUxFGplem8iAzYYitD8H+MHDsR3DBl/nVHEU26
	sZ6B8qIFJ5lIlwrynS+fcbiZK2VDD84XMvZciYrzfdX2bDFoujAYFfBNOsnZ+Ocbb+n+lDiPvdZ
	N6gdPxY8HcwYTHupIRUMfwEtwfPYib4YwlWPD/qSgSd66YDXI4lkEXbWnzQIxN/LYrdBT7kLy1e
	j3G5HvFSHk4CCUa1QoApz6syWqpeeu2dNwjmG04zEmweXh7o7qYzCj+04x+2087ZblQxjyy5sf4
	d/ajQsVanmK9eINhH5pm5ogO+hxNUIrmzxqZI8becyRcS9cxWPEGhbkajYbz/EXnYYZAjyiOiMp
	Z2RBH0AbqXcZdWaoRweS7YIOK2/tQAVekX6uvIh4QDHWsSUEtXgddTvhJldZXFTILQo4nw2UdiO
	O6sKtRSLsVv3NcBkruP8iIQud2vE9bV+EJd2/TaEpfp22YZ+m94aXOh0sQtOZirlSRFIkkFzc1H
	5YgsjwLFmruHhYE0HYrmG9Y+4RO+kIPFow8afKOWvWAX6aq2HJIR8+aqO22di00lQz2lb/6ng/I
	nc8+5eqN5bSrDW3/gdJTo8+r0V1jfGZp35K1Y+5KY38rmpWDqRvxDbfzitDmLEgeQtFOmW7hfCR
	fCpOLCA==
X-Received: by 2002:a05:620a:439c:b0:93b:e9db:1bab with SMTP id af79cd13be357-93bf5795d5emr277007585a.56.1789842289119;
        Sat, 19 Sep 2026 11:24:49 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93befd5c2d0sm210924085a.4.2026.09.19.11.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:24:48 -0700 (PDT)
Message-ID: <6aaed370.03c0d5ef.138d32.2423@mx.google.com>
Date: Sat, 19 Sep 2026 11:24:48 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: royzah@gmail.com
Subject: Re: [meta-virtualization][PATCH] crun: provide virtual-runc and
 honour CRUN_AS_RUNC
In-Reply-To: <20260919173540.1602199-1-royzah@gmail.com>
References: <20260919173540.1602199-1-royzah@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 19 Sep 2026 18:25:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10088

Hi Royyan,

Thanks for the patch, but the premise it's built on is the one thing
I need to push back on.

`virtual/runc` (and its RPROVIDES sibling `virtual-runc`) is a holdover
from when meta-virtualization carried two runc implementations in-tree,
opencontainers/runc and docker's own. Commit 7d6284a0 (2017)
introduced the abstraction so a build could set PREFERRED_PROVIDER to
pick which variant was the C-level runc binary. Once the two variants
were consolidated (cb2d4868 removed the "opencontainers" flavor,
ea15fd06 dropped runc-docker), the mechanism lost its purpose. It's on
a path to removal, not extension, and I'd rather not add new consumers.

For picking crun vs runc as the OCI runtime of a container engine, the
layer's mechanism today is `VIRTUAL-RUNTIME_container_runtime` (plus
the sibling VIRTUAL-RUNTIME_container_* variables) set in the profile
fragments under `conf/distro/include/`. `meta-virt-container-containerd.inc`
already ships with `VIRTUAL-RUNTIME_container_runtime ??= "crun"` -- that
is the intended way to make crun the default runtime, and no bbappend
or RPROVIDES is involved. The bbappend churn you're seeing in
downstreams is a symptom of that pattern not being documented well
enough, not of a missing RPROVIDES on crun.

That said, the second half of your patch is genuinely finding a bug:
`CRUN_AS_RUNC = "false"` reads as true today, because "false" is a
non-empty string in both the shell `-n` test and the python
`if d.getVar(...)` expansions. That fix is worth landing on its own.

Would you resubmit as a smaller patch that keeps just the
`bb.utils.to_boolean()` normalization for `CRUN_AS_RUNC`, without the
`RPROVIDES virtual-runc` addition? I'd also skip the comment
rewordings on the RCONFLICTS line -- the existing comment reads fine
and reworking it on a bugfix makes the change harder to review. I can
take that version as-is.

Cheers,

Bruce

