Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.8897.1582727460757012212
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Feb 2020 06:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FETb2TN1;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id j34so2366222qtk.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Feb 2020 06:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2+J56a86dYLDngNCpEwmaA4Tca9CKek1RslP3fur1nQ=;
        b=FETb2TN1F/ME0vArSiZj3fnpMeEZb3i6jArJz30YtxmVl9CQjU4PLGNy4w7XZTJUEB
         wda/tkYzQfhCeAHzgin3/tbFHvGGG876l1ueG7I7GUzlLYhavVbwp+mkhH7rCQx/e6by
         N6l/WCSP6Mw6QOEbkEjTAGxSSgj1gZQrTv5HrGbds56yKoOAOpTVfV1AyJsqjX0SwAfH
         kDbq0DhaV5DSdYfHnFuZH+Nt4EmXYar8K3VZtQ38VVsaoII+3t2X5luPiAK2RcW9hG7j
         aLk7o9Frz5dMnHkgdDTy//stMyHr0/xVh3xFLYA7mnkOoJhLxtKh/bALV1av+P4aeGUl
         kTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2+J56a86dYLDngNCpEwmaA4Tca9CKek1RslP3fur1nQ=;
        b=DB8YHgznIPpotW+Wzg5FnJGwkJyktKW/XZWCP3uNmqIMjCblRc97W4rYqoNxR/0N3r
         3zh8p2NfWAwxGNlNR0eTqqieQ0VQuTLsLfSFu+M1lh648m+SHQY37FnVUohxbjdByy3Q
         8AvURxuk4Luc9xjIXVeMhd1fAjs7OtR4wiN13Fq9qwgeb6gjumkz6RJ1jKeRa4mHMVKM
         oSyRPvPIJnZFetsYgS5HVGwXjUul9/JXUzDDytozhFIDTDrHK7+UsigWIoIVkF1FZ2As
         vqxuzgFTDRih+98qPPYtX626EYdtbyeBNal4UPSurSqQsRBBzY4Ioa1y5hILwHZkXtY2
         fpYw==
X-Gm-Message-State: APjAAAXRP4nRQciGJY4yqUNoM3nDfhK3HLOnyqYSqS1rAcqSQOGNOwl7
	Ycr7ZW2jHN8NlB6RnZpcfHQ=
X-Google-Smtp-Source: APXvYqxrJq1WoR9hXSe25HiGnTXCOgFbZSAC+Lb+KG5XGi5Kvyy1d5y0T8IT59D8JaIE3fn/yd9IiQ==
X-Received: by 2002:ac8:1e05:: with SMTP id n5mr5742210qtl.227.1582727459775;
        Wed, 26 Feb 2020 06:30:59 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE98dac44fc29f-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.255.134])
        by smtp.gmail.com with ESMTPSA id n74sm1212638qke.63.2020.02.26.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 06:30:58 -0800 (PST)
Date: Wed, 26 Feb 2020 09:30:57 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Lee Chee Yang <chee.yang.lee@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] linux: add bbappend for generic cases
Message-ID: <20200226143053.GA25436@gmail.com>
References: <1582613221-56653-1-git-send-email-chee.yang.lee@intel.com>
 <CADkTA4M6PKA4wJ5vrOYis+q7Tvw+xAbQG7TMyim-Xz_+PZywfg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4M6PKA4wJ5vrOYis+q7Tvw+xAbQG7TMyim-Xz_+PZywfg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 5157
Content-Type: multipart/mixed; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: Re: [meta-virtualization] [PATCH] linux: add bbappend for generic cases
on 25/02/2020 Bruce Ashfield wrote:

> On Tue, Feb 25, 2020 at 1:47 AM Lee Chee Yang <chee.yang.lee@intel.com> wrote:
> >
> > From: Chee Yang Lee <chee.yang.lee@intel.com>
> >
> > add generic .bbappend for linux kernel recipe to allow
> > all linux kernel recipe with name "linux-%" to enjoy the
> > kernel config from virtualization layer.
> 
> The generic bbappend makes sense, but having them completely
> unversioned is an issue. Having them completely generic gives us no
> way to adjust the names as they change over time (and they do) and can
> give the false impression that they've been tested or are valid for
> any version.
> 
> Last I checked, the % wildcard means "until the end", so we can't do
> linux-%_<version>.bbappend
> 
> I've always had the LINUX_VERSION variable in linux-yocto for cases
> like this, so I'm wondering if not only can we check the distro
> feature, but can we also check the version before doing the kernel
> feature addition ?
> 
> I've cc'd Richard, in case he sees this and can offer a suggestion.
> 
> I'll think on this more, since I'd rather collapse all the
> linux-yocto* bbappends, into a single bbappend that works like this,
> so not only can it be used by other kernels, I can actually test it :D

I've come up with the following patch. It works for linux-yocto*, and
is setup to work for any fragment enabled kernel.

I'm sure someone will point out a parse ordering, or some other
corner case, but this is the direction I'd like to go with this.

Cheers,

Bruce

> 
> Bruce
> 
> 
> >
> > [YOCTO #13727]
> >
> > Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> > ---
> >  recipes-kernel/linux/linux-%.bbappend | 1 +
> >  1 file changed, 1 insertion(+)
> >  create mode 100644 recipes-kernel/linux/linux-%.bbappend
> >
> > diff --git a/recipes-kernel/linux/linux-%.bbappend b/recipes-kernel/linux/linux-%.bbappend
> > new file mode 100644
> > index 0000000..20eeba9
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-%.bbappend
> > @@ -0,0 +1 @@
> > +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux-yocto_virtualization.inc', '', d)}
> > --
> > 2.7.4
> >
> > 
> 
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--CE+1k2dSO48ffgeK
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-kernel-allow-fragment-re-use-from-any-aware-kernel.patch"

From f2f36a8061c600b35b5f0ce1599d59f1d144a3aa Mon Sep 17 00:00:00 2001
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 26 Feb 2020 08:53:04 -0500
Subject: [PATCH] kernel: allow fragment re-use from any aware kernel

The kernel fragments contained in this layer could not easily
be consumed by any fragment aware kernel not called "linux-yocto".

To make them easier to include, we make the bbappend more generic,
to match any linux*.bb recipe (note: this means it will match
things like linux-atm.bb as well).

To avoid adding the fragments to recipes that can't use them,
or to a version that hasn't been valided, we use the LINUX_VERSION
variable to pull out the major/minor kernel release and then
include a specific version of the .inc file.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-kernel/linux/linux-%.bbappend                  | 10 ++++++++++
 recipes-kernel/linux/linux-yocto-rt_%.bbappend         |  1 -
 recipes-kernel/linux/linux-yocto_5.2.bbappend          |  1 -
 .../linux/linux-yocto_5.2_virtualization.inc           |  4 ++++
 recipes-kernel/linux/linux-yocto_5.4.bbappend          |  1 -
 .../linux/linux-yocto_5.4_virtualization.inc           |  4 ++++
 6 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-%.bbappend
 delete mode 100644 recipes-kernel/linux/linux-yocto-rt_%.bbappend
 delete mode 100644 recipes-kernel/linux/linux-yocto_5.2.bbappend
 create mode 100644 recipes-kernel/linux/linux-yocto_5.2_virtualization.inc
 delete mode 100644 recipes-kernel/linux/linux-yocto_5.4.bbappend
 create mode 100644 recipes-kernel/linux/linux-yocto_5.4_virtualization.inc

diff --git a/recipes-kernel/linux/linux-%.bbappend b/recipes-kernel/linux/linux-%.bbappend
new file mode 100644
index 0000000..2a2335b
--- /dev/null
+++ b/recipes-kernel/linux/linux-%.bbappend
@@ -0,0 +1,10 @@
+# any kernel recipe with fragment support, that sets LINUX_VERSION to one of the tested
+# values, will get the appropriate fragments included in their SRC_URI
+
+LINUX_MAJOR = "${@(d.getVar('LINUX_VERSION') or "x.y").split('.')[0]}"
+LINUX_MINOR = "${@(d.getVar('LINUX_VERSION') or "x.y").split('.')[1]}"
+
+include ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux-yocto_${LINUX_MAJOR}.${LINUX_MINOR}_virtualization.inc', '', d)}
+
+
+
diff --git a/recipes-kernel/linux/linux-yocto-rt_%.bbappend b/recipes-kernel/linux/linux-yocto-rt_%.bbappend
deleted file mode 100644
index 20eeba9..0000000
--- a/recipes-kernel/linux/linux-yocto-rt_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux-yocto_virtualization.inc', '', d)}
diff --git a/recipes-kernel/linux/linux-yocto_5.2.bbappend b/recipes-kernel/linux/linux-yocto_5.2.bbappend
deleted file mode 100644
index 617cacc..0000000
--- a/recipes-kernel/linux/linux-yocto_5.2.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-kernel/linux/linux-yocto_5.2_virtualization.inc b/recipes-kernel/linux/linux-yocto_5.2_virtualization.inc
new file mode 100644
index 0000000..5931148
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto_5.2_virtualization.inc
@@ -0,0 +1,4 @@
+# include the baseline meta virtualization configuration options
+# after this include, we can do version specific things
+
+include linux-yocto_virtualization.inc
diff --git a/recipes-kernel/linux/linux-yocto_5.4.bbappend b/recipes-kernel/linux/linux-yocto_5.4.bbappend
deleted file mode 100644
index 617cacc..0000000
--- a/recipes-kernel/linux/linux-yocto_5.4.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-kernel/linux/linux-yocto_5.4_virtualization.inc b/recipes-kernel/linux/linux-yocto_5.4_virtualization.inc
new file mode 100644
index 0000000..5931148
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto_5.4_virtualization.inc
@@ -0,0 +1,4 @@
+# include the baseline meta virtualization configuration options
+# after this include, we can do version specific things
+
+include linux-yocto_virtualization.inc
-- 
2.19.1


--CE+1k2dSO48ffgeK--
