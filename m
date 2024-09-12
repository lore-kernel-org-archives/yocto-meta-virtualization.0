Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45731EEB58E
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 11:00:52 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.45234.1726138845354425967
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Sep 2024 04:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W3wzrYH+;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5365c060f47so941902e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 04:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726138843; x=1726743643; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCVQPJVMRZzMo1euqeLPchQBC8zMLj3zQ5R88+NknQ8=;
        b=W3wzrYH+q9iQGBovCNo1wWp34FLwzxxgk2C/qWtKeEuXyPU8rflAukTC9TO0dc1KvK
         /vIAo/CssPVDiwY+8sGNvBJ4EziEM+IYFBE+1zz+UXeM1d7tybP9a/ajwnvezImtAuoR
         HFAfxOUyFzJKu9k+Zpx65w412MZXKiAHcRO3Ts0ls/pfjqCGcQe47lGB5SaAdVb0Q8Cc
         CAWQbT95ePqaXppxUh8QunRQaYeVis2wVXBHP5MJmCxul1v8ihZQRiroGI4U34Ukl/bC
         08PGBZMTx3qMcj1QOU1NNrteIcf2KKtAFReEPU28zsJA8odTpMQE6sXaHf9KP9sc8PxP
         mjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726138843; x=1726743643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCVQPJVMRZzMo1euqeLPchQBC8zMLj3zQ5R88+NknQ8=;
        b=ktPkVNlzjmPN3diiQ6IBKPISVUehehOraeI8Hs/mUr5It81ZxX4iTy0cD7Kg7HQ4ph
         AGbBiENqyb5WR9d33+Vn1XJdBpviHSL/DbryIZ0HAmw9+BNbuSaruh0h3bbA3nXros6O
         7zlW/FIUDTTi9/efKQuXPgTZHW5OAnbbkD8e/Be2D4j+lJwKU16bmJ4sw7Bs4Km08yC2
         fJmysdne1N8eU+QJkwu7D8+x1efOmYWYVqwHYDyAPz2VgeU5qS3HMU+2gkkFsTruZXUK
         GxuN+r0wgFBIma35MeSKgsh0BDN1tW1+ZmyugwdDTjPIAtokkO3CrB8oCIj7utyRahfs
         tayQ==
X-Gm-Message-State: AOJu0Yx2sPR8BVKCJg2/eD4h+IG+A8CzT4rTzXxj2U3TSSr7/wmFnBwa
	/u9pKnaB6rRl+aU9oqOzIGWhNJL6a3G75UxsMIkgUwPHlEfa9U5C63xulHSbJqb7zSVz3usYN5W
	OYaEeupRxTiNzabObe4LCoc0H15c=
X-Google-Smtp-Source: AGHT+IFzgrb27w5ivSIV56lUJyPyPczt2oIgVGXsdijQ7LODWUFIRLFjJicPzpXJ1PAsczY32vGURRabaP347Cyzn+g=
X-Received: by 2002:a05:6512:230a:b0:530:e1f1:8dc9 with SMTP id
 2adb3069b0e04-53678fed1b2mr1141236e87.46.1726138842406; Thu, 12 Sep 2024
 04:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240912083239.237361-1-f_l_k@t-online.de> <CA+chaQfdVmLsJD3WL_O8YiJ9urPvgwiHO82=48rBruRcw9-PWg@mail.gmail.com>
 <A7ZOJS.J4CMW0BLYVKO2@t-online.de> <CA+chaQeJoEypkzx7rBxW7mBFDYtyFKSr37Fm4CVvwMiM2cj6Pw@mail.gmail.com>
 <SG4PJS.15GM9H9ULONU@t-online.de>
In-Reply-To: <SG4PJS.15GM9H9ULONU@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Sep 2024 13:00:30 +0200
Message-ID: <CA+chaQc_U+y+hVm7Rp5r7TKOAA5EwzntnC+frCvd-m+45W2VHw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-%.bbappend: fix compatibility
 issue with linux-intel
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 11:00:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8891

I see, the .inc file adds the +git suffix to LINUX_VERSION.

https://git.yoctoproject.org/meta-intel/tree/recipes-kernel/linux/linux-int=
el.inc#n15
PV =3D "${LINUX_VERSION}+git${SRCPV}"

Not sure what's the best solution here, all are a bit fragile.

Using LINUX_VERSION for both might be safest (as it will add the
include only for "sane" combinations and then add "sane" version to
yocto-cfg-fragments dependency.

Using PV + LINUX_VERSION now or PREFERRED_VERSION + LINUX_VERSION
before leads to these mismatches.

Lets see what Bruce thinks.

On Thu, Sep 12, 2024 at 12:42=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> I see, thanks for the clarification. After looking into this I can say th=
at in fact
> the issue was caused by this commit:
> https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dc02af947316=
31b3432b8ddee2b89761ab32530ee
>
>
> It fails because meta-intel missed to set the patch version in LINUX_VERS=
ION in linux-intel_6.10.bb
> https://git.yoctoproject.org/meta-intel/tree/recipes-kernel/linux/linux-i=
ntel_6.10.bb#n16
>
> changing to LINUX_VERSION ?=3D "6.10.0" fixes the issue
>
> On Thu, Sep 12 2024 at 11:32:52 AM +02:00:00, Martin Jansa <martin.jansa@=
gmail.com> wrote:
>
> That's weird, these LINUX_MAJOR/LINUX_MINOR are used only to include the =
.inc file in: recipes-kernel/linux/linux-%.bbappend:include ${@bb.utils.con=
tains('DISTRO_FEATURES', 'virtualization', 'linux-${KERNEL_META_TYPE}_${LIN=
UX_MAJOR}.${LINUX_MINOR}_virtualization.inc', '', d)} while yocto-cfg-fragm=
ents dependency you've mentioned in the error is added based on PV now in t=
his .inc file: recipes-kernel/linux/linux-yocto_virtualization.inc: return =
"yocto-cfg-fragments-%s-native:do_populate_sysroot" % pv So I think your fi=
x only prevents either of these to be included: ./recipes-kernel/linux/linu=
x-yocto_virtualization.inc ./recipes-kernel/linux/linux-yocto_6.6_virtualiz=
ation.inc ./recipes-kernel/linux/linux-yocto_6.10_virtualization.inc and no=
t only for people using meta-intel, but for everybody, because there is no =
linux-yocto_x.y_virtualization.inc at all. That doesn't look right. I think=
 "oe.utils.trim_version(d.getVar('PV'), 2)" should be improved to strip tra=
iling +git as well or maybe to use LINUX_MAJOR/LINUX_MINOR instead of PV in=
side the .inc file. Regards, On Thu, Sep 12, 2024 at 10:48=E2=80=AFAM Marku=
s Volk <f_l_k@t-online.de> wrote:
>
> On Thu, Sep 12 2024 at 10:36:04 AM +02:00:00, Martin Jansa <martin.jansa@=
gmail.com> wrote: Wasn't this fixed by https://git.yoctoproject.org/meta-vi=
rtualization/commit/?id=3Dc02af94731631b3432b8ddee2b89761ab32530ee ? I have=
 meta-virtualization layer up to date, so it includes this commit, but was =
still hit by this problem.

