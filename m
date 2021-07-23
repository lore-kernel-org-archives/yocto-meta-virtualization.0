Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.28.1627059337724137989
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 23 Jul 2021 09:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rciVX9pK;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id b7so2567226edu.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 23 Jul 2021 09:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KJbBnJ9UiKjSatHDTExnrjKZx650nQM1YbtcnN+pdNA=;
        b=rciVX9pK7Po4WjjsNlvW0AnDG/kdDtAAkTjr+p3WEJyKMbf2xzuVwjFBN1VXJZI1kg
         JIZjyKcTXnjm5c7/xaeCaL20A1EpcQyPeJ3Bo94d9UyNteqS6ZkLErmXXqrTr/o8DrJ9
         U2XKw/nbkmHMkpB3k6SjKYZIvXMNmocL8WvduIXFOdvVEu1YYvRI5hF8uZspxUkmRy7K
         qw+JEmSOKrkH/dPF+F+jJyqDCqnrjlpI2s7EFM1OwupNVGL21UBZboAMNclM/76q8yEf
         roAQC954JRa8MGdSG3y6hQDC8ZWwSDhAsUMHnchUyiaA8SH74PuZKJLvaRc8YVXJNbEK
         K4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KJbBnJ9UiKjSatHDTExnrjKZx650nQM1YbtcnN+pdNA=;
        b=Fu6CeJlNufWf9c79GNAhpGlzZdo/OD9Jmi17ausyRjlYsjKhns/C8Kgd/76/Y1svTu
         GNQH9k/hb0N+U83C8rmEW6tH7c2wqUksSx2+H/DHidu34bbBB2DDtWulmz0Jzw3EVADQ
         nbgHX2qR+YOCZNBXGvT0yCcFvzL5yusAuyTkYoVf7JhEbPXMETjmGRvoAvrpMlKCMWpT
         b3D16IS/G7GlNCg+sxybQeAPxlFd106z4NoDCwVS+xCH1WPC4QEKMZ12axDUFQDn5Jfi
         tm2EENAVD7lrEA7kv3tRuj9MEV6JzuNmUOoc2GOccrhBhDXxKyCSwtebWBl2VQADzW2w
         ZU9Q==
X-Gm-Message-State: AOAM533n19R5AaEzysUIddfgeLlxWk/XqL5L3+knw99B4bsu3NA7gSkE
	hpEqFIRrzdqGAeWP3+90CB6svGAmQx4gTj2Tb1Q=
X-Google-Smtp-Source: ABdhPJwa+mgTBFrHIvdFKY0lOvlQyIgT1cXILsB0EFnkjHFhOJNJ0vSy0P02FqZg2ylVGNG6ducWP/NNYcTeuIdaphI=
X-Received: by 2002:a05:6402:144f:: with SMTP id d15mr6749520edx.27.1627059336107;
 Fri, 23 Jul 2021 09:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <16946C428749E68B.14137@lists.yoctoproject.org>
 <16946CAE23AAF8C1.14473@lists.yoctoproject.org> <CA+chaQeaaWZKxtghjxJc2+18zfQx7_NA-UhQgdktpCDqkkFfxQ@mail.gmail.com>
In-Reply-To: <CA+chaQeaaWZKxtghjxJc2+18zfQx7_NA-UhQgdktpCDqkkFfxQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 23 Jul 2021 12:55:24 -0400
Message-ID: <CADkTA4MjZg43PJsQdE1tZXctGR6XV5BTjUU6cmqUJJO1ym80mw@mail.gmail.com>
Subject: Re: [meta-virtualization][dunfell][gatesgarth][hardknott][master][PATCH] uxen-guest-tools: inherit dos2unix to fix do_patch failure
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 23, 2021 at 9:29 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> it builds ok with 5.4 in dunfell now, only gatesgarth with 5.8 and newer with 5.10 kernel are broken
>

I've applied your patch, and have pushed it to the repo.

I'm also seeing the build failure now.

I tried to bump the version of the package, but it still has the same
kernel build issue. (my efforts are here:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-test&id=3ae2e9b3036890968cb9b152d128db9b47f01c89)

Christoper: did you want to take a look at the uprev / fix of the build ?

Bruce


> On Fri, Jul 23, 2021 at 2:54 PM Martin Jansa via lists.yoctoproject.org <Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:
>>
>> Now with do_patch fixed it fails a bit later in do_compile with:
>>
>> | make[1]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
>> | make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
>> | make[2]: Entering directory '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-build-artifacts'
>> |   CC [M]  /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.o
>> | /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c: In function 'uxen_hypercall_init':
>> | /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:127:24: error: too many arguments to function '__vmalloc'
>> |   127 |         uxen_hcbase =  __vmalloc(PAGE_SIZE, GFP_KERNEL, PAGE_KERNEL_EXEC);
>> |       |                        ^~~~~~~~~
>> | In file included from /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:9:
>> | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/vmalloc.h:131:14: note: declared here
>> |   131 | extern void *__vmalloc(unsigned long size, gfp_t gfp_mask);
>> |       |              ^~~~~~~~~
>> | In file included from /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:21,
>> |                  from /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:3:
>> | /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c: At top level:
>> | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:182:43: error: expected ',' or ';' before 'KBUILD_MODFILE'
>> |   182 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
>> |       |                                           ^~~~~~~~~~~~~~
>> | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
>> |    26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
>> |       |                                                             ^~~~
>> | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:182:25: note: in expansion of macro 'MODULE_INFO'
>> |   182 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
>> |       |                         ^~~~~~~~~~~
>> | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:229:34: note: in expansion of macro 'MODULE_FILE'
>> |   229 | #define MODULE_LICENSE(_license) MODULE_FILE MODULE_INFO(license, _license)
>> |       |                                  ^~~~~~~~~~~
>> | /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:156:1: note: in expansion of macro 'MODULE_LICENSE'
>> |   156 | MODULE_LICENSE("GPL");
>> |       | ^~~~~~~~~~~~~~
>>
>> at least with oe-core/master, will check with older kernel in dunfell next.
>>
>> On Fri, Jul 23, 2021 at 2:46 PM Martin Jansa via lists.yoctoproject.org <Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:
>>>
>>> * fixes:
>>>   ERROR: uxen-guest-tools-4.1.7-r0 do_patch: Command Error: 'quilt --quiltrc /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
>>>   stdout: Applying patch fix-Makefile-for-OE-kernel-build.patch
>>>   patching file Makefile
>>>   Hunk #1 FAILED at 1 (different line endings).
>>>   Hunk #2 FAILED at 19 (different line endings).
>>>   2 out of 2 hunks FAILED -- rejects in file Makefile
>>>   Patch fix-Makefile-for-OE-kernel-build.patch does not apply (enforce with -f)
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>  recipes-extended/uxen/uxen-guest-tools_4.1.7.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
>>> index 757f1e3..4dcfe51 100644
>>> --- a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
>>> +++ b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
>>> @@ -19,4 +19,4 @@ LIC_FILES_CHKSUM = "file://../Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df
>>>
>>>  S = "${WORKDIR}/uxen-vmsupport-linux-${PV}"
>>>
>>> -inherit module
>>> +inherit module dos2unix
>>> --
>>> 2.30.2
>>>
>>>
>>>
>>>
>>
>>
>>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
