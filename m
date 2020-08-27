Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.20356.1598539297754775424
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Aug 2020 07:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S3g3OJIs;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id a26so8017595ejc.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Aug 2020 07:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Up6OJbarl1Z4D4eVF/3fx3faX8fnrPJzVF46z7nQGec=;
        b=S3g3OJIsg8uEIxsz8v27gLhFl5pZ49/avaggMi3XJNytamcFew1Vv8cQeGSv4r+vSt
         wWtULQ32okZ3d9N/BjaJFm0MC6qC/J1OyGgw0raAI2RkUhJgeCZE0KcHEvtR/++Unc8C
         kc9pNkLGxVR1J1kMaRUEydNa/WdQTCKcbKk6n6w06i0U9ktD0jgkrZCncEtIzOxqRkzJ
         bL8uETxjx8G+WaB2GpKdsAAOgmrzeH3UG9lCYRDkC+6UmY7PgsHEiYfM5iDOEs3Lp0lN
         JZ1J8hGh/ZFFraH+aFsZ9EaEau42By2kYTnow+ZKlhAMxOEvE4VcXZihF5d8Mwwl+EI0
         t6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Up6OJbarl1Z4D4eVF/3fx3faX8fnrPJzVF46z7nQGec=;
        b=m8WzA8Z4IOsB22kcnMdgU22z49URCzm9ronPqqA/b1NP14MZg/gvbUPFVDdt1klsby
         T+lXBX11VqaUBSGebmAvP+TEmdN2TiT/7BjfK1/0B9lB4tALtwGznVSNGWPcuWa29oht
         nD/nS3ezpZRbqiVXNYwvtZpvke/j7dYTpPI0chCSJsigUzVUdxKufTiBxYH69sBNXDmN
         oOaJ5idvCYbrvwg7nj7U34mlWS5raHxV0yeoycyS4bSz8g35Z6DLmG8c0/51iyeOxhUN
         PqRoJQD3zAIvIqY0x8UYvb/XxsYZjGukBwADF9j4WyxMWMYiuL6o29t9aIW3bfeFo68O
         tX0w==
X-Gm-Message-State: AOAM5319YQJsU1tUuMDP7XNk1u9SuiApWr3hJo3CmoB3xR+JBCuLnRUf
	GcdbnQqKTkfSrzAc3uuMhlnrTUwq99fKUWnNwWM=
X-Google-Smtp-Source: ABdhPJxIhIbnG3ekYPKwJF+xDZ1tk0Tg/wBslYozRy3+bd++3gux7ceLDnQ0ZUTDpp9QJRQnEDVGrPtXuvFxrjjF55g=
X-Received: by 2002:a17:906:4810:: with SMTP id w16mr19501294ejq.298.1598539296034;
 Thu, 27 Aug 2020 07:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <1597398993-36660-1-git-send-email-diego.sueiro@arm.com>
 <20200817013409.GA13307@gmail.com> <162BFF110C03FC4E.19371@lists.yoctoproject.org>
 <574CF513-EDAF-42F3-843B-2F52A144EDC6@arm.com>
In-Reply-To: <574CF513-EDAF-42F3-843B-2F52A144EDC6@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 27 Aug 2020 10:39:14 -0400
Message-ID: <CADkTA4M6362pLp5eFkBTAQhchr943S0KkZBLj_dnAgvhQS2-yw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] xen: Fix menuconfig and add support for config fragments and diffconfig
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Doug Goldstein <cardoe@gentoo.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was waiting on something from Christopher on this, but as it turns
out .. I was going to do a merge of the pending queue now that some
oe-core work is done.

So your timing is good. It should be in the tree by EOD.

Bruce

On Thu, Aug 27, 2020 at 10:10 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Gentle ping :-)
>
> Bertrand
>
> > On 17 Aug 2020, at 08:55, Bertrand Marquis via lists.yoctoproject.org =
<bertrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
> >
> >
> >
> >> On 17 Aug 2020, at 02:34, Bruce Ashfield via lists.yoctoproject.org <=
bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>
> >> In message: [meta-virtualization][PATCH v2] xen: Fix menuconfig and a=
dd support for config fragments and diffconfig
> >> on 14/08/2020 Diego Sueiro wrote:
> >>
> >>> Changes in v2:
> >>>   - Fixed typo in recipes-extended/xen/README
> >>>   - Removed documentation changes from 0001-menuconfig-mconf-cfg-All=
ow-specification-of-ncurses-location.patch
> >>>   - Updated Upstream-Status in 0001-menuconfig-mconf-cfg-Allow-speci=
fication-of-ncurses-location.patch
> >>>   - Call find_cfgs function only once in recipes-extended/xen/xen-hy=
pervisor.inc
> >>
> >>
> >> v2 looks good to me.
> >>
> >> Christopher, do you agree ?
> >
> > I tested it and it worked for me, including modifying the xen configur=
ation.
> >
> > So you can add my:
> >
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >
> >>
> >> Bruce
> >>
> >>>
> >>> Diego Sueiro (1):
> >>> xen: Fix menuconfig and add support for config fragments and
> >>>   diffconfig
> >>>
> >>> recipes-extended/xen/README                        |  3 ++
> >>> ...g-Allow-specification-of-ncurses-location.patch | 49 ++++++++++++=
++++++++++
> >>> recipes-extended/xen/xen-hypervisor.inc            | 49 +++++++++---=
----------
> >>> recipes-extended/xen/xen_4.14.bb                   |  1 +
> >>> recipes-extended/xen/xen_git.bb                    |  1 +
> >>> 5 files changed, 73 insertions(+), 30 deletions(-)
> >>> create mode 100644 recipes-extended/xen/files/0001-menuconfig-mconf-=
cfg-Allow-specification-of-ncurses-location.patch
> >>>
> >>> --
> >>> 2.7.4
> >>>
> >>> IMPORTANT NOTICE: The contents of this email and any attachments are=
 confidential and may also be privileged. If you are not the intended recip=
ient, please notify the sender immediately and do not disclose the contents=
 to any other person, use it for any purpose, or store or copy the informat=
ion in any medium. Thank you.
> >>
> >>>
> >>
> >>
> >
> >
>
>=20



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
