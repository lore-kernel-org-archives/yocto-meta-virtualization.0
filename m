Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.13037.1627581230144261954
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 10:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hcu+O0Z+;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id n16so2916899oij.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jul 2021 10:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y/PQokjv5Nnk/PU9MgYncQklmbFdyFs09mBQWERj4O4=;
        b=hcu+O0Z+EsvWmeOwJdvFcanOtDCfS9dYqw4MKgJWFgO1pEWjiG+2njsolP84W1vuLE
         YKrFp/cxaEWaZxoel7REnC79CozXfVi8D4g9GM/CdyquD0ByP42nvzOhhWmVi9afNrtJ
         vQccpZ7mKNgqb12qiQQXJBLrh59zeIqFP9V6h3KCdAThRt88tiQjjwVOAYSA7qs4Bq+c
         m/JEi6jBMRzuJ2dVOx4zn7Szb8/1F/mgpXg4BWdJfJ4ND3/YV0maYFCVY2UcxunC5h13
         mnsVliM/UqikIt+KEXHjH0/eBALHCFmm6Kkjb5PamJ5vq/yuLEgXW7VdWm0dcsssdxcC
         frgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y/PQokjv5Nnk/PU9MgYncQklmbFdyFs09mBQWERj4O4=;
        b=OHMtpAq86QbL7Mq0fD5UXmDUWbR53PgJA2IWGkyldLE6yigfLGuKqyDxO7My7tffju
         U1GeCjKsFYZFbXyqq7Qrt518F4M4iorb3n+52kOHSO3Lg4nl/6jOi3C1M9nhTUxtCs8v
         kP2hwt8YuOY6fJm8Pqo+v/1EesC53a9XWJGlAKJFZY74buzOpngxQUILWEdU9OFhMlJx
         GpRFXzmoXSPsbyGjWM8PEfawgypxB/9Uz55TAca2lryL18hPVO+imIzQhKuepfr+ncI/
         XT3NFiXOv6JJOr2QUM1JFr3gsfUHXpONVWbJwt1S6JqIROa9T4X75ElCGCT57KJ8PLPx
         5xlg==
X-Gm-Message-State: AOAM5325++MVDHhZA0zLLPJRFLKd2n+WrDk6Em5997CWt04ZOW5Iap8r
	tTzZL7oW3cg1ItA5uhsCLY6oI1oNx8g6nGtmZXU=
X-Google-Smtp-Source: ABdhPJwLPB9SznDAxv/QRU2YHkUfPUSjpEaxQMjLq4b2Cwx4LW2jzZNjRV1XvjwWJp3zGwMs7VkGyUmwsJusoINyEQM=
X-Received: by 2002:a05:6808:1494:: with SMTP id e20mr10454354oiw.122.1627581229494;
 Thu, 29 Jul 2021 10:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <16946C428749E68B.14137@lists.yoctoproject.org>
 <16946CAE23AAF8C1.14473@lists.yoctoproject.org> <CA+chaQeaaWZKxtghjxJc2+18zfQx7_NA-UhQgdktpCDqkkFfxQ@mail.gmail.com>
 <CADkTA4MjZg43PJsQdE1tZXctGR6XV5BTjUU6cmqUJJO1ym80mw@mail.gmail.com>
In-Reply-To: <CADkTA4MjZg43PJsQdE1tZXctGR6XV5BTjUU6cmqUJJO1ym80mw@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 29 Jul 2021 10:53:38 -0700
Message-ID: <CACMJ4GYtJqmZ7GSrwU5iCW5FtPDPO+hx_PX7GKQJQ1KYMdkD6g@mail.gmail.com>
Subject: Re: [meta-virtualization][dunfell][gatesgarth][hardknott][master][PATCH] uxen-guest-tools: inherit dos2unix to fix do_patch failure
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 23, 2021 at 9:55 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, Jul 23, 2021 at 9:29 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> >
> > it builds ok with 5.4 in dunfell now, only gatesgarth with 5.8 and newer with 5.10 kernel are broken
> >
>
> I've applied your patch, and have pushed it to the repo.
>
> I'm also seeing the build failure now.
>
> I tried to bump the version of the package, but it still has the same
> kernel build issue. (my efforts are here:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-test&id=3ae2e9b3036890968cb9b152d128db9b47f01c89)
>
> Christoper: did you want to take a look at the uprev / fix of the build ?

A quick update on this: I did take a look and repro'd the build
failure with the current Linux 5.10 kernel.
I've filed a ticket on the upstream project issue tracker with some
details and am waiting on a response.

Christopher

>
> Bruce
>
>
> > On Fri, Jul 23, 2021 at 2:54 PM Martin Jansa via lists.yoctoproject.org <Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:
> >>
> >> Now with do_patch fixed it fails a bit later in do_compile with:
> >>
> >> | make[1]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
> >> | make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> >> | make[2]: Entering directory '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-build-artifacts'
> >> |   CC [M]  /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.o
> >> | /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c: In function 'uxen_hypercall_init':
> >> | /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:127:24: error: too many arguments to function '__vmalloc'
> >> |   127 |         uxen_hcbase =  __vmalloc(PAGE_SIZE, GFP_KERNEL, PAGE_KERNEL_EXEC);
> >> |       |                        ^~~~~~~~~
> >> | In file included from /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:9:
> >> | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/vmalloc.h:131:14: note: declared here
> >> |   131 | extern void *__vmalloc(unsigned long size, gfp_t gfp_mask);
> >> |       |              ^~~~~~~~~
> >> | In file included from /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:21,
> >> |                  from /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:3:
> >> | /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c: At top level:
> >> | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:182:43: error: expected ',' or ';' before 'KBUILD_MODFILE'
> >> |   182 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
> >> |       |                                           ^~~~~~~~~~~~~~
> >> | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
> >> |    26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
> >> |       |                                                             ^~~~
> >> | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:182:25: note: in expansion of macro 'MODULE_INFO'
> >> |   182 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
> >> |       |                         ^~~~~~~~~~~
> >> | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:229:34: note: in expansion of macro 'MODULE_FILE'
> >> |   229 | #define MODULE_LICENSE(_license) MODULE_FILE MODULE_INFO(license, _license)
> >> |       |                                  ^~~~~~~~~~~
> >> | /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:156:1: note: in expansion of macro 'MODULE_LICENSE'
> >> |   156 | MODULE_LICENSE("GPL");
> >> |       | ^~~~~~~~~~~~~~
> >>
> >> at least with oe-core/master, will check with older kernel in dunfell next.
> >>
> >> On Fri, Jul 23, 2021 at 2:46 PM Martin Jansa via lists.yoctoproject.org <Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:
> >>>
> >>> * fixes:
> >>>   ERROR: uxen-guest-tools-4.1.7-r0 do_patch: Command Error: 'quilt --quiltrc /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
> >>>   stdout: Applying patch fix-Makefile-for-OE-kernel-build.patch
> >>>   patching file Makefile
> >>>   Hunk #1 FAILED at 1 (different line endings).
> >>>   Hunk #2 FAILED at 19 (different line endings).
> >>>   2 out of 2 hunks FAILED -- rejects in file Makefile
> >>>   Patch fix-Makefile-for-OE-kernel-build.patch does not apply (enforce with -f)
> >>>
> >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>> ---
> >>>  recipes-extended/uxen/uxen-guest-tools_4.1.7.bb | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> >>> index 757f1e3..4dcfe51 100644
> >>> --- a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> >>> +++ b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> >>> @@ -19,4 +19,4 @@ LIC_FILES_CHKSUM = "file://../Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df
> >>>
> >>>  S = "${WORKDIR}/uxen-vmsupport-linux-${PV}"
> >>>
> >>> -inherit module
> >>> +inherit module dos2unix
> >>> --
> >>> 2.30.2
> >>>
> >>>
> >>>
> >>>
> >>
> >>
> >>
> >
> > 
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
