Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.6540.1638927579240013871
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 17:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hHDBNiFK;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id o4so1876706oia.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Dec 2021 17:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=saV8Bdf2O0voUUUU+EPx0qJCTL5roeK2yuDtmKMoX54=;
        b=hHDBNiFKyBqknHFpf5XmhwtptrCaLnR3kI10NRz9PxChSQpbQbmI27a33DJuzR8Nsk
         srtWxGskButJ8wxuocsR/SEfeNdnc3bCBY2MtHgzcKQjFHMkabCLbFIavSKg/FFIWtQy
         vAqg7s3NOE0Wf3xeNHSnWj2J3j9rHyusTxzjQa7/npZyT8PiugD234/AiXoHoK3izpXY
         NWSn/nMDfVjdPeT+eEa1oihUUOFyt07xt9J9w4KhZIJpIwRFA9kbvLcsc1etQhhSjKZG
         wY7r1/uKUvW07ZlTMygoxM4fA63OplalDuVcOJKrzEbDnuluXP9GjlaQro7UKpQcohgi
         f/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=saV8Bdf2O0voUUUU+EPx0qJCTL5roeK2yuDtmKMoX54=;
        b=gFnfS8iiyvlsis32Jnz7fIthy0jQH0iaonOZ2wX8uvwuSKM2V3DP6pL1z/h1/bGtiA
         H1PuV2HtsxhxVq0Ur8s1BNvBrTqAiyQDnhER8kkyinF687vPnZa426lEbRSIi30WogWs
         4M1qj0yhOmqWmVvp//mQiucXk64tkIplSqZdBkYOhleU5M0pTCtft2Kybo+cfZUC7h4T
         jAWq7EqpgzjHmaEhcjXn32pJjbBrGHdqgfry2EFk9UOYWp03xa35shajHsOtLugMcNA5
         xPSUUbMBrBXnVcf6R8bY7K/MXH1ZA6Ag+Ya52kSLDwiWyWoWcnjj2Pww3/4E8u/20tBb
         924Q==
X-Gm-Message-State: AOAM532g4gU0LHLDFxS5LeM3oNnEfl1x1nkmRRIEBDzIhbufda0M0U5P
	WbO13ODu4WOQ/2oqjuD+IiG6JC/iZsjowTARXF0=
X-Google-Smtp-Source: ABdhPJxC3cb6mUVYf9SBW2JEOn26srudpOHfa1xxHxlfYuN3mR6r8fhZ6lPoaOT4VEygNi6hZLXImVJOGDm7YA/j6O4=
X-Received: by 2002:aca:674a:: with SMTP id b10mr8951133oiy.66.1638927578459;
 Tue, 07 Dec 2021 17:39:38 -0800 (PST)
MIME-Version: 1.0
References: <16946C428749E68B.14137@lists.yoctoproject.org>
 <16946CAE23AAF8C1.14473@lists.yoctoproject.org> <CA+chaQeaaWZKxtghjxJc2+18zfQx7_NA-UhQgdktpCDqkkFfxQ@mail.gmail.com>
 <CADkTA4MjZg43PJsQdE1tZXctGR6XV5BTjUU6cmqUJJO1ym80mw@mail.gmail.com>
 <CACMJ4GYtJqmZ7GSrwU5iCW5FtPDPO+hx_PX7GKQJQ1KYMdkD6g@mail.gmail.com>
 <16BC5CFE06DCDDB2.14741@lists.yoctoproject.org> <CA+chaQe2qe_Y=bd6DW-q_-vx9z6ikLmKfqhr7ftdgNh8JZP3rA@mail.gmail.com>
In-Reply-To: <CA+chaQe2qe_Y=bd6DW-q_-vx9z6ikLmKfqhr7ftdgNh8JZP3rA@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 7 Dec 2021 17:39:27 -0800
Message-ID: <CACMJ4GaZMBammS=zvpKeJTTHxLMyeTcBnjXVYffhMq4LMgwt7Q@mail.gmail.com>
Subject: Re: [meta-virtualization][dunfell][gatesgarth][hardknott][master][PATCH] uxen-guest-tools: inherit dos2unix to fix do_patch failure
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000020728105d29890ed"

--00000000000020728105d29890ed
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 30, 2021 at 8:52 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> I've found the cause of MODULE_LICENSE issue and sent updated PATCHv2, see:
> https://lists.yoctoproject.org/g/meta-virtualization/message/6929
> https://lists.yoctoproject.org/g/meta-virtualization/message/6930
>

Hi Martin, Bruce

Apologies for taking a long time to reply to the work on the uxen tools and
thanks to both of you for your patches.


> Christopher can you please try to upstream these changes for newer
> kernels? Me and Bruce both failed to find up2date upstream repo, but you
> mentioned before that you have reported the issue in some upstream
> bugtracker (where you can possibly propose these changes).
>

Ack, and I agree, I would like to get this fixed upstream to retire the
patches. The issue tracker is https://github.com/uxen-virt/uxen/issues and
I'll add a reference to that to the recipe in my next update to it.


>
> I never used uxen-guest-tools, I was fixing it just to resolve build
> failures in world builds, so I haven't tested it in runtime at all.
>

Ack - thanks for addressing the build issue. I've now studied the patches,
the uxen tools driver code and code in Linux, and believe that some
additional changes may be necessary for the newer kernels - I will look
into that (I will need a bit of time, with holidays, end of year etc. -
hope that's ok).

Christopher



>
> Regards,
>
> On Tue, Nov 30, 2021 at 4:36 PM Martin Jansa via lists.yoctoproject.org
> <Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:
>
>> Hi Christopher,
>>
>> any update on this?
>>
>> Bruce tried to fix this MODULE_LICENSE issue recently in:
>>
>> https://git.yoctoproject.org/meta-virtualization/diff/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-kernel-s-5.4.patch?id=844f4e1d7be32b4888193357d944fcf84170d019
>>
>> but it still fails for newer kernel as shown in:
>> https://lists.yoctoproject.org/g/meta-virtualization/message/6927
>>
>> Regards,
>>
>> On Thu, Jul 29, 2021 at 7:53 PM Christopher Clark <
>> christopher.w.clark@gmail.com> wrote:
>>
>>> On Fri, Jul 23, 2021 at 9:55 AM Bruce Ashfield <bruce.ashfield@gmail.com>
>>> wrote:
>>> >
>>> > On Fri, Jul 23, 2021 at 9:29 AM Martin Jansa <Martin.Jansa@gmail.com>
>>> wrote:
>>> > >
>>> > > it builds ok with 5.4 in dunfell now, only gatesgarth with 5.8 and
>>> newer with 5.10 kernel are broken
>>> > >
>>> >
>>> > I've applied your patch, and have pushed it to the repo.
>>> >
>>> > I'm also seeing the build failure now.
>>> >
>>> > I tried to bump the version of the package, but it still has the same
>>> > kernel build issue. (my efforts are here:
>>> >
>>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-test&id=3ae2e9b3036890968cb9b152d128db9b47f01c89
>>> )
>>> >
>>> > Christoper: did you want to take a look at the uprev / fix of the
>>> build ?
>>>
>>> A quick update on this: I did take a look and repro'd the build
>>> failure with the current Linux 5.10 kernel.
>>> I've filed a ticket on the upstream project issue tracker with some
>>> details and am waiting on a response.
>>>
>>> Christopher
>>>
>>> >
>>> > Bruce
>>> >
>>> >
>>> > > On Fri, Jul 23, 2021 at 2:54 PM Martin Jansa via
>>> lists.yoctoproject.org <Martin.Jansa=gmail.com@lists.yoctoproject.org>
>>> wrote:
>>> > >>
>>> > >> Now with do_patch fixed it fails a bit later in do_compile with:
>>> > >>
>>> > >> | make[1]: warning: jobserver unavailable: using -j1.  Add '+' to
>>> parent make rule.
>>> > >> | make[1]: Entering directory
>>> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
>>> > >> | make[2]: Entering directory
>>> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-build-artifacts'
>>> > >> |   CC [M]
>>> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.o
>>> > >> |
>>> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:
>>> In function 'uxen_hypercall_init':
>>> > >> |
>>> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:127:24:
>>> error: too many arguments to function '__vmalloc'
>>> > >> |   127 |         uxen_hcbase =  __vmalloc(PAGE_SIZE, GFP_KERNEL,
>>> PAGE_KERNEL_EXEC);
>>> > >> |       |                        ^~~~~~~~~
>>> > >> | In file included from
>>> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:9:
>>> > >> |
>>> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/vmalloc.h:131:14:
>>> note: declared here
>>> > >> |   131 | extern void *__vmalloc(unsigned long size, gfp_t
>>> gfp_mask);
>>> > >> |       |              ^~~~~~~~~
>>> > >> | In file included from
>>> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:21,
>>> > >> |                  from
>>> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:3:
>>> > >> |
>>> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:
>>> At top level:
>>> > >> |
>>> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:182:43:
>>> error: expected ',' or ';' before 'KBUILD_MODFILE'
>>> > >> |   182 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
>>> > >> |       |                                           ^~~~~~~~~~~~~~
>>> > >> |
>>> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/moduleparam.h:26:61:
>>> note: in definition of macro '__MODULE_INFO'
>>> > >> |    26 |                 = __MODULE_INFO_PREFIX __stringify(tag)
>>> "=" info
>>> > >> |       |
>>>    ^~~~
>>> > >> |
>>> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:182:25:
>>> note: in expansion of macro 'MODULE_INFO'
>>> > >> |   182 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
>>> > >> |       |                         ^~~~~~~~~~~
>>> > >> |
>>> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:229:34:
>>> note: in expansion of macro 'MODULE_FILE'
>>> > >> |   229 | #define MODULE_LICENSE(_license) MODULE_FILE
>>> MODULE_INFO(license, _license)
>>> > >> |       |                                  ^~~~~~~~~~~
>>> > >> |
>>> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:156:1:
>>> note: in expansion of macro 'MODULE_LICENSE'
>>> > >> |   156 | MODULE_LICENSE("GPL");
>>> > >> |       | ^~~~~~~~~~~~~~
>>> > >>
>>> > >> at least with oe-core/master, will check with older kernel in
>>> dunfell next.
>>> > >>
>>> > >> On Fri, Jul 23, 2021 at 2:46 PM Martin Jansa via
>>> lists.yoctoproject.org <Martin.Jansa=gmail.com@lists.yoctoproject.org>
>>> wrote:
>>> > >>>
>>> > >>> * fixes:
>>> > >>>   ERROR: uxen-guest-tools-4.1.7-r0 do_patch: Command Error: 'quilt
>>> --quiltrc
>>> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/recipe-sysroot-native/etc/quiltrc
>>> push' exited with 0  Output:
>>> > >>>   stdout: Applying patch fix-Makefile-for-OE-kernel-build.patch
>>> > >>>   patching file Makefile
>>> > >>>   Hunk #1 FAILED at 1 (different line endings).
>>> > >>>   Hunk #2 FAILED at 19 (different line endings).
>>> > >>>   2 out of 2 hunks FAILED -- rejects in file Makefile
>>> > >>>   Patch fix-Makefile-for-OE-kernel-build.patch does not apply
>>> (enforce with -f)
>>> > >>>
>>> > >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> > >>> ---
>>> > >>>  recipes-extended/uxen/uxen-guest-tools_4.1.7.bb | 2 +-
>>> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>> > >>>
>>> > >>> diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
>>> b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
>>> > >>> index 757f1e3..4dcfe51 100644
>>> > >>> --- a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
>>> > >>> +++ b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
>>> > >>> @@ -19,4 +19,4 @@ LIC_FILES_CHKSUM =
>>> "file://../Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df
>>> > >>>
>>> > >>>  S = "${WORKDIR}/uxen-vmsupport-linux-${PV}"
>>> > >>>
>>> > >>> -inherit module
>>> > >>> +inherit module dos2unix
>>> > >>> --
>>> > >>> 2.30.2
>>> > >>>
>>> > >>>
>>> > >>>
>>> > >>>
>>> > >>
>>> > >>
>>> > >>
>>> > >
>>> > >
>>> > >
>>> >
>>> >
>>> > --
>>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> > thee at its end
>>> > - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>
>> 
>>
>>

--00000000000020728105d29890ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Nov 30, 2021 at 8:52 AM Martin Ja=
nsa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr">I&#39;ve found the cause of=C2=A0M=
ODULE_LICENSE issue and sent updated PATCHv2, see:<div><a href=3D"https://l=
ists.yoctoproject.org/g/meta-virtualization/message/6929" target=3D"_blank"=
>https://lists.yoctoproject.org/g/meta-virtualization/message/6929</a><br><=
/div><div><a href=3D"https://lists.yoctoproject.org/g/meta-virtualization/m=
essage/6930" target=3D"_blank">https://lists.yoctoproject.org/g/meta-virtua=
lization/message/6930</a></div></div></blockquote><div><br></div><div>Hi Ma=
rtin, Bruce</div><div><br></div><div>Apologies for taking a long time to re=
ply to the work on the uxen tools and thanks to both of you for your patche=
s.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div><br></div><div>Christopher can you please try to upstre=
am these changes for newer kernels? Me and Bruce both failed to find up2dat=
e upstream repo, but you mentioned before that you have reported the issue =
in some upstream bugtracker (where you can possibly propose these changes).=
<br></div></div></blockquote><div><br></div><div>Ack, and I agree, I would =
like to get=C2=A0this fixed upstream to retire the patches. The issue track=
er is=C2=A0<a href=3D"https://github.com/uxen-virt/uxen/issues">https://git=
hub.com/uxen-virt/uxen/issues</a> and I&#39;ll add a reference to that to=
=C2=A0the recipe in my next update to it.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div><br=
></div><div>I never used uxen-guest-tools, I was fixing it just to resolve =
build failures in world builds, so I haven&#39;t tested it in runtime at al=
l.</div></div></blockquote><div><br></div><div>Ack - thanks for addressing =
the build issue. I&#39;ve now studied the patches, the uxen tools driver co=
de and code in Linux, and believe that some additional changes may be neces=
sary for the newer kernels - I will look into that (I will need a bit of ti=
me, with holidays, end of year etc. - hope that&#39;s ok).</div><div><br></=
div><div>Christopher</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br></div><div>Regar=
ds,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Nov 30, 2021 at 4:36 PM Martin Jansa via <a href=3D"http:/=
/lists.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;M=
artin.Jansa=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D=
"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Christopher,<d=
iv><br></div><div>any update on this?</div><div><br></div><div>Bruce tried =
to fix this MODULE_LICENSE issue recently in:</div><div><a href=3D"https://=
git.yoctoproject.org/meta-virtualization/diff/recipes-extended/uxen/uxen-gu=
est-tools/0001-vm-support-fix-build-for-kernel-s-5.4.patch?id=3D844f4e1d7be=
32b4888193357d944fcf84170d019" target=3D"_blank">https://git.yoctoproject.o=
rg/meta-virtualization/diff/recipes-extended/uxen/uxen-guest-tools/0001-vm-=
support-fix-build-for-kernel-s-5.4.patch?id=3D844f4e1d7be32b4888193357d944f=
cf84170d019</a><br></div><div><br></div><div>but it still fails for newer k=
ernel as shown in:</div><div><a href=3D"https://lists.yoctoproject.org/g/me=
ta-virtualization/message/6927" target=3D"_blank">https://lists.yoctoprojec=
t.org/g/meta-virtualization/message/6927</a><br></div><div><br></div><div>R=
egards,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Jul 29, 2021 at 7:53 PM Christopher Clark &lt;<a href=
=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">christopher.w.c=
lark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Fri, Jul 23, 2021 at 9:55 AM Bruce Ashfield &lt;<a href=3D=
"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Jul 23, 2021 at 9:29 AM Martin Jansa &lt;<a href=3D"mailto:Mar=
tin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt; it builds ok with 5.4 in dunfell now, only gatesgarth with 5.8 an=
d newer with 5.10 kernel are broken<br>
&gt; &gt;<br>
&gt;<br>
&gt; I&#39;ve applied your patch, and have pushed it to the repo.<br>
&gt;<br>
&gt; I&#39;m also seeing the build failure now.<br>
&gt;<br>
&gt; I tried to bump the version of the package, but it still has the same<=
br>
&gt; kernel build issue. (my efforts are here:<br>
&gt; <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizat=
ion/commit/?h=3Dmaster-test&amp;id=3D3ae2e9b3036890968cb9b152d128db9b47f01c=
89" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/cgit/=
cgit.cgi/meta-virtualization/commit/?h=3Dmaster-test&amp;id=3D3ae2e9b303689=
0968cb9b152d128db9b47f01c89</a>)<br>
&gt;<br>
&gt; Christoper: did you want to take a look at the uprev / fix of the buil=
d ?<br>
<br>
A quick update on this: I did take a look and repro&#39;d the build<br>
failure with the current Linux 5.10 kernel.<br>
I&#39;ve filed a ticket on the upstream project issue tracker with some<br>
details and am waiting on a response.<br>
<br>
Christopher<br>
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt; &gt; On Fri, Jul 23, 2021 at 2:54 PM Martin Jansa via <a href=3D"http:=
//lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctop=
roject.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.yoctopr=
oject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote=
:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Now with do_patch fixed it fails a bit later in do_compile wi=
th:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; | make[1]: warning: jobserver unavailable: using -j1.=C2=A0 A=
dd &#39;+&#39; to parent make rule.<br>
&gt; &gt;&gt; | make[1]: Entering directory &#39;/OE/build/oe-core/tmp-glib=
c/work-shared/qemux86-64/kernel-source&#39;<br>
&gt; &gt;&gt; | make[2]: Entering directory &#39;/OE/build/oe-core/tmp-glib=
c/work-shared/qemux86-64/kernel-build-artifacts&#39;<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0CC [M]=C2=A0 /OE/build/oe-core/tmp-glibc/work/q=
emux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxe=
nhc/hypercall.o<br>
&gt; &gt;&gt; | /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-g=
uest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c: In funct=
ion &#39;uxen_hypercall_init&#39;:<br>
&gt; &gt;&gt; | /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-g=
uest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:127:24: e=
rror: too many arguments to function &#39;__vmalloc&#39;<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0127 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uxen_hcb=
ase =3D=C2=A0 __vmalloc(PAGE_SIZE, GFP_KERNEL, PAGE_KERNEL_EXEC);<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~<br>
&gt; &gt;&gt; | In file included from /OE/build/oe-core/tmp-glibc/work/qemu=
x86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc=
/hypercall.c:9:<br>
&gt; &gt;&gt; | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-s=
ource/include/linux/vmalloc.h:131:14: note: declared here<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0131 | extern void *__vmalloc(unsigned long size=
, gfp_t gfp_mask);<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~~~~~~<br>
&gt; &gt;&gt; | In file included from /OE/build/oe-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/include/linux/module.h:21,<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 from /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-to=
ols/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:3:<br>
&gt; &gt;&gt; | /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-g=
uest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c: At top l=
evel:<br>
&gt; &gt;&gt; | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-s=
ource/include/linux/module.h:182:43: error: expected &#39;,&#39; or &#39;;&=
#39; before &#39;KBUILD_MODFILE&#39;<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0182 | #define MODULE_FILE=C2=A0 =C2=A0 =C2=A0MO=
DULE_INFO(file, KBUILD_MODFILE);<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~<br>
&gt; &gt;&gt; | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-s=
ource/include/linux/moduleparam.h:26:61: note: in definition of macro &#39;=
__MODULE_INFO&#39;<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 26 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D __MODULE_INFO_PREFIX __stringify(tag) &quot;=3D&quo=
t; info<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
&gt; &gt;&gt; | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-s=
ource/include/linux/module.h:182:25: note: in expansion of macro &#39;MODUL=
E_INFO&#39;<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0182 | #define MODULE_FILE=C2=A0 =C2=A0 =C2=A0MO=
DULE_INFO(file, KBUILD_MODFILE);<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~<br>
&gt; &gt;&gt; | /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-s=
ource/include/linux/module.h:229:34: note: in expansion of macro &#39;MODUL=
E_FILE&#39;<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0229 | #define MODULE_LICENSE(_license) MODULE_F=
ILE MODULE_INFO(license, _license)<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ^~~~~~~~~~~<br>
&gt; &gt;&gt; | /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-g=
uest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:156:1: no=
te: in expansion of macro &#39;MODULE_LICENSE&#39;<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0156 | MODULE_LICENSE(&quot;GPL&quot;);<br>
&gt; &gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0| ^~~~~~~~~~~~~~<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; at least with oe-core/master, will check with older kernel in=
 dunfell next.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Fri, Jul 23, 2021 at 2:46 PM Martin Jansa via <a href=3D"h=
ttp://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yo=
ctoproject.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.yoc=
toproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; w=
rote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; * fixes:<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0ERROR: uxen-guest-tools-4.1.7-r0 do_patch: Co=
mmand Error: &#39;quilt --quiltrc /OE/build/oe-core/tmp-glibc/work/qemux86_=
64-oe-linux/uxen-guest-tools/4.1.7-r0/recipe-sysroot-native/etc/quiltrc pus=
h&#39; exited with 0=C2=A0 Output:<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0stdout: Applying patch fix-Makefile-for-OE-ke=
rnel-build.patch<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0patching file Makefile<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0Hunk #1 FAILED at 1 (different line endings).=
<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0Hunk #2 FAILED at 19 (different line endings)=
.<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A02 out of 2 hunks FAILED -- rejects in file Ma=
kefile<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0Patch fix-Makefile-for-OE-kernel-build.patch =
does not apply (enforce with -f)<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.=
Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;=C2=A0 recipes-extended/uxen/<a href=3D"http://uxen-guest-=
tools_4.1.7.bb" rel=3D"noreferrer" target=3D"_blank">uxen-guest-tools_4.1.7=
.bb</a> | 2 +-<br>
&gt; &gt;&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git a/recipes-extended/uxen/<a href=3D"http://uxen=
-guest-tools_4.1.7.bb" rel=3D"noreferrer" target=3D"_blank">uxen-guest-tool=
s_4.1.7.bb</a> b/recipes-extended/uxen/<a href=3D"http://uxen-guest-tools_4=
.1.7.bb" rel=3D"noreferrer" target=3D"_blank">uxen-guest-tools_4.1.7.bb</a>=
<br>
&gt; &gt;&gt;&gt; index 757f1e3..4dcfe51 100644<br>
&gt; &gt;&gt;&gt; --- a/recipes-extended/uxen/<a href=3D"http://uxen-guest-=
tools_4.1.7.bb" rel=3D"noreferrer" target=3D"_blank">uxen-guest-tools_4.1.7=
.bb</a><br>
&gt; &gt;&gt;&gt; +++ b/recipes-extended/uxen/<a href=3D"http://uxen-guest-=
tools_4.1.7.bb" rel=3D"noreferrer" target=3D"_blank">uxen-guest-tools_4.1.7=
.bb</a><br>
&gt; &gt;&gt;&gt; @@ -19,4 +19,4 @@ LIC_FILES_CHKSUM =3D &quot;file://../Br=
omium-4.1.8-Open-Source-Software.pdf;md5=3Dcf120df<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 S =3D &quot;${WORKDIR}/uxen-vmsupport-linux-${PV}&q=
uot;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; -inherit module<br>
&gt; &gt;&gt;&gt; +inherit module dos2unix<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; 2.30.2<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div></div>

--00000000000020728105d29890ed--
