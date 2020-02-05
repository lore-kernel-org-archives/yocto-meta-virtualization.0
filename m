Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web09.585.1580919441223277687
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Feb 2020 08:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dQDuTHAL;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id j17so2761713edp.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Feb 2020 08:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mcGpNRnrO1P0Ki6t4B/O5KTapQNpZyQAIg2DRGlhkOs=;
        b=dQDuTHAL14IduAHmI/IyvIxtsGzercDotSyjrfIjgDsMHyUehAgvt9mCT/yI2gVpJD
         2LgA8lQ5qndPWnRFrgY+1O9M5eQskZ0P1EymH48NPw/SC/ohFyCGKDtceKObJp/L034c
         0ZvURcJuDcFd/yiIadwdXhtGPRF8o/O6PE3spct3lUjeprcWYl+hUi1538uQ9A0gzUh3
         sKJM+mU+Gd9XdSLS+gRc+lO/oZhdOR6f8KFHSGl5mUOzr4viZET9XuSKwAEDnoegd/rd
         5f7JiryGY/aB0agWz+INcaxJVTCY7+8FyE2y9c8fFFEiYEhIPCSOxL0rV353fm+RRJs6
         vF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mcGpNRnrO1P0Ki6t4B/O5KTapQNpZyQAIg2DRGlhkOs=;
        b=jvi7Ddm1jlAB/PWsG+06Zjnn789IVTD3ZW2Myhg6Uip3HLTU3K+WXX6Y6DZnAB58Nt
         AoeQc8lnKKM0mjHyt+vvQYZ60OpT5aJtqfs998zMtHvXBxp/Hp6uBl7vi+Wy0xhWAytx
         vdtAzrB9sQCwrTZMV7VaXU/lquUT8/oF96LYXJz8bIxahC8l6QEHI74Yu3vSL0+EQOFT
         JSaDKk1NBpGcqEZOkE1nl5lMOa79hbDfQyXRJDMwmPNfn8dSeyB+0fER7JrUdciIhQdp
         4BhlBSW3j7lPp0hwjz7wrp+Dt9tjoOkm0lylhIqE4bJtQA/XZ+6H0G/v3nLlJZhkLovh
         QHXA==
X-Gm-Message-State: APjAAAUAVzod/fBP0+/WzyB+tGOBwzrNV1ucxgRwz2KCqwoJiBxdj+X8
	Z4fyPaOocRqNZzKuBWgf0xXDAq5mPbhLvF95J1I=
X-Google-Smtp-Source: APXvYqzoEX36ik7MmNYCnGojSDa9sB4lGF71Ut3g/Uy6q3LkYt6cmRelFUVUD5wta0nRSKo71q73MPMUGD047kh4+rA=
X-Received: by 2002:a17:906:717:: with SMTP id y23mr16301701ejb.339.1580919439617;
 Wed, 05 Feb 2020 08:17:19 -0800 (PST)
MIME-Version: 1.0
References: <20200205053030.32955-1-Qi.Chen@windriver.com>
In-Reply-To: <20200205053030.32955-1-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 5 Feb 2020 11:17:08 -0500
Message-ID: <CADkTA4PBHF5H7EwRqt6ESgvBh8jWkrz4qChPXuih+DcYprHtGA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] openvswitch: backport patch to fix do_compile failure
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Since this is for master, I'd prefer that we uprev versus doing a patch.

Is there any issues you were seeing with just bumping the version ?

I can give it a try myself, but won't get to it until next week.

Bruce

On Wed, Feb 5, 2020 at 12:31 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Backport a patch to fix do_compile error like below.
>
>   RuntimeError: dictionary keys changed during iteration
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ....in-fix-dict-change-during-iteration.patch | 45 +++++++++++++++++++
>  .../openvswitch/openvswitch_git.bb            |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch
>
> diff --git a/recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch b/recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch
> new file mode 100644
> index 0000000..ecc2881
> --- /dev/null
> +++ b/recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch
> @@ -0,0 +1,45 @@
> +From d84109f0b60096ce71cd0537b31b69a7f5ea8756 Mon Sep 17 00:00:00 2001
> +From: Flavio Leitner <fbl@sysclose.org>
> +Date: Sat, 14 Sep 2019 20:17:28 -0300
> +Subject: [PATCH] ovsdb-idlc.in: fix dict change during iteration.
> +
> +Python3 complains if a dict key is changed during the
> +iteration.
> +
> +Use list() to create a copy of it.
> +
> +Traceback (most recent call last):
> +  File "./ovsdb/ovsdb-idlc.in", line 1581, in <module>
> +    func(*args[1:])
> +  File "./ovsdb/ovsdb-idlc.in", line 185, in printCIDLHeader
> +    replace_cplusplus_keyword(schema)
> +  File "./ovsdb/ovsdb-idlc.in", line 179, in replace_cplusplus_keyword
> +    for columnName in table.columns:
> +RuntimeError: dictionary keys changed during iteration
> +
> +Signed-off-by: Flavio Leitner <fbl@sysclose.org>
> +Signed-off-by: Ben Pfaff <blp@ovn.org>
> +
> +Upstream-Status: Backport [https://github.com/openvswitch/ovs/commit/d84109f0b60096ce71cd0537b31b69a7f5ea8756]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + ovsdb/ovsdb-idlc.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
> +index 40fef39ed..22d0a4e22 100755
> +--- a/ovsdb/ovsdb-idlc.in
> ++++ b/ovsdb/ovsdb-idlc.in
> +@@ -176,7 +176,7 @@ def replace_cplusplus_keyword(schema):
> +                 'wchar_t', 'while', 'xor', 'xor_eq'}
> +
> +     for tableName, table in schema.tables.items():
> +-        for columnName in table.columns:
> ++        for columnName in list(table.columns):
> +             if columnName in keywords:
> +                 table.columns[columnName + '_'] = table.columns.pop(columnName)
> +
> +--
> +2.21.0
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 072d7f1..fc8777a 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -33,6 +33,7 @@ SRC_URI = "file://openvswitch-switch \
>             file://python-switch-remaining-scripts-to-use-python3.patch \
>             file://systemd-update-tool-paths.patch \
>             file://systemd-create-runtime-dirs.patch \
> +           file://0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch \
>             "
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> --
> 2.21.0
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
