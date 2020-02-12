Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web09.5688.1581520260280464524
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Feb 2020 07:11:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.194, mailfrom: asselsm@gmail.com)
Received: by mail-oi1-f194.google.com with SMTP id q81so2337192oig.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Feb 2020 07:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=20iQOi7wt3QsuEGqFpf/N0gE+KjyatEiuLzDzA9Kg2o=;
        b=djkK1g/dglNWujcwhFXscXL1KYSzfXpISesykFkzeHhYX5zZ5JEutuWXBtqEfszvqP
         Q/6rBALVZyMHtRcf045Gpg1w28VZuX/tHefUBECbBBMZ1NqzBULJ6FNPMrf5I4yo7kYy
         seCKWKatGoLE5ap0Uj77ya/5BAPKvixy8bVnhrgjMtDeQ/wDfuPx+9XTAUnoyZkGI2Uc
         56vddObNXycb7Q4nXFBKtHqoPCh7iXz2aSE9e4aJ8pwhdVSz3nMWmsFlsZayRkjICvUB
         WH3/39xGqSM4V+xTaAby1ffmY2BtFAREo7CCtreOUcxMiUFNsff3gq9U7UgSIunIf32M
         uHfw==
X-Gm-Message-State: APjAAAX/IDpmEu+Jpj6QsX1AnibEM9BH/R5AaQRj0EwunvMr1lCCesgG
	3WZXzykX7qm1WmN2vWnYQOpPLnOaBdv1Q639WFQ=
X-Google-Smtp-Source: APXvYqw3FxjpxY2TfRc8q5Zbna2sk3HQ8vdl87fFT7l/OwGfYp1tROejSj7wzNSE/mC5aaMVF3WcgiefnUd/wFCPa+g=
X-Received: by 2002:a05:6808:b23:: with SMTP id t3mr6599196oij.88.1581520259472;
 Wed, 12 Feb 2020 07:10:59 -0800 (PST)
MIME-Version: 1.0
References: <20200205053030.32955-1-Qi.Chen@windriver.com> <CADkTA4PBHF5H7EwRqt6ESgvBh8jWkrz4qChPXuih+DcYprHtGA@mail.gmail.com>
 <DBB018487F2B2F4EA51053C8975CCBF0F0A7548D@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <DBB018487F2B2F4EA51053C8975CCBF0F0A7548D@ALA-MBD.corp.ad.wrs.com>
Reply-To: mark.asselstine@windriver.com
From: "Mark Asselstine" <asselsm@gmail.com>
Date: Wed, 12 Feb 2020 10:10:48 -0500
Message-ID: <CAPuovE+7z1zXAk_dgr1jR=T4=FS9A_R72s1xBndnSfH-ui-zmw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] openvswitch: backport patch to fix do_compile failure
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 5, 2020 at 9:20 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Hi Bruce,
>
> I'm afraid I don't time doing this work in the coming 2 weeks.
> It would be great if you can uprev it. But I'd suggest we merge this patch first, as it should have no negative effect.
> Thanks.

I will try to get this done today.

MarkA


>
> Best Regards,
> Chen Qi
>
> ________________________________________
> From: Bruce Ashfield [bruce.ashfield@gmail.com]
> Sent: Thursday, February 06, 2020 12:17 AM
> To: Chen, Qi
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][PATCH] openvswitch: backport patch to fix do_compile failure
>
> Since this is for master, I'd prefer that we uprev versus doing a patch.
>
> Is there any issues you were seeing with just bumping the version ?
>
> I can give it a try myself, but won't get to it until next week.
>
> Bruce
>
> On Wed, Feb 5, 2020 at 12:31 AM Chen Qi <Qi.Chen@windriver.com> wrote:
> >
> > Backport a patch to fix do_compile error like below.
> >
> >   RuntimeError: dictionary keys changed during iteration
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  ....in-fix-dict-change-during-iteration.patch | 45 +++++++++++++++++++
> >  .../openvswitch/openvswitch_git.bb            |  1 +
> >  2 files changed, 46 insertions(+)
> >  create mode 100644 recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch
> >
> > diff --git a/recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch b/recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch
> > new file mode 100644
> > index 0000000..ecc2881
> > --- /dev/null
> > +++ b/recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch
> > @@ -0,0 +1,45 @@
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
> > +
> > +Upstream-Status: Backport [https://github.com/openvswitch/ovs/commit/d84109f0b60096ce71cd0537b31b69a7f5ea8756]
> > +
> > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +---
> > + ovsdb/ovsdb-idlc.in | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
> > +index 40fef39ed..22d0a4e22 100755
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
> > +--
> > +2.21.0
> > +
> > diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> > index 072d7f1..fc8777a 100644
> > --- a/recipes-networking/openvswitch/openvswitch_git.bb
> > +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> > @@ -33,6 +33,7 @@ SRC_URI = "file://openvswitch-switch \
> >             file://python-switch-remaining-scripts-to-use-python3.patch \
> >             file://systemd-update-tool-paths.patch \
> >             file://systemd-create-runtime-dirs.patch \
> > +           file://0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch \
> >             "
> >
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> > --
> > 2.21.0
> >
> >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 
