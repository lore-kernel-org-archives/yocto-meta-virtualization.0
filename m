Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.35244.1631019420933516899
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Sep 2021 05:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BPZswuYP;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id g21so13799391edw.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Sep 2021 05:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g0PZEoTphEcBZtzjTIxpV4EeSep+KR1xjOrvd8/QDoY=;
        b=BPZswuYPUxwTQm62MdVeBh33gh1LClusmokglNv4to+nR0st72aSfDzNFDNw4aU4Ox
         naYpv7Jc9bOy1xQcPzL7V4rRUPpPriZ2tGTWP73On9W7fD6k8IimT0Zm+pCm33cgkYAQ
         IWFki6JVesENHtnLghPafUFN0F7emGqL4vyUUr2AuH6HA3IdlL6vOV0WGFayc05xVqgN
         z07F/8ipaZF5eQGaIqnHeheeZ0J3AEfEcr/ouSFXsc04F04uy5inq5y2rSOUDrRh66+Y
         mKW1fV9+2tcYsQ2qEme9ur7MWRcH3RzdOGkvfh3nHHySKcCLXZhs4pqiGx/6Eu3ODM9Q
         4nQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g0PZEoTphEcBZtzjTIxpV4EeSep+KR1xjOrvd8/QDoY=;
        b=pdRWv+sJGSp/XvvE/aPaGzM1RBOxfX0pxW0VE9Pb1KItrSEyCiJFD77Zmg9J/Aripx
         u/FO82lpWaKSVT3DoxJiSr31KhJJ7apyXMMKKc+xGKHqOxfAUi7hah6T7rrKH03WenfD
         hiLWV/ZEb9qpXtGdiWX2g2gEv2QcpriD6BpFEUSJ+oU25ym6m3LEvGr7ahEZS+5EEaEr
         isAavQmMmhcS0JkTBRPclx3rcxi/VXVZrq1LHVDv1bo/Iv5HcMfl2/lI1T0kZYjoRAL1
         Fl6J+8a3O2oI9jRs0XOydFmPLtLlnQHiEevWBo0rZCJJwMYsZv8d1hTSP2Tybr7yHYu4
         0nIw==
X-Gm-Message-State: AOAM532X+IkpBJPcBbVQnmv5E3n5dvuPYWKoJ3HO7BsNaie9CtgnZlcb
	uEPivFqFixgjvFbFCmRQH9iqLOy5dHOGaD2wGeh+gObb4Zg=
X-Google-Smtp-Source: ABdhPJzpsJQRAAI8C8ck1Rsu41nCGqqNZeevW7WQvc54opL6oYaAzYZW9HVJvMsyDIfobV30RqEfQ6wyZ2cFa0fE/bc=
X-Received: by 2002:a50:f1c6:: with SMTP id y6mr18022091edl.354.1631019419128;
 Tue, 07 Sep 2021 05:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210906080510.28468-1-mingli.yu@windriver.com>
 <20210906080510.28468-2-mingli.yu@windriver.com> <CADkTA4OJ1XKrGkUvbUCW6AyoGwK4rQaPhER4P0hzpb3xg1Fzdg@mail.gmail.com>
 <CADkTA4PujyTHtFxOt0DodPQQGBS=bwAC-4FC7pVG4jLrQfVaRQ@mail.gmail.com>
 <d493a642-ff70-02d5-ff7d-fde98d4abb9d@windriver.com> <CADkTA4NcKhhJ_ULEdoFhSWyhcd6NcUDcmr1VDqTWrSwuqKCzUQ@mail.gmail.com>
 <1245214a-6dd9-eaf1-9969-34e12c68eb91@windriver.com>
In-Reply-To: <1245214a-6dd9-eaf1-9969-34e12c68eb91@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 7 Sep 2021 08:56:48 -0400
Message-ID: <CADkTA4MC5A9q0SwmPAS2Xf35RsfKrXX=86yLetZeFRm4ysq1=Q@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] skopeo: Upgrade to 1.4.1
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 6, 2021 at 11:41 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 9/7/21 11:05 AM, Bruce Ashfield wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Mon, Sep 6, 2021 at 10:35 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
> >>
> >>
> >>
> >> On 9/6/21 10:08 PM, Bruce Ashfield wrote:
> >>> [Please note: This e-mail is from an EXTERNAL e-mail address]
> >>>
> >>> On Mon, Sep 6, 2021 at 9:46 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >>>>
> >>>> I also already have this version bump queued locally.
> >>>
> >>> Actually cancel that. I have more -dev versions under test (I got my
> >>> uprev's confused for a moment).
> >>>
> >>> But we don't want this SRCREV change. I put it to the tip of the
> >>> release branch on purpose, this rewinds the SRCREV, and it isn't
> >>> something I'd merge.
> >>>
> >>> But the packageconfig change can be valid, and is something I'd take.
> >>
> >> Okay, I will send the packageconfig part then. BTW, why is there dev
> >> version, I think the latest release version should satisfy most of our
> >> needs.
> >
> > In this case, it is just a commit that bumps the version in
> > preparation for more changes (for 3.3.2), if you look at the
> > historical SRCREV bumps, I always take those changes.  There's no
> > reason to exclude them, since they are part of the release development
> > cycle. 3.3.2 will be out before the next release, and by taking those
> > commits, it shows the intention to track the tip for anything we may
> > need.
>
> If so, could we put two recipes here? one is for dev version such as
> podman-dev.bb and one such as podman_git.bb to track the latest release?
>

There's no value in doing that. There aren't specific "more stable" or
"development" releases. That simply doubles maintenance and splits our
testing.

By the time meta-virt 'releases' against honister, we'll be at the
next dot release.

Bruce

> Thanks,
>
> >
> > Bruce
> >
> >>
> >> Thanks,
> >>
> >>>
> >>> Bruce
> >>>
> >>>>
> >>>>
> >>>> On Mon, Sep 6, 2021 at 4:09 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
> >>>>>
> >>>>> From: Mingli Yu <mingli.yu@windriver.com>
> >>>>>
> >>>>> Remove the unvalid keys to silence the below warning:
> >>>>>    # podman --version
> >>>>>    WARN[0000] Failed to decode the keys ["storage.options.override_kernel_check" "storage.options.overlay.ostree_repo"] from "/etc/containers/storage.conf"
> >>>>>    podman version 3.3.1
> >>>>>
> >>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >>>>> ---
> >>>>>    recipes-containers/skopeo/files/storage.conf | 6 +++---
> >>>>>    recipes-containers/skopeo/skopeo_git.bb      | 2 +-
> >>>>>    2 files changed, 4 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/recipes-containers/skopeo/files/storage.conf b/recipes-containers/skopeo/files/storage.conf
> >>>>> index 818cfe8..c0d512f 100644
> >>>>> --- a/recipes-containers/skopeo/files/storage.conf
> >>>>> +++ b/recipes-containers/skopeo/files/storage.conf
> >>>>> @@ -30,7 +30,7 @@ size = ""
> >>>>>    #mount_program = "/usr/bin/fuse-overlayfs"
> >>>>>
> >>>>>    # OverrideKernelCheck tells the driver to ignore kernel checks based on kernel version
> >>>>> -override_kernel_check = "true"
> >>>>> +#override_kernel_check = "true"
> >>>>
> >>>> But there's no reason to drop this.
> >>>>
> >>>>>
> >>>>>    # mountopt specifies comma separated list of extra mount options
> >>>>>    mountopt = "nodev"
> >>>>> @@ -126,8 +126,8 @@ mountopt = "nodev"
> >>>>>    # xfs_nospace_max_retries = "0"
> >>>>>
> >>>>>    # If specified, use OSTree to deduplicate files with the overlay backend
> >>>>> -ostree_repo = ""
> >>>>> +#ostree_repo = ""
> >>>>>
> >>>>>    # Set to skip a PRIVATE bind mount on the storage home directory.  Only supported by
> >>>>>    # certain container storage drivers
> >>>>> -skip_mount_home = "false"
> >>>>> +#skip_mount_home = "false"
> >>>>
> >>>> or any of these .. the skopeo configuration serves many different use
> >>>> cases, if these are causing warnings in your setup, you need to carry
> >>>> your own storage.conf
> >>>>
> >>>> Bruce
> >>>>
> >>>>> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> >>>>> index 39ee8ca..adb7de1 100644
> >>>>> --- a/recipes-containers/skopeo/skopeo_git.bb
> >>>>> +++ b/recipes-containers/skopeo/skopeo_git.bb
> >>>>> @@ -27,7 +27,7 @@ SRC_URI = " \
> >>>>>        file://registries.conf \
> >>>>>    "
> >>>>>
> >>>>> -SRCREV = "01e51ce610e3cfe1230a10af982e962c4ad1c990"
> >>>>> +SRCREV = "130f32f047b7bf9b1fb4f95c4c5b1da6255e4829"
> >>>>>    PV = "v1.4.1+git${SRCPV}"
> >>>>>    GO_IMPORT = "import"
> >>>>>
> >>>>> --
> >>>>> 2.17.1
> >>>>>
> >>>>>
> >>>>> 
> >>>>>
> >>>>
> >>>>
> >>>> --
> >>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>>> thee at its end
> >>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
> >>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
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
