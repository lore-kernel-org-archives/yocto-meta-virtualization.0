Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.78002.1638286610260058060
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 07:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z/l69OEL;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so18562648pjb.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Nov 2021 07:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rXS8shFK3q9hHDOher7bRgq5S9zbeYxUooJUD08Ll24=;
        b=Z/l69OELQpOA6y0balwV5J5B6WkVoFzOGNexdSZinpFy9i294qul1q2NtlPrdlnvUi
         Q0WCKRvrxs92WfMf0eQFG5vUgqe+fmjbSF79wjw0R3mN8vpf0WvW1VpQn1uWCT6uCeYg
         ahaABTODivPscUEf6DTpxLmHIEJSyoNz1f9bUSsMTqVSq7L8nyYSNUw6pWGGgSxn/hRb
         0neGmK7kG+YBmk846J6e3K10g/DlQnvIsBvsZw1IO/brF+IE3vod2lke/P6OBISpuVif
         HzthJimknmDrw7uhJN+NI+vyYXWluwQJA0K0L9gByaNe1OVaHtfwpNM/iinSqV09X6MI
         IyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rXS8shFK3q9hHDOher7bRgq5S9zbeYxUooJUD08Ll24=;
        b=DzD3fmVEBitSjfSFuiOiuzj9FvJpfd+hXMJGLBY2IX1jZf07GoZRVoRa6UAD0Rfm7W
         TIji6aUg9ZWB+0wemNUYh91aYFypWhYjjuB+8Pyd8kitASRnB+AbgZ+jqbiS03yQXhvR
         IDoJI0bwd+2thImaTNxUE0l0COXFlHp9iMTj8/XNFibPBzwbiBCNyTIn2eupsJiQ2ohl
         gf+zaBbXnpn3I94kM1EsRh3OVEii8jfjGfA226Mowhho50HHJ8yf61IEKGQ5v/Fwarp6
         qnk11hsL0SxUEeQKzSRdWI1AgCzrgBZz3lidnGDQ82kRw8Z1yQzC7h6hKJnzWLZBLQYG
         SDJg==
X-Gm-Message-State: AOAM533J3LAXGNMTJ/6Row6fEpYBoNJFD6cxDsgodAFV35gsCELid+8/
	ElKasPKHivP+pBL8Cxu1gb6bO5nBy9rJqQFI1bA=
X-Google-Smtp-Source: ABdhPJyQfQ1T0ItRVxipNClAU9s/GUL/bQpeycTilqsVZxM1gaBapRH7FF3J8kL620eLwEF8zaib7cAmFfnHqGTIXuo=
X-Received: by 2002:a17:90a:e60a:: with SMTP id j10mr122731pjy.169.1638286609739;
 Tue, 30 Nov 2021 07:36:49 -0800 (PST)
MIME-Version: 1.0
References: <16946C428749E68B.14137@lists.yoctoproject.org>
 <16946CAE23AAF8C1.14473@lists.yoctoproject.org> <CA+chaQeaaWZKxtghjxJc2+18zfQx7_NA-UhQgdktpCDqkkFfxQ@mail.gmail.com>
 <CADkTA4MjZg43PJsQdE1tZXctGR6XV5BTjUU6cmqUJJO1ym80mw@mail.gmail.com> <CACMJ4GYtJqmZ7GSrwU5iCW5FtPDPO+hx_PX7GKQJQ1KYMdkD6g@mail.gmail.com>
In-Reply-To: <CACMJ4GYtJqmZ7GSrwU5iCW5FtPDPO+hx_PX7GKQJQ1KYMdkD6g@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 30 Nov 2021 16:36:38 +0100
Message-ID: <CA+chaQfV_OibN5OXwfFjMqYYZ9X7Z7FEq+uOMQSRXz4LvCsqfg@mail.gmail.com>
Subject: Re: [meta-virtualization][dunfell][gatesgarth][hardknott][master][PATCH] uxen-guest-tools: inherit dos2unix to fix do_patch failure
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000069f58e05d20353e7"

--00000000000069f58e05d20353e7
Content-Type: text/plain; charset="UTF-8"

Hi Christopher,

any update on this?

Bruce tried to fix this MODULE_LICENSE issue recently in:
https://git.yoctoproject.org/meta-virtualization/diff/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-kernel-s-5.4.patch?id=844f4e1d7be32b4888193357d944fcf84170d019

but it still fails for newer kernel as shown in:
https://lists.yoctoproject.org/g/meta-virtualization/message/6927

Regards,

On Thu, Jul 29, 2021 at 7:53 PM Christopher Clark <
christopher.w.clark@gmail.com> wrote:

> On Fri, Jul 23, 2021 at 9:55 AM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> > On Fri, Jul 23, 2021 at 9:29 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> > >
> > > it builds ok with 5.4 in dunfell now, only gatesgarth with 5.8 and
> newer with 5.10 kernel are broken
> > >
> >
> > I've applied your patch, and have pushed it to the repo.
> >
> > I'm also seeing the build failure now.
> >
> > I tried to bump the version of the package, but it still has the same
> > kernel build issue. (my efforts are here:
> >
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-test&id=3ae2e9b3036890968cb9b152d128db9b47f01c89
> )
> >
> > Christoper: did you want to take a look at the uprev / fix of the build ?
>
> A quick update on this: I did take a look and repro'd the build
> failure with the current Linux 5.10 kernel.
> I've filed a ticket on the upstream project issue tracker with some
> details and am waiting on a response.
>
> Christopher
>
> >
> > Bruce
> >
> >
> > > On Fri, Jul 23, 2021 at 2:54 PM Martin Jansa via
> lists.yoctoproject.org <Martin.Jansa=gmail.com@lists.yoctoproject.org>
> wrote:
> > >>
> > >> Now with do_patch fixed it fails a bit later in do_compile with:
> > >>
> > >> | make[1]: warning: jobserver unavailable: using -j1.  Add '+' to
> parent make rule.
> > >> | make[1]: Entering directory
> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> > >> | make[2]: Entering directory
> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-build-artifacts'
> > >> |   CC [M]
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.o
> > >> |
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:
> In function 'uxen_hypercall_init':
> > >> |
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:127:24:
> error: too many arguments to function '__vmalloc'
> > >> |   127 |         uxen_hcbase =  __vmalloc(PAGE_SIZE, GFP_KERNEL,
> PAGE_KERNEL_EXEC);
> > >> |       |                        ^~~~~~~~~
> > >> | In file included from
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:9:
> > >> |
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/vmalloc.h:131:14:
> note: declared here
> > >> |   131 | extern void *__vmalloc(unsigned long size, gfp_t gfp_mask);
> > >> |       |              ^~~~~~~~~
> > >> | In file included from
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:21,
> > >> |                  from
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:3:
> > >> |
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:
> At top level:
> > >> |
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:182:43:
> error: expected ',' or ';' before 'KBUILD_MODFILE'
> > >> |   182 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
> > >> |       |                                           ^~~~~~~~~~~~~~
> > >> |
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/moduleparam.h:26:61:
> note: in definition of macro '__MODULE_INFO'
> > >> |    26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "="
> info
> > >> |       |
>  ^~~~
> > >> |
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:182:25:
> note: in expansion of macro 'MODULE_INFO'
> > >> |   182 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
> > >> |       |                         ^~~~~~~~~~~
> > >> |
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:229:34:
> note: in expansion of macro 'MODULE_FILE'
> > >> |   229 | #define MODULE_LICENSE(_license) MODULE_FILE
> MODULE_INFO(license, _license)
> > >> |       |                                  ^~~~~~~~~~~
> > >> |
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:156:1:
> note: in expansion of macro 'MODULE_LICENSE'
> > >> |   156 | MODULE_LICENSE("GPL");
> > >> |       | ^~~~~~~~~~~~~~
> > >>
> > >> at least with oe-core/master, will check with older kernel in dunfell
> next.
> > >>
> > >> On Fri, Jul 23, 2021 at 2:46 PM Martin Jansa via
> lists.yoctoproject.org <Martin.Jansa=gmail.com@lists.yoctoproject.org>
> wrote:
> > >>>
> > >>> * fixes:
> > >>>   ERROR: uxen-guest-tools-4.1.7-r0 do_patch: Command Error: 'quilt
> --quiltrc
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/recipe-sysroot-native/etc/quiltrc
> push' exited with 0  Output:
> > >>>   stdout: Applying patch fix-Makefile-for-OE-kernel-build.patch
> > >>>   patching file Makefile
> > >>>   Hunk #1 FAILED at 1 (different line endings).
> > >>>   Hunk #2 FAILED at 19 (different line endings).
> > >>>   2 out of 2 hunks FAILED -- rejects in file Makefile
> > >>>   Patch fix-Makefile-for-OE-kernel-build.patch does not apply
> (enforce with -f)
> > >>>
> > >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >>> ---
> > >>>  recipes-extended/uxen/uxen-guest-tools_4.1.7.bb | 2 +-
> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> > >>> index 757f1e3..4dcfe51 100644
> > >>> --- a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> > >>> +++ b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> > >>> @@ -19,4 +19,4 @@ LIC_FILES_CHKSUM =
> "file://../Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df
> > >>>
> > >>>  S = "${WORKDIR}/uxen-vmsupport-linux-${PV}"
> > >>>
> > >>> -inherit module
> > >>> +inherit module dos2unix
> > >>> --
> > >>> 2.30.2
> > >>>
> > >>>
> > >>>
> > >>>
> > >>
> > >>
> > >>
> > >
> > > 
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>

--00000000000069f58e05d20353e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Christopher,<div><br></div><div>any update on this?</di=
v><div><br></div><div>Bruce tried to fix this MODULE_LICENSE issue recently=
 in:</div><div><a href=3D"https://git.yoctoproject.org/meta-virtualization/=
diff/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-k=
ernel-s-5.4.patch?id=3D844f4e1d7be32b4888193357d944fcf84170d019" target=3D"=
_blank">https://git.yoctoproject.org/meta-virtualization/diff/recipes-exten=
ded/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-kernel-s-5.4.patch?=
id=3D844f4e1d7be32b4888193357d944fcf84170d019</a><br></div><div><br></div><=
div>but it still fails for newer kernel as shown in:</div><div><a href=3D"h=
ttps://lists.yoctoproject.org/g/meta-virtualization/message/6927">https://l=
ists.yoctoproject.org/g/meta-virtualization/message/6927</a><br></div><div>=
<br></div><div>Regards,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jul 29, 2021 at 7:53 PM Christopher C=
lark &lt;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank"=
>christopher.w.clark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Fri, Jul 23, 2021 at 9:55 AM Bruce Ashfiel=
d &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.a=
shfield@gmail.com</a>&gt; wrote:<br>
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

--00000000000069f58e05d20353e7--
