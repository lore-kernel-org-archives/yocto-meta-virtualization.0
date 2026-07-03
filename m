Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBA0C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:27:37 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95631.1783092449598233917
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 08:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lv9nm5z/;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37df416c44bso585584a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783092449; x=1783697249; darn=lists.yoctoproject.org;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:content-type:mime-version:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4OKKOxTChy3+xFMHjPe9Og93LK1SwMXctfD+vU09zvE=;
        b=lv9nm5z/xD6GyNcxijO7d+NdGsl9As5Sph+v6pVbLB3XKQhfm709SDBYdtr3pGXE0m
         bfa5NAcLndVP6hlnRVnpyl0rkGf08z+ShjWEKuN41Q9qH/TPo+LMTUXPb85edJl1OCxV
         WYL7hrDXv/kbsqwBUhjU3H86hxXUKuKio91p5QoYC6I1pSg11ywQrUMi1JPWoYJXtSt6
         8VxCUFW9I6M94rtMjOQz/S0b5O7mIIxnPguwx1y9lWMvgh8VuhEKtImF/Qfx7OWfAPn5
         8+9czjNxNqlqQlXbQglIuTn62K+oTrtNzCnrUbmnOshot5lQkOqqThfxH1O1PrNJ1dzN
         vJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092449; x=1783697249;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:content-type:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4OKKOxTChy3+xFMHjPe9Og93LK1SwMXctfD+vU09zvE=;
        b=C+GSEj20rpY68w+n3RLFHLk/rQfeTgSOUFdkUv5Bi2rHEVhY/6bDYPx+PpFd8NHiR5
         aUMqsn6uKbObUrrBC1IwfeSoEaqYh9Ysa9DzL7I2hlzMilqJ+axpe6q7wpfZysUy4Zdq
         RPpMig6RoQ6gMt2dRsTGqzh9Mc+frVcad0yLJud+SAS6PdD6CWH1hapYvb2k2ehOhCnY
         7j79zGPIJhM3WIffH2oejXsnhpxvITzqhFKo72bBxTAPLjs0BcyZYhKvfoJ43NFtngwv
         s78lxt8FbatbFWrKaPcBLyhQMEpZhSGPRx6XMTYCxa85lnQdZIEDjnbNhLnteiV0yrX9
         f6Gw==
X-Forwarded-Encrypted: i=1; AHgh+RpbqLtsVIcvjxCsZVoe8c1hMzGfV0rxeeAnqXyYqi8jXbV0vNha5FXnygNYihFZeOEvni6Hn9aK0GrJgKUgqK8Kg/cv@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxgumkAM8SzEJnxggi7epaeqCY/3aRSUT7ZQlHZt7cVYGn/ZjyP
	bHB+GF8OlTpEFeP26XYOCIGGdbxcu1JqOpOeTLawA9XE91eT92HKi/v/
X-Gm-Gg: AfdE7cn0AMV2vUaTel7SqeowhiO2vmAYGFQQyHkS712ChrG4X6gCNHSVwWc3Iv+m+Wu
	/7XubqjT4djSC9mq5+GI6dwJ9s7iwG7A/wVR/w/9j3leTrE38L8umNUmVGJibjWY6YgcWu0qNHi
	jWT4nrzNLfzz+Sq9ls5eqDgzMZ/BAqyesV34hkoJ9U+Xb03bRu170av6MwuQwt8EPfpkhur783W
	4hWy2VbFcLr9A7Ofwr0S5o7BaEwxQ9gOPryHQ39S9P8mWYAMazvHgiXBR8CQ3nbvFK4sjcxl6Oh
	GnX+v67kBvk+zg1kzo4rx3cqryNAjgQ6hh+xO0wdrFoaWC/VusHuepKA+JsYwXTyam4d3k8cotC
	zRmqSVqtYcHEGP6ntAjvyB+9mcKnF9lSqlatTmaMMWWaQVdmzSK5IQzffQJZ/Trmvq5sfLvu7Z2
	OBATtVA1kY8/HMHRgikbbDHX5yUTQMfCMb7WUYDI/2iIfpfw==
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr40308a91.4.1783092448651;
        Fri, 03 Jul 2026 08:27:28 -0700 (PDT)
Received: from macbookpro.home.local ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812801eb5asm1119623a91.9.2026.07.03.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:27:27 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [meta-virtualization][PATCH 1/7] classes: add
 container-nonroot-user.bbclass
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
In-Reply-To: <6a2c39b9.af142770.352616.063b@mx.google.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
 <3067d13e8e08136d3e8af275a4e501589f8a38a1.1780104071.git.tim.orling@konsulko.com>
 <6a2c39b9.af142770.352616.063b@mx.google.com>
Date: Fri, 03 Jul 2026 08:27:26 -0700
Message-Id: <178309244647.29524.5128328472101493920.b4-reply@b4>
X-Mailer: b4 0.16-dev
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 15:27:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9917

On 2026-06-12 09:54:17-07:00, Bruce Ashfield wrote:
> Hi Tim,
> 
> A few things on this one — none of them blocking the intent, but worth a
> small follow-up either as a fixup in this series or a v2.
> 
> On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> 
> > For secure and production environments, we want to run containers as a
> > non-root user. Some applications, such as Python, require a $HOME
> > directory with proper permissions. Because OCI_LAYERS :directories:
> > copies with 'cp -a --no-preserve=ownership', we need a fixup function
> > to create the proper permissions and ownership in a new raw layer.
> >
> > The behavior here is inspired by dhi.io/python:3 (Docker Hardened Image)
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> 
> The non-root + DHI-style image is a real gap in what we ship today;
> glad to see it filled.
> 
> > +inherit extrausers
> > +
> > +NONROOT_USER ?= "nonroot"
> > +NONROOT_UID ?= "65532"
> > +NONROOT_GID ?= "65532"
> > +
> > +# ---------------------------------------------------------------------------
> > +# Create the unprivileged "nonroot" user (uid 65532, group 65532)
> > +# ---------------------------------------------------------------------------
> > +EXTRA_USERS_PARAMS = "\
> > +    groupadd -g ${NONROOT_GID} ${NONROOT_USER}; \
> > +    useradd -m -u ${NONROOT_UID} -g ${NONROOT_GID} -d /home/${NONROOT_USER}  ${NONROOT_USER}; \
> > +"
> 
> This hard-assigns EXTRA_USERS_PARAMS rather than appending. Any image
> that inherits container-nonroot-user AND wants its own extrausers (e.g.
> a recipe that needs an additional service account) loses whatever else
> was set, and the order of inheritance silently determines who wins.
> 
> Suggest:
> 
>   EXTRA_USERS_PARAMS += " \
>       groupadd -g ${NONROOT_GID} ${NONROOT_USER}; \
>       useradd -m -u ${NONROOT_UID} -g ${NONROOT_GID} \
>               -d /home/${NONROOT_USER} ${NONROOT_USER}; \
>   "
> 
> That way the class composes cleanly with anyone else who sets
> EXTRA_USERS_PARAMS earlier.
> 

Good catch and suggestion. Applied in v2.

> > +# Make sure we can write to e.g. /home/nonroot/.python_history
> > +# using :directories: in OCI_LAYERS does not preserve permissions
> > +fakeroot fix_oci_home_perms() {
> > +    cd ${IMGDEPLOYDIR}
> > +    image_name="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}-oci"
> > +    layer_tar="${WORKDIR}/oci-home-fix-layer.tar"
> > +
> > +    rm -f "$layer_tar"
> > +
> > +    python3 - "$layer_tar" <<'PYEOF'
> > +import sys, tarfile, time
> > +
> > +layer_tar = sys.argv[1]
> > +mtime = int(time.time())
> > +
> > +# (path, mode, uid, gid)
> > +entries = [
> > +    ("home",         0o755, 0,     0),
> > +    ("home/${NONROOT_USER}", 0o700, ${NONROOT_UID}, ${NONROOT_GID}),
> > +]
> 
> Two things about the Python heredoc:
> 
> 1. The 'PYEOF' delimiter uses single quotes, which would normally suppress
>    shell expansion inside the heredoc — but bitbake expands ${NONROOT_USER}
>    etc. at parse time *before* the shell ever sees the body, so the
>    expansion does happen, just via a different path than the reader expects.
>    Worth a one-line comment so the next person doesn't try to "fix" it.
> 
> 2. While the values are simple here (alphanumeric user, integer uid/gid)
>    it's fine, but if someone ever sets NONROOT_USER to something with a
>    quote or backslash, the Python source is no longer well-formed. Since
>    this is a meta-virt-internal class, low risk — but a comment
>    ("NONROOT_USER must be a bare identifier") would protect it.
> 

Added comments for 1. and 2. in v2.

> > +    umoci raw add-layer --image "$image_name:${OCI_IMAGE_TAG}" "$layer_tar"
> > +    rm -f "$layer_tar"
> > +
> > +    rm -f "$image_name.tar" "$image_name-dir.tar"
> > +    ( cd "$image_name" && tar -cf "../$image_name.tar" "." )
> > +    tar -cf "$image_name-dir.tar" "$image_name"
> > +}
> > +do_image_oci[postfuncs] += "fix_oci_home_perms"
> 
> The repackaging step at the bottom assumes do_image_oci's output layout
> (image_name.tar / image_name-dir.tar) is stable. If image-oci.bbclass
> ever changes its packaging naming, this silently produces a broken
> tarball — there's no error checking against the assumption.
> 
> A defensive option: stat the expected files before rm -f / tar -cf, and
> bbwarn if either is missing rather than recreating from a possibly-empty
> directory. Or, if there's a helper in image-oci.bbclass that already
> does the repackaging, call that instead of rebuilding by hand.
> 

There is no helper in image-oci.bbclass, the repackaging is handled in
do_image_oci(). Added logic gated on OCI_IMAGE_TAR_OUTPUT to detect the
presence of $image_name/index.json and throw bbfatal if it is not found.
We could bbwarn, but I think we should fail loudly.

> Otherwise the series looks good — I'll keep going through 2/7..7/7 and
> respond per-patch as I have specific notes.
> 
> Bruce



