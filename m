Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.1996.1581622345709267556
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 11:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eyV/rqa9;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id r21so8287178edq.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 Feb 2020 11:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6CSNU0ZBZWK1ki0RZtNJ+ZZJhO2NtO9Z2nnNXSyXFPo=;
        b=eyV/rqa9DhYlFhYjhIHkOjwVn8K72NiSilwfO/zRi/9OuhyQi+iFTF49cHGELfHW5S
         gmBeL5PaRDzdXB3gtJaEKD+E4oLRwwsVtqAHtuGNiMY0Mz7p3hImJVHRFHj4XS9AyhDJ
         HO/ywO+dnc1IVXj5563FYF/03xGje1t5qZpufVEpPiqrFm1CiKWEK0pn+DCeV6EWQi4p
         G+ZJGBPgRbcJV3tSdh8eVMFmpmQArCAwZfMFkI3D7JqWR3ZJcW9/qVZsijjkl1jYHkow
         sPH7OryQEGpAuMBPLjBtXddKySvdjJpS0Ea40Ktk0ZnbGq1fOhtDgg9ozJrf5jVOodSa
         mIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6CSNU0ZBZWK1ki0RZtNJ+ZZJhO2NtO9Z2nnNXSyXFPo=;
        b=E+a4nU0P0/a3wigkN7i+zpaBhOfLFW7s645vYKRECRTqHMvXGSV0LBTjYjvx04wAFm
         gwdBjZcEOxR8ZOV79tLqcf628mZtWHuHDYo5Zk5zoPqhgdFk+PrDjjA1gKBckf7gj2wN
         SC4YxyyTdfefqKgJn8J0CoLNgWo3WYlCiv2jKhpHV7HLOez9CU/OGShR06Ip3aolcKa8
         V6Snd6P96cnf8Up/hOPf1FIBI9Qz9Oe3fjELfOtF3nWGQDTqN1XaXRQD0v3G29Veiz3q
         yJaWtyrDJznxOVisKZCd63vT7BY4Ij3gJh58CCHNezIuhO8icYfudkFN4Z0wpZs0mSHM
         2Biw==
X-Gm-Message-State: APjAAAUCqXOvOvMTOSuBON5/81nKAmdPomViUcOetw3W0D9haLuwJXtr
	3HIwHjYGLYm86g3Tihy3vEfwzCdi1N+0tpT8qxQ=
X-Google-Smtp-Source: APXvYqywvhi45ylWyf6NKO6ybK/dh2fM5l7hVwFMbjBKUCNfa9rp83V8deSeD7r/NhJbSOqhtg2QrUt9RHc7xjwNnKg=
X-Received: by 2002:aa7:c616:: with SMTP id h22mr15461975edq.352.1581622344125;
 Thu, 13 Feb 2020 11:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20200213164844.16352-1-scott.branden@broadcom.com>
In-Reply-To: <20200213164844.16352-1-scott.branden@broadcom.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 13 Feb 2020 14:32:13 -0500
Message-ID: <CADkTA4OxNJpiWkYmvjL1_w-wMKAkksThF-0vKwncnnxzqEZ0uw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] ovs: fix python 3.8 dict keys error
To: scott.branden@broadcom.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 11:48 AM Scott Branden via
Lists.Yoctoproject.Org
<scott.branden=broadcom.com@lists.yoctoproject.org> wrote:
>
> From: Rick Liu <rick.liu@broadcom.com>
>
> Backport patch to python 3.8 issue with ovs do_compile runtime error:
> RuntimeError: dictionary keys changed during iteration
>

We already have an uprev to OVS posted to the list yesterday.

So I'm assuming this doesn't happen with the new version, and if it
does, we need a rebased patch.

Bruce

> https://patchwork.ozlabs.org/patch/1162374/
>
> Signed-off-by: Rick Liu <rick.liu@broadcom.com>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  ...on3-dict-key-change-during-iteration.patch | 38 +++++++++++++++++++
>  .../openvswitch/openvswitch_git.bb            |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 recipes-networking/openvswitch/openvswitch-git/fix-python3-dict-key-change-during-iteration.patch
>
> diff --git a/recipes-networking/openvswitch/openvswitch-git/fix-python3-dict-key-change-during-iteration.patch b/recipes-networking/openvswitch/openvswitch-git/fix-python3-dict-key-change-during-iteration.patch
> new file mode 100644
> index 0000000..f9cadd2
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch-git/fix-python3-dict-key-change-during-iteration.patch
> @@ -0,0 +1,38 @@
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
> +---
> + ovsdb/ovsdb-idlc.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
> +index 40fef39edf..22d0a4e22e 100755
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
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 072d7f1..5947759 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -33,6 +33,7 @@ SRC_URI = "file://openvswitch-switch \
>             file://python-switch-remaining-scripts-to-use-python3.patch \
>             file://systemd-update-tool-paths.patch \
>             file://systemd-create-runtime-dirs.patch \
> +           file://fix-python3-dict-key-change-during-iteration.patch \
>             "
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> --
> 2.17.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
