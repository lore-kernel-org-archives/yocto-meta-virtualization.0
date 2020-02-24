Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.16950.1582520140816147567
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 20:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iYW5eWIl;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id y6so8582130lji.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 23 Feb 2020 20:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ALfTTh8OHzfTdJGMDcn8xFjTtVQWRrORsc6NlvIKRnQ=;
        b=iYW5eWIlWmsrLiBPY86CIrHOmgbHsPjtsirmoihSFzAMDW+2kzfUs554Vs7AxBitrs
         mehCms1053mEolXiYvvueOnfZk2kL0+s9KwtDDNswGxByJQFXhyMvMyKdnPp2IzmDBGP
         8hWaaoHK4wy/pvBKdTErXV8oeAOFOM6MO76Ul4m+tUHGHiMp3AJ4tgv4MiUQOMndnnAI
         2WQbBOIMvbLFXxueCo+VZweFGjPbz7Vs37xnya/XuCp8QlFrtCzHuyQhNdexNWpsldaD
         4DC6jFzULPkFwO6yLKYXDecUEnjJEBN50yokXThWGtWZrhBh1cEzzn79V4dCuVop28n9
         W/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ALfTTh8OHzfTdJGMDcn8xFjTtVQWRrORsc6NlvIKRnQ=;
        b=tzMczH5CvFGndoQ6c7BO6Qp7b3+bgSYxJ/4m5xa73MiCoX8fimCbYkFk5ctq6lOQdW
         ecvfEZ+W5hlaApkrY8oUG91Z18EKugWruzL5vwzt15OXqxZFB5DCikf0yysPykdsGCgl
         FLuEHDGHAuyRWX7T55gYMB5Uld+9HZf6cqz8Dpr+GxUXDf+j1aZ2jwNUYY2bx38bFN+r
         rCADBJxc5Urv3bCVJ6pLRF0L4Rdc/cREz8m0IZMQd9u5j26gTqjTQ7jmc1Fp5cHGsTaN
         y7YbyyO7ZM5ndYc9wEWc2wNdo4HHzLv3l9X2vqs6Fq0DU5zyKfTtZiWaZcL4UQISgJO8
         axoQ==
X-Gm-Message-State: APjAAAVn9ttqc7WzAWhjf7smYioePoQ1in1c3jqAMX7jAD+7TbsC3zfc
	ayv+J9IUa4ruTv8vlrYMgnuZvW4JvRZF7mq2eV0=
X-Google-Smtp-Source: APXvYqw7sxH+dXrjpjUwD3r5jdvBK9UiitTGbzKxjergNypruL7gb9JDzyH+riUdW4cex31qt2/Zp/PgMhTeFaU/WvM=
X-Received: by 2002:a05:651c:314:: with SMTP id a20mr29513507ljp.91.1582520138898;
 Sun, 23 Feb 2020 20:55:38 -0800 (PST)
MIME-Version: 1.0
References: <15F33D74C6BC534D.11355@lists.yoctoproject.org>
 <74D7E070-D2BE-4A70-9394-0DE45CC5E06C@arm.com> <CADkTA4MmNbkXjMQCJGF4NME4Vp0mgH8KUbL2a5c5Q-ZWpMo=ag@mail.gmail.com>
 <10562492-D715-4A10-85F9-983CD272221F@arm.com> <CADkTA4MFBHuXrySuG02TzOkmEitwMwXXs-JPccZj--7-NR9RDA@mail.gmail.com>
 <CACMJ4GZrj27_qeT7Y-s1DpEmzHgWMuHoFLYhHu9uyVxCoxBOqg@mail.gmail.com> <5D77CA0D-AF13-4634-86EC-682F2E4E3123@arm.com>
In-Reply-To: <5D77CA0D-AF13-4634-86EC-682F2E4E3123@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Sun, 23 Feb 2020 20:55:27 -0800
Message-ID: <CACMJ4GZN_OaxZcghXOyoYFdzvfo8dQZi5Eo7yaSj3Sg1W+J03g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] Xen: fix do_deploy dependencies
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, 
	Doug Goldstein <cardoe@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 1:08 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> On 20 Feb 2020, at 18:41, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>
> > On Wed, Feb 19, 2020 at 6:00 AM Bruce Ashfield <bruce.ashfield@gmail.co=
m> wrote:
>
> > > On Wed, Feb 19, 2020 at 8:47 AM Bertrand Marquis <Bertrand.Marquis@ar=
m.com> wrote:
>
> > > > On 19 Feb 2020, at 13:31, Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
>
> > > > > On Wed, Feb 19, 2020 at 8:09 AM Bertrand Marquis  <Bertrand.Marqu=
is@arm.com> wrote:
>
> > > > > > On 14 Feb 2020, at 10:17, Bertrand Marquis via Lists.Yoctoproje=
ct.Org <bertrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>
> > > > > > > do_deploy is using the files installed during do_install and =
it must be
> > > > > > > executed after it but before do_build. This is fixing SSTATE =
behaviour
> > > > > > > which had previously an empty scene in some cases.
>
> > > > > > Any chance somebody could check and ack on this ?
>
> > > > > There's an entire update / re-work of Xen on the mailing list. I =
won't
> > > > > be merging any Xen patches until we have that sorted out.
>
> > > > Ok I will re-push my patch once the changes in Xen are merged then.
>
> > > the patch does look fine, and I've tagged it for merging. I just
> > > wanted to get the big changes in before jiggling anything (even if it
> > > shouldn't have an impact).
>
> > Thanks for the report, Bertrand. I've taken a look at this. The
> > addition of "before do_build" looks OK to me, and should be sufficient
> > to address the behaviour reported about an empty scene observed in
> > some cases -- some more details about that observation that prompted
> > this patch, and some testing to confirm that just adding "before
> > do_build" addition addresses it would be helpful.
>
> A big grep in poky for =E2=80=9Caddtask deploy=E2=80=9D is showing that m=
ost of the time this is added with:
> addtask deploy before do_build after do_instal

You're right that there are several recipes in poky that do that; but diffe=
rent
recipes have different requirements, based on what they build. I'll explain
below why the Xen recipe differs from those.

> > I'm not convinced about the change to move it to "after do_install" tho=
ugh.
> > do_populate_sysroot already runs after do_install, so no change is
> > needed to ensure that the binaries are available by the time the
> > deploy task runs, but more importantly I think that the deploy task
> > should run, as it currently does, after do_populate_sysroot to ensure
> > that the same binaries that are made available to other recipes via
> > sysroots are also those that are deployed. Scheduling it after the
> > do_populate_sysroot means that if the deploy task is run, the sysroot
> > copies are also up to date.
>
>
> The problem in doing this after do_populate_sysroot is that do_deploy is =
not using the populated sysroot but the result of do_install.

The current Xen recipe that is in the meta-virtualization layer builds both=
 the
hypervisor and the tools. These tools-and-hypervisor have to match version =
in
order to function correctly. There are two separate paths for the build
products: the hypervisor binary is made available to 'deploy' and the tools=
 are
staged for installation in the image rootfs.

To ensure that the correct version of the tools have been built and staged =
for
the rootfs to match the deployed hypervisor binary, the deploy task which m=
akes
the hypervisor binary available depends on do_populate_sysroot task that st=
ages
the built tools binaries. That's why the existing recipe has the
'addtask deploy'
statement 'after do_populate_sysroot'.

So: you are correct that do_deploy is indeed writing binaries that are
the result of
do_install, but those binaries also have a runtime dependency on the correc=
t
version of the tools being staged for inclusion in the image rootfs.

For my patch series that updates the Xen recipes, it introduces separate
recipes for the tools and the hypervisor, and for the new version of the se=
ries
that I'm about to post here, I've updated the deploy tasks to ensure that
this deploy dependency for the hypervisor on the tools being staged correct=
ly
is preserved.

thanks,

Christopher
