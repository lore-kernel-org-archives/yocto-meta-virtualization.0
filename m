Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.1269.1582840609608031174
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 13:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SVhr0AwE;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id n18so861959edw.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2020 13:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=97hbhBXvKpM/9g8GrfXLuuluQ38H0hk7+N6+0AV9RFk=;
        b=SVhr0AwE1Npqy59xYcIwSbMDq+NJEn+TCYVwZCS4zUXRdgCf8wC9rfNwMM85szoNRl
         sljds8CuRcLwk4pSsdHqTvH1p0L503upisQm3jFbAgkGTaqDmrZYkWkg9gW1CfDAeAZn
         QpxJmHfrg+hop3EGnmKUxTMcMXNCGsDQNWi5y1JFzumKwA8lVFIFJyF7ordCIA6fq9OR
         CJmh0BOcEXqA7R5FxjlSneT+hfQycM9ox2OfLedUur9zpXDiVEJgkNBOUICQ5EwlE6sv
         0k9AmdD1yLJEEk464A/QcPUXi4olkl2sdJUp0oCFnnukCV3m3CNvVnZBxId26rvwublQ
         yh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=97hbhBXvKpM/9g8GrfXLuuluQ38H0hk7+N6+0AV9RFk=;
        b=HTSkLc0A4GfmfqXEHEPw9PmaF83mkOV5YeZBr9RLih+UiBkuA71eX3Y2TLxo02nYJn
         R5Q2snGw4XwHnTHzbZoaAkRP561b5tsJwSreMdreooeOEB7Y09YR873OK/Mh4l1bU7ll
         gjGbsdjPNHDijLF4AbJOFlYfZ+BeKu43INWN3eOp8ahm4s8LkWoDKZpDRTPwGUHP9lio
         dG9pOg4ZWC0lTHFthyIC1vev3vFlrtTgTM//Qc2gqCoq6sz8QariDoMWVOfTwLbTdaQz
         9/90TjFS3yqO8cgupb7YyzB9RjQmYzrYdot+RtXOud2CiEObTGkWilMiBnrTGqyiOEtX
         529Q==
X-Gm-Message-State: APjAAAU0BFcLiwCpCwMUphVER3y+3S97KfciNY9aUPoJg/5I5P1oeXWo
	KdDhAYjMFtIFgq4Qd5dwcE/qhuPHkIzVxZGr5G4=
X-Google-Smtp-Source: APXvYqzT/nmofeoTjyoBgTilj9pZvPpg8Z1Pi2HwgO+/Qy4lPAqE/42kj6GMzR/efZs3sDZbS4neehEvLuW4InVyL3c=
X-Received: by 2002:a50:aacd:: with SMTP id r13mr587216edc.129.1582840607939;
 Thu, 27 Feb 2020 13:56:47 -0800 (PST)
MIME-Version: 1.0
References: <15F6EE92C1F851C1.19684@lists.yoctoproject.org>
 <20200226145813.9914-1-olkuroch@cisco.com> <15F760BA05EEFA48.29399@lists.yoctoproject.org>
In-Reply-To: <15F760BA05EEFA48.29399@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 27 Feb 2020 16:56:36 -0500
Message-ID: <CADkTA4Mt4eff=C_wWeqMZJ=p1Vu-PWYv-mOFf5Vkk=NfuUsu6A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] lxc: Backport patch that renames memfd_create() function
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: olkuroch@cisco.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 27, 2020 at 4:49 PM Bruce Ashfield via
Lists.Yoctoproject.Org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> merged.

Somehow the author field of this was incorrect, so I had to amend and
manually set it to your name.

Not sure how it happened, but we'll have to keep an eye out for it in the future

Bruce

>
> Bruce
>
> In message: [meta-virtualization][PATCH v2] lxc: Backport patch that renames memfd_create() function
> on 26/02/2020 Oleksii Kurochko via Lists.Yoctoproject.Org wrote:
>
> > When Autotools makes configuration of LXC, the check of
> > the memfd_create() function fails because __stub_memfd_create and
> > __stub___memfd_create (The GNU C library defines this for functions
> > which it implements to always fail with ENOSYS) are defined in Glibc,
> > which leads to the fact that the macro HAVE_MEMFD_CREATE is not
> > defined and LXC provides defintion of the memfd_create() function as
> > static inline which in turn conflicts with a definition from
> > the <bits/mman-shared.h> file and causes an error:
> > | In file included from ../../../lxc-3.2.1/src/lxc/conf.c:79:
> > | <src_path>//lxc/syscall_wrappers.h:77:19: error: static declaration
> > | of 'memfd_create' follows non-static declaration
> > | | static inline int memfd_create(const char *name, unsigned int flags) {
> > | |                   ^~~~~~~~~~~~
> > | In file included from /usr/include/bits/mman-linux.h:111,
> > |                  from /usr/include/bits/mman.h:34,
> > |                  from /usr/include/sys/mman.h:41,
> > |                  from <src_path>/lxc-3.2.1/src/lxc/conf.c:42:
> > | /usr/include/bits/mman-shared.h:50:5: note: previous declaration
> > |  of 'memfd_create' was here
> > | | int memfd_create (const char *__name, unsigned int __flags) __THROW;
> > | |     ^~~~~~~~~~~~
> >
> > Upstream PR: https://github.com/lxc/lxc/pull/3168 (merged)
> >
> > Signed-off-by: Oleksii Kurochko <olkuroch@cisco.com>
> > ---
> >  ...-rename-internal-memfd_create-to-mem.patch | 46 +++++++++++++++++++
> >  recipes-containers/lxc/lxc_3.2.1.bb           |  1 +
> >  2 files changed, 47 insertions(+)
> >  create mode 100644 recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
> >
> > diff --git a/recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch b/recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
> > new file mode 100644
> > index 000000000000..9d5b5b8aefc1
> > --- /dev/null
> > +++ b/recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
> > @@ -0,0 +1,46 @@
> > +From b1694cccddadc8b084cd9eb502d9e86e0728709b Mon Sep 17 00:00:00 2001
> > +From: Patrick Havelange <patrick.havelange@essensium.com>
> > +Date: Tue, 22 Oct 2019 12:29:54 +0200
> > +Subject: [PATCH v2] syscall_wrappers: rename internal memfd_create to
> > + memfd_create_lxc
> > +
> > +In case the internal memfd_create has to be used, make sure we don't
> > +clash with the already existing memfd_create function from glibc.
> > +
> > +This can happen if this glibc function is a stub. In this case, at
> > +./configure time, the test for this function will return false, however
> > +the declaration of that function is still available. This leads to
> > +compilation errors.
> > +
> > +Upstream-Status: Backport [lxc-3.2.1 https://github.com/lxc/lxc/pull/3168]
> > +
> > +Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> > +(cherry picked from commit 40b06c78773dfd5e12e568a576b1abb133f61b71)
> > +Signed-off-by: Oleksii Kurochko <olkuroch@cisco.com>
> > +---
> > + v2: added Upstream-Status
> > +
> > + src/lxc/syscall_wrappers.h | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/lxc/syscall_wrappers.h b/src/lxc/syscall_wrappers.h
> > +index ce67da5b5308..b7edba63f5d7 100644
> > +--- a/src/lxc/syscall_wrappers.h
> > ++++ b/src/lxc/syscall_wrappers.h
> > +@@ -74,7 +74,7 @@ static inline long __keyctl(int cmd, unsigned long arg2, unsigned long arg3,
> > + #endif
> > +
> > + #ifndef HAVE_MEMFD_CREATE
> > +-static inline int memfd_create(const char *name, unsigned int flags) {
> > ++static inline int memfd_create_lxc(const char *name, unsigned int flags) {
> > +     #ifndef __NR_memfd_create
> > +             #if defined __i386__
> > +                     #define __NR_memfd_create 356
> > +@@ -113,6 +113,7 @@ static inline int memfd_create(const char *name, unsigned int flags) {
> > +     return -1;
> > +     #endif
> > + }
> > ++#define memfd_create memfd_create_lxc
> > + #else
> > + extern int memfd_create(const char *name, unsigned int flags);
> > + #endif
> > diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
> > index bedcf13723d2..9592dd9b4e68 100644
> > --- a/recipes-containers/lxc/lxc_3.2.1.bb
> > +++ b/recipes-containers/lxc/lxc_3.2.1.bb
> > @@ -49,6 +49,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
> >          file://0002-container.conf-Add-option-to-disable-session-keyring.patch \
> >       file://dnsmasq.conf \
> >       file://lxc-net \
> > +     file://0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch \
> >       "
> >
> >  SRC_URI[md5sum] = "4886c8d1c8e221fe526eefcb47857b85"
> > --
> > 2.19.1
> >
>
> >
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
