Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD3CCE00C87; Wed, 18 Sep 2019 10:57:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.173 listed in list.dnswl.org]
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 084B3E009EA
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Sep 2019 10:57:33 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id k9so382214oib.7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Sep 2019 10:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=iwGJhiWlUq3IOxEZRpjn5BWO/+cORxFhyh4plKTqWvw=;
	b=g0bg74GNr2yjV6ckJteix+Uta5OnDU0VBfw3CdSXLBbnmW9VItC8D2WLEZEbOD0mgI
	qZOYQYLpIK+sBN/Nm6uKDUYpGt0dbyksrk3J0xjiayNufozayRkutx2uVC8ih1obGNJh
	H06MMohkE33oC8b34kZ+aXbRWINdlvnVIWIb2bBfEnDiGjelvlDEU1zssT+fXzlO8TFg
	8n7g7ebgnFKAJu1AWZyDLSVPCIAcncWYlOIXEA1e8Je7cUcfdbbQjfx151Z6SosnQZZI
	x5pzwQQUxXUjCuT67w/xScfn8j+DxArz/XCxYopWFJZwAnJ5e4bauvfCt6ongSpipAqP
	fNNQ==
X-Gm-Message-State: APjAAAVVRE7C45Keu7d2SHveSYgiFbzyw2zU9n2DMVQ47LVMQEAvPIcS
	adHQO6QnXu9G5zTX27g1STcxuxE8NNEYOrhdJbM=
X-Google-Smtp-Source: APXvYqzOfyXPnz9m553zD913BcZlz0rqx2mpEdqsfyaw2Ew2RFNv5CLiq1UBEauYTLrnUnD3emu7oN7sgDT37Au5H8g=
X-Received: by 2002:aca:fc06:: with SMTP id a6mr3262553oii.28.1568829453238;
	Wed, 18 Sep 2019 10:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <1568750311-566-1-git-send-email-mark.asselstine@windriver.com>
	<20190918175402.GA22136@gmail.com>
In-Reply-To: <20190918175402.GA22136@gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 18 Sep 2019 13:57:22 -0400
Message-ID: <CAPuovE+GvdY9Gx7D=V8qCD3Nj6ACvSCgcJBehSNvm6OOD8uOBg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] oci-systemd-hook: fixup patch context
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Sep 2019 17:57:34 -0000
Content-Type: text/plain; charset="UTF-8"

tanks :)

Mark

On Wed, Sep 18, 2019 at 1:54 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> nerged.
>
> Bruce
>
> In message: [meta-virtualization][PATCH] oci-systemd-hook: fixup patch context
> on 17/09/2019 Mark Asselstine wrote:
>
> > commit 7394c154a92f [containers: update oci-systemd-hook to 0.2.0]
> > incorrectly adjusted the context around the patch
> > 0001-Add-additional-cgroup-mounts-from-root-NS-automatica.patch.
> >
> > This resulted in containers failing with an error:
> > systemdhook <error>: Failed to mkdir new dest: /opt/container/cube-server/rootfs/sys/fs/cgroup/perf_event: No such file or directory
> >
> > Unfortunately, the code was being patched in ahead of the mounting of
> > the tmpfs after the patch context was adjusted. You can even get a
> > hint of this in the comment "Systemd is already handled above". Here
> > we correct this by pushing the code down to the correct position in
> > the file/function, making the error go away and proper function
> > return.
> >
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> >  ...itional-cgroup-mounts-from-root-NS-automatica.patch | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/recipes-containers/oci-systemd-hook/oci-systemd-hook/0001-Add-additional-cgroup-mounts-from-root-NS-automatica.patch b/recipes-containers/oci-systemd-hook/oci-systemd-hook/0001-Add-additional-cgroup-mounts-from-root-NS-automatica.patch
> > index b1299f5..34f0c09 100644
> > --- a/recipes-containers/oci-systemd-hook/oci-systemd-hook/0001-Add-additional-cgroup-mounts-from-root-NS-automatica.patch
> > +++ b/recipes-containers/oci-systemd-hook/oci-systemd-hook/0001-Add-additional-cgroup-mounts-from-root-NS-automatica.patch
> > @@ -1,4 +1,4 @@
> > -From f9c640fa1d4c14dfbd2bc40af91cb446ad373075 Mon Sep 17 00:00:00 2001
> > +From 12d92162c449d51f4ffa482f7daaeb42c4135937 Mon Sep 17 00:00:00 2001
> >  From: Jason Wessel <jason.wessel@windriver.com>
> >  Date: Tue, 2 Jul 2019 20:51:08 +0000
> >  Subject: [PATCH] Add additional cgroup mounts from root NS automatically
> > @@ -9,10 +9,10 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> >   1 file changed, 45 insertions(+)
> >
> >  diff --git a/src/systemdhook.c b/src/systemdhook.c
> > -index 87a3585..5220c54 100644
> > +index c2cb2b9..f9ec9f2 100644
> >  --- a/src/systemdhook.c
> >  +++ b/src/systemdhook.c
> > -@@ -281,6 +281,11 @@ static char *get_process_cgroup_subsystem_path(const char *id, int pid, const ch
> > +@@ -274,6 +274,11 @@ static char *get_process_cgroup_subsystem_path(const char *id, int pid, const ch
> >   static int mount_cgroup(const char *id, const char *rootfs, const char *options, char *systemd_path)
> >   {
> >       _cleanup_free_ char *cgroup_path = NULL;
> > @@ -24,8 +24,8 @@ index 87a3585..5220c54 100644
> >
> >       if (asprintf(&cgroup_path, "%s/%s", rootfs, CGROUP_ROOT) < 0) {
> >               pr_perror("%s: Failed to create path for %s", id, CGROUP_ROOT);
> > -@@ -290,6 +295,46 @@ static int mount_cgroup(const char *id, const char *rootfs, const char *options,
> > -             pr_perror("%s: Failed to mkdir new dest: %s", id, cgroup_path);
> > +@@ -292,6 +297,46 @@ static int mount_cgroup(const char *id, const char *rootfs, const char *options,
> > +             pr_perror("%s: Failed to mkdir new dest: %s", id, systemd_path);
> >               return -1;
> >       }
> >  +    /* Create all additional cgroup mounts which are in the root namespace */
> > @@ -68,9 +68,9 @@ index 87a3585..5220c54 100644
> >  +            free(dpath);
> >  +    }
> >  +    closedir(dir);
> > -     /* Mount tmpfs at new cgroup directory */
> > -     if (mount("tmpfs", cgroup_path, "tmpfs", MS_NODEV|MS_NOSUID, options) == -1) {
> > -             pr_perror("%s: Failed to mount tmpfs at %s", id, cgroup_path);
> > +     if (remount_readonly(id, cgroup_path, cgroup_path) < 0) {
> > +             return -1;
> > +     }
> >  --
> > -2.19.1
> > +2.7.4
> >
> > --
> > 2.7.4
> >
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

