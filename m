Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A527C54F54
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 03:17:29 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3457.1785295039711440263
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 20:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aOkroguo;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8f0d6853360so3501086d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 20:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785295039; x=1785899839; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13R8YhOC0LQ348jSu8fKULAKi4G9BxHFPX0CDdBCcTM=;
        b=aOkroguoCTpEBl4pUjqN01mbhw6VqRlSWIHan1CpN1Lx+wwFlq2CXJdnbO21gI6uQc
         /dnJWHoc9uPp0xQs5Cf31NEq6YjJ6M488lmYIRiYlfywFF8QGo3Oln6qcemhS0ymjS/0
         ePt4anOYZzSeP8ih1xDDv2TyffLur76R/R8phBzdAuQ5bdiAoFRD3GogVj32C5UTx8aI
         tuF6rX0w/7Ex+Agvxl9zTFxgN18DXlJejYavWv+1Nthpj989KwCYC2uRkapJyy8U+c4e
         4xOpzRPVzcdMRoXj1Yt36dFH/dIKaOo+NXXmyIvro/Vmqq8zKd2wPXmOrRwUAfPOAabP
         WDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785295039; x=1785899839;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13R8YhOC0LQ348jSu8fKULAKi4G9BxHFPX0CDdBCcTM=;
        b=O8G0Jn1siFO/IUBhqH8fphYmj/A0VQk100vcAiaS3ix4KGOzQ9yUF5oOTfIr+VFkjV
         cRh7SLCGUNuj0ZmpYmRmiNLhaCl+SlL3Gm+3Lq+5X73RGA1y+bWpPLqU1Gk7Ga3pke36
         JvhmvC/4t65Kwx2CaB/B2R4EKgEnNdx0loFwQmv1p4znzF8noXrbsZ+6JXOxDdkx5HMj
         fdQVXSy86DgjcAY0Lg7kGw+KhXW7tN4CNZKH/EXpMakeEjmxk3/F3XpsTDL76NqWkwXa
         o4XbLM8TU7zsBzk0RIYT1Z4Pu7+UnpImp+/QkDgUymMGjYDZmr4ofu00wKhMhdQ855yU
         1NpQ==
X-Gm-Message-State: AOJu0YwVgoTtcjk6I99t1JfK+DlqGinPt5D7Y1ACNxDS2NXJsbAWT33S
	Ea3hEXrIzE9S89MaRnB88WNcY23ShGVlaoAWtn8frmTWeW2McQUsm0Ws0rPbaH9a
X-Gm-Gg: AR+sD13fYPI4HPyx8gCB7zDE8UDf8dl7r71r/NZxcrDJqH/AkLH4RJJVtuJSsKTYp8N
	7n3EHfJ25GN2uPFWWTx/Gx8q+9JUw1YU/ylvjdDESjmgRlj1pbze84Zd/5bOX3tqFhXDg0wMop/
	K4niMDVmZXtSzQltXP+J75vr31QB5F4fIUdcM07Clx+FgnsbksospSrlHVhfAWWsGXbSasQwM18
	Yx+USjfiHfYuaD+li3bnB7A+MQxXT2WOm7G5dEITZhUjjHXhOc/oteu+Y0hLUNTSR6/yD2euVoZ
	zKYDCJhab7hJCOTbK4j32tVr5f40M+7ZY9wTepzHDYJdFxNdOeACAOX/7ryei+sRBsuK0ZcxzgZ
	ZVVllE9wasnxJPMSi2TOnYSEDHMy1CyNoF+sKaWIZJWgXcbbqlppDWCzck5WDEk3XDRQB9dGNxD
	wS7NE97lAPRgOrjAQZeFF97mlLEPEE9jvI8ow0KyAIEirrmKCpL7TtAPIsY9J//3VcfZ3l9/JvA
	0smyO3NGaxHwejDKy7/DZTkza6v0cSjRJg5elsp0eSgUnkfDO0bAXhjIz5AqDcGNn3dzXFKEL9G
	GpxWmLSwdI68+a2FVzvHvgP4ZraKlF1yCkxTbbFyQ9mNkWV1DEiodV7E/bJq2w==
X-Received: by 2002:a05:6214:3bc1:b0:907:8a7b:cf2e with SMTP id 6a1803df08f44-908173962e9mr49499916d6.58.1785295038369;
        Tue, 28 Jul 2026 20:17:18 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dc45bb5sm14580606d6.2.2026.07.28.20.17.17
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 20:17:17 -0700 (PDT)
Message-ID: <6a6970bd.406b8c64.14ed61.8fa1@mx.google.com>
Date: Tue, 28 Jul 2026 20:17:17 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 2/2] image-oci: drop *-initial
 sysroot deps in do_image_oci to avoid libgcc collision
In-Reply-To: <20260728115516.1107990-3-koen.kooi@oss.qualcomm.com>
References: <20260728115516.1107990-1-koen.kooi@oss.qualcomm.com>
 <20260728115516.1107990-3-koen.kooi@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 03:17:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10014

Reviewed but holding this one for a bit. Two things:

First, on the fix mechanism: the analysis in the commit message is
convincing and matches what oe-core already does for do_sdk_depends
and do_populate_sdk_ext at staging.bbclass:457 (same "*-initial" skip,
same reason).

If that list of tasks was extendible, we could add do_image_oci to it,
but Richard wouldn't think it was a good idea if I tried to bury a
meta-virt task into that list :)

BitBake's python-function :prepend/:append doesn't help either -- the
mid-loop condition operates on setscenedeps built inside the function,
not on anything we could pre-filter via a prepend body. Prefunc +
BB_TASKDEPDATA mutation looks like the only path that won't need to
be updated as bitbake/oe-core change.

I'm testing a smaller-footprint variant of the same approach -- same
idea, same event-handler attachment, roughly 15 lines without the
deep-copy (setVar with a fresh dict is enough since
extend_recipe_sysroot re-reads BB_TASKDEPDATA on each entry).
Body/mechanism identical to yours; the trim is stylistic.

Second, and this is what's actually blocking: I haven't managed
to reproduce the raw abort locally. From your cover letter, it
doesn't sound like you are there yet either ? Without a repro that
fails on stock and passes with the fix, all we've got is "the code
path runs and does what the comment says it does" -- which is true
but doesn't prove the payoff. Eventually that might be enough, but
I'd like to try a bit more.

Two questions to unblock:

1) Can you share the specific recipe (or the DEPENDS shape) from
   the downstream build where you hit this deterministically?
   Something along the lines of a multilayer packages: layer
   pulling a from-source-compiled library with a boost-ish
   DEPENDS, if I'm reading your cover right, but I'd rather work
   from your actual trigger than guess.

2) Was there anything else in that build environment worth
   knowing -- IMAGE_PKGTYPE pin, non-default MACHINE, a specific
   PACKAGECONFIG that pulled in one of the *-initial-adjacent
   recipes? Anything that narrows the search.

I'll try a boost-multilayer-packages recipe over several clean-sstate
cycles in the meantime and report back either way.  Once we have that,
merging this (in whichever variant) is easy.

Below is the shortened variant I mentioned -- meant to fully replace
the two python blocks + the comment header in your 2/2, drop-in on the
same insertion point in image-oci.bbclass. Same mechanism as yours:
event handler on RecipeTaskPreProcess attaches a prefunc to
do_image_oci that filters *-initial do_populate_sysroot nodes out of
BB_TASKDEPDATA before extend_recipe_sysroot walks it. Differences are
stylistic -- no deep-copy (dict comprehension builds a fresh dict
directly), set comprehension for the drop set, comment made smaller.

Not requesting a v2 on this; posting so you can try it against your
downstream trigger and see if it holds up the same way your original
does.

# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
# Work around libgcc vs libgcc-initial sysroot collision in do_image_oci
# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
#
# do_image_oci[depends] contains "...:do_populate_sysroot" entries, so
# oe-core's staging_taskhandler auto-attaches extend_recipe_sysroot as a
# prefunc. That walk exposes the full transitive populate_sysroot closure
# into this recipe's private sysroot -- including both libgcc and
# libgcc-initial, which collide on crtbegin.o.
#
# oe-core's SSTATE_EXCLUDEDEPS_SYSROOT (".*->.*-initial.*") is gated on
# the consuming task being do_populate_sysroot (see setscene_depvalid()
# in sstate.bbclass); for do_image_oci that gate is False and the
# exclusion is skipped. extend_recipe_sysroot itself has a hardcoded
# "*-initial" skip but only for do_sdk_depends / do_populate_sdk_ext
# (staging.bbclass:457) -- an oe-core task allow-list we can't cleanly
# extend from a downstream layer.
#
# Filter *-initial do_populate_sysroot nodes out of BB_TASKDEPDATA before
# extend_recipe_sysroot walks it. extend_recipe_sysroot re-reads
# BB_TASKDEPDATA on each entry, so a setVar with the filtered dict is
# sufficient.
python oci_strip_initial_taskdepdata () {
    tdd =3D d.getVar("BB_TASKDEPDATA", False)
    if not tdd:
        return
    drop =3D {k for k, v in tdd.items()
            if v[1] =3D=3D "do_populate_sysroot" and v[0].endswith("-initial"=
)}
    if not drop:
        return
    filtered =3D {k: v for k, v in tdd.items() if k not in drop}
    for v in filtered.values():
        v[3].difference_update(drop)
    d.setVar("BB_TASKDEPDATA", filtered)
    bb.note("OCI: dropped %d *-initial node(s) to avoid libgcc collision" % l=
en(drop))
}
oci_strip_initial_taskdepdata[vardepsexclude] +=3D "BB_TASKDEPDATA"

python oci_attach_strip_prefunc () {
    task =3D "do_image_oci"
    if task in e.tasklist:
        deps =3D d.getVarFlag(task, "depends")
        if deps and "populate_sysroot" in deps:
            d.prependVarFlag(task, "prefuncs", "oci_strip_initial_taskdepdata=
 ")
}
oci_attach_strip_prefunc[eventmask] =3D "bb.event.RecipeTaskPreProcess"
addhandler oci_attach_strip_prefunc

Bruce

