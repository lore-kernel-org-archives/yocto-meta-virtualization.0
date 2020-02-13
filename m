Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.2002.1581622398759676227
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 11:33:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=azkgDa18;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id p23so8258722edr.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 Feb 2020 11:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pUPSB/CbS547WGD/yKAnDfLds4feLkXFap7IU/wm/Vo=;
        b=azkgDa18B4rgiR+fAg/0wy4iDyf2TuVBd8VBj0i+xTL5mfmZKNuY914QH8gzTIbIhg
         hHfPXvvalPdUzXFh2vL5obNMKn1MkOVDKILtajx8ZeXF+XDGHJsJDJzrb+tiYsa2sE/e
         lww74San61t20xBwo65upgwaXhMcLeE3cskbEFuxSGjBlqc2MbhaFCATsTLJ51UwEjVn
         yOtBrn6QZfP/TwQ/t6SdX+7DD4j/3dAdV1UzFqQ1iXK3wzexG85B3oMsOmXWx6kgaOEB
         Fb3KLfdtVt97XJuJ4mEaX1i61OutdOU9PGwmpe5K/C/4szfq2N13ab7855ju3kmETalV
         gfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pUPSB/CbS547WGD/yKAnDfLds4feLkXFap7IU/wm/Vo=;
        b=kg4ywbP3VmwyTgfXH7N7WGaogBdmsIqNvOEcWXXlIFcpNKeNm0MAUxYsy7rvL54+4K
         vsC6d+efMVesehn0eAOlmXtHRe+PFBuQG0Cr9KKCdqhpYLFY/fjPHNn1jRcVpLshXV40
         IPwuG3K7Lhdnm7jlH5ddpKkmCC4ERDDVymIfaNOJ81onhKvqCysL/UT/46/lTsyWRdXj
         LGlr5qCYC79spvWYkte6d1lLyYzJrOHKWv5ry+x95zI1mmvH8d3pIVAUQLQQhbESQAoT
         Wkb9prtGG5C7SnY9AggRpD4bgzr1eoEzqUMg613ZFAszVvORiuXhhyAIHm1pN+nF3cxQ
         oLjg==
X-Gm-Message-State: APjAAAV9sUK/os5YmdNYJs09gJTN9Qf+ZIVSMEN2h4nn1+yzXqLhdBMH
	ngW7J0KOdkUCrMD8nXdV6j7NrNa5RZjw1P1E7kdbYUiW
X-Google-Smtp-Source: APXvYqyaKAfIh2Eb/vbgXQD5crB1R8t3R1i4fuw2fivp16ivBcAbRCQBqsMDW3HtGR1i/nblzKeUurAjkiDGo8th/n4=
X-Received: by 2002:a50:aacd:: with SMTP id r13mr16190119edc.129.1581622397308;
 Thu, 13 Feb 2020 11:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20200213164844.16352-1-scott.branden@broadcom.com> <CADkTA4OxNJpiWkYmvjL1_w-wMKAkksThF-0vKwncnnxzqEZ0uw@mail.gmail.com>
In-Reply-To: <CADkTA4OxNJpiWkYmvjL1_w-wMKAkksThF-0vKwncnnxzqEZ0uw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 13 Feb 2020 14:33:06 -0500
Message-ID: <CADkTA4MB8nNttbwCKHxuo2Q8s4XY69fWgDFe8h4UiFms7oOODA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] ovs: fix python 3.8 dict keys error
To: scott.branden@broadcom.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 2:32 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Feb 13, 2020 at 11:48 AM Scott Branden via
> Lists.Yoctoproject.Org
> <scott.branden=broadcom.com@lists.yoctoproject.org> wrote:
> >
> > From: Rick Liu <rick.liu@broadcom.com>
> >
> > Backport patch to python 3.8 issue with ovs do_compile runtime error:
> > RuntimeError: dictionary keys changed during iteration
> >
>
> We already have an uprev to OVS posted to the list yesterday.
>
> So I'm assuming this doesn't happen with the new version, and if it
> does, we need a rebased patch.

Actually, now that I look at it, the patch is part of the rebase, so
we are covered.

Bruce

>
> Bruce
>
> > https://patchwork.ozlabs.org/patch/1162374/
> >
> > Signed-off-by: Rick Liu <rick.liu@broadcom.com>
> > Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> > ---
> >  ...on3-dict-key-change-during-iteration.patch | 38 +++++++++++++++++++
> >  .../openvswitch/openvswitch_git.bb            |  1 +
> >  2 files changed, 39 insertions(+)
> >  create mode 100644 recipes-networking/openvswitch/openvswitch-git/fix-python3-dict-key-change-during-iteration.patch
> >
> > diff --git a/recipes-networking/openvswitch/openvswitch-git/fix-python3-dict-key-change-during-iteration.patch b/recipes-networking/openvswitch/openvswitch-git/fix-python3-dict-key-change-during-iteration.patch
> > new file mode 100644
> > index 0000000..f9cadd2
> > --- /dev/null
> > +++ b/recipes-networking/openvswitch/openvswitch-git/fix-python3-dict-key-change-during-iteration.patch
> > @@ -0,0 +1,38 @@
> > +From d84109f0b60096ce71cd0537b31b69a7f5ea8756 Mon Sep 17 00:00:00 2001
> > +From: Flavio Leitner <fbl@sysclose.org>
> > +Date: Sat, 14 Sep 2019 20:17:28 -0300
> > +Subject: [PATCH] ovsdb-idlc.in: fix dict change during iteration.
> > +
> > +Python3 complains if a dict key is changed during the
> > +iteration.
> > +
> > +Use list() to create a copy of it.
> > +
> > +Traceback (most recent call last):
> > +  File "./ovsdb/ovsdb-idlc.in", line 1581, in <module>
> > +    func(*args[1:])
> > +  File "./ovsdb/ovsdb-idlc.in", line 185, in printCIDLHeader
> > +    replace_cplusplus_keyword(schema)
> > +  File "./ovsdb/ovsdb-idlc.in", line 179, in replace_cplusplus_keyword
> > +    for columnName in table.columns:
> > +RuntimeError: dictionary keys changed during iteration
> > +
> > +Signed-off-by: Flavio Leitner <fbl@sysclose.org>
> > +Signed-off-by: Ben Pfaff <blp@ovn.org>
> > +---
> > + ovsdb/ovsdb-idlc.in | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
> > +index 40fef39edf..22d0a4e22e 100755
> > +--- a/ovsdb/ovsdb-idlc.in
> > ++++ b/ovsdb/ovsdb-idlc.in
> > +@@ -176,7 +176,7 @@ def replace_cplusplus_keyword(schema):
> > +                 'wchar_t', 'while', 'xor', 'xor_eq'}
> > +
> > +     for tableName, table in schema.tables.items():
> > +-        for columnName in table.columns:
> > ++        for columnName in list(table.columns):
> > +             if columnName in keywords:
> > +                 table.columns[columnName + '_'] = table.columns.pop(columnName)
> > +
> > diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> > index 072d7f1..5947759 100644
> > --- a/recipes-networking/openvswitch/openvswitch_git.bb
> > +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> > @@ -33,6 +33,7 @@ SRC_URI = "file://openvswitch-switch \
> >             file://python-switch-remaining-scripts-to-use-python3.patch \
> >             file://systemd-update-tool-paths.patch \
> >             file://systemd-create-runtime-dirs.patch \
> > +           file://fix-python3-dict-key-change-during-iteration.patch \
> >             "
> >
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> > --
> > 2.17.1
> >
> > 
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
