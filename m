Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.31117.1630983969138161893
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 20:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eSk73Vul;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id ia27so16795570ejc.10
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Sep 2021 20:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l5sleBGXLS3k/lXTJWTDCTICfnQTP8cBy/r9t2h4ZTQ=;
        b=eSk73VulgTQXKvTMqSt+D7RVTXCTp0yX9Z81tX5HBU4AIXUBf4ahSc2GX5FGSoeKJt
         TqlhmUHcZ6bVGbZBIq7ANLZU4guFyfXtjM3Z8TdKjAb4kXFaWgMfnHLtguOW/MmvSCyQ
         2bKn71FbkrqRpFAr3QUrX3t31FT3BlXIgSaeezgJJcI0q3Ju5eYL1gb/Rhkz9g8ksSmd
         wzE2eWOAKlcCsPP6gcR9/UwLvHwV3lmrsLMxbWjza3ohOvFUTkBkNGg9UJaGVGIDqGCg
         g1OCcSoySfAOEFoDPql0mhC7GXXMBrXh/1RsQN53zlTg6/kTSPpezNkp15o0dxP/CTIN
         APxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l5sleBGXLS3k/lXTJWTDCTICfnQTP8cBy/r9t2h4ZTQ=;
        b=OXFEFt4YSyBIB6q8Qe5JzWgd9yIqa5FNyzNqD5OWfEmT4mT+1+PHFfR1DHNnTAbxx9
         /+f46jVoAcbLCIYvc5aVxPf2klv6dKof3JcdS8Sw5+DfsoqZOCCsQ7TTE7gHiIRqVU7i
         afUoKZmTP6YA42aqVfK7tCtTKGaeYBCRl4HgqONbuUGfloSzjgifx8BcAZdG64L4B8iz
         +6rIdv+RhOhap3egJL0Jcqdgtsy4500Qs0/p7u2RDlBK7j50yWC/FyztFnhZbrFEZp4x
         j+d8/gMcaad0ZVAqPWj6Q2AsI0NYaDTUavEHadMPoOJ4ItcvMXpk4Kg3yPnRg2NUs5Wd
         ek3w==
X-Gm-Message-State: AOAM532ylvfob20ieWhHoT1UwxTj07iRTAuoc+dZk+cLEZmrbJIEYSMN
	JElWPFMt6ZP5RTRCmsE+iUUY4Wr4ThoETAULAX0=
X-Google-Smtp-Source: ABdhPJwhYkL0WZVMrnlPnwsorTbGCtxCcMJq1d8/mGSlnOd2sIg5d5tV+LaAyd7TpCGrvNL+vMxGJ3ULyUHnOf8ltRU=
X-Received: by 2002:a17:906:f111:: with SMTP id gv17mr16510224ejb.315.1630983967474;
 Mon, 06 Sep 2021 20:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210906080510.28468-1-mingli.yu@windriver.com>
 <20210906080510.28468-2-mingli.yu@windriver.com> <CADkTA4OJ1XKrGkUvbUCW6AyoGwK4rQaPhER4P0hzpb3xg1Fzdg@mail.gmail.com>
 <CADkTA4PujyTHtFxOt0DodPQQGBS=bwAC-4FC7pVG4jLrQfVaRQ@mail.gmail.com> <d493a642-ff70-02d5-ff7d-fde98d4abb9d@windriver.com>
In-Reply-To: <d493a642-ff70-02d5-ff7d-fde98d4abb9d@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 6 Sep 2021 23:05:56 -0400
Message-ID: <CADkTA4NcKhhJ_ULEdoFhSWyhcd6NcUDcmr1VDqTWrSwuqKCzUQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] skopeo: Upgrade to 1.4.1
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 6, 2021 at 10:35 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 9/6/21 10:08 PM, Bruce Ashfield wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Mon, Sep 6, 2021 at 9:46 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >>
> >> I also already have this version bump queued locally.
> >
> > Actually cancel that. I have more -dev versions under test (I got my
> > uprev's confused for a moment).
> >
> > But we don't want this SRCREV change. I put it to the tip of the
> > release branch on purpose, this rewinds the SRCREV, and it isn't
> > something I'd merge.
> >
> > But the packageconfig change can be valid, and is something I'd take.
>
> Okay, I will send the packageconfig part then. BTW, why is there dev
> version, I think the latest release version should satisfy most of our
> needs.

In this case, it is just a commit that bumps the version in
preparation for more changes (for 3.3.2), if you look at the
historical SRCREV bumps, I always take those changes.  There's no
reason to exclude them, since they are part of the release development
cycle. 3.3.2 will be out before the next release, and by taking those
commits, it shows the intention to track the tip for anything we may
need.

Bruce

>
> Thanks,
>
> >
> > Bruce
> >
> >>
> >>
> >> On Mon, Sep 6, 2021 at 4:09 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
> >>>
> >>> From: Mingli Yu <mingli.yu@windriver.com>
> >>>
> >>> Remove the unvalid keys to silence the below warning:
> >>>   # podman --version
> >>>   WARN[0000] Failed to decode the keys ["storage.options.override_kernel_check" "storage.options.overlay.ostree_repo"] from "/etc/containers/storage.conf"
> >>>   podman version 3.3.1
> >>>
> >>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >>> ---
> >>>   recipes-containers/skopeo/files/storage.conf | 6 +++---
> >>>   recipes-containers/skopeo/skopeo_git.bb      | 2 +-
> >>>   2 files changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/recipes-containers/skopeo/files/storage.conf b/recipes-containers/skopeo/files/storage.conf
> >>> index 818cfe8..c0d512f 100644
> >>> --- a/recipes-containers/skopeo/files/storage.conf
> >>> +++ b/recipes-containers/skopeo/files/storage.conf
> >>> @@ -30,7 +30,7 @@ size = ""
> >>>   #mount_program = "/usr/bin/fuse-overlayfs"
> >>>
> >>>   # OverrideKernelCheck tells the driver to ignore kernel checks based on kernel version
> >>> -override_kernel_check = "true"
> >>> +#override_kernel_check = "true"
> >>
> >> But there's no reason to drop this.
> >>
> >>>
> >>>   # mountopt specifies comma separated list of extra mount options
> >>>   mountopt = "nodev"
> >>> @@ -126,8 +126,8 @@ mountopt = "nodev"
> >>>   # xfs_nospace_max_retries = "0"
> >>>
> >>>   # If specified, use OSTree to deduplicate files with the overlay backend
> >>> -ostree_repo = ""
> >>> +#ostree_repo = ""
> >>>
> >>>   # Set to skip a PRIVATE bind mount on the storage home directory.  Only supported by
> >>>   # certain container storage drivers
> >>> -skip_mount_home = "false"
> >>> +#skip_mount_home = "false"
> >>
> >> or any of these .. the skopeo configuration serves many different use
> >> cases, if these are causing warnings in your setup, you need to carry
> >> your own storage.conf
> >>
> >> Bruce
> >>
> >>> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> >>> index 39ee8ca..adb7de1 100644
> >>> --- a/recipes-containers/skopeo/skopeo_git.bb
> >>> +++ b/recipes-containers/skopeo/skopeo_git.bb
> >>> @@ -27,7 +27,7 @@ SRC_URI = " \
> >>>       file://registries.conf \
> >>>   "
> >>>
> >>> -SRCREV = "01e51ce610e3cfe1230a10af982e962c4ad1c990"
> >>> +SRCREV = "130f32f047b7bf9b1fb4f95c4c5b1da6255e4829"
> >>>   PV = "v1.4.1+git${SRCPV}"
> >>>   GO_IMPORT = "import"
> >>>
> >>> --
> >>> 2.17.1
> >>>
> >>>
> >>> 
> >>>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
