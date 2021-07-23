Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.7676.1627044860050745221
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 23 Jul 2021 05:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M/grhdDA;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id h10so1614593edv.8
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 23 Jul 2021 05:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A7tDnV5yzam5walFJ6GPgR77QBtin67QCkPJTQuz4b0=;
        b=M/grhdDAGVzdUk3L5dET4OP4vXDXMmzwRsdqty0zfWgjSBoYip41wuLVarNJnR8fTi
         mxdxgGJSADdFyXty0iH3nhzM3dy8eQJjCq3rNqznSRDh6G7uWQ11vfzMWuaYJ5rKs5BR
         xx7SiwYR5zZkaofDAsplE1PyIDbBlAUk5rm+JV3H14ggnRUN8ScuaS1BH0JeiJwTp+ze
         dmPYRgitrW3QAES/L+lfnAFgWLsobSeCyhJJ1ViQLkcBdjYfuCj0UObmixp50JGMOa0Y
         9Cws5NcXXF+ftVtxhtUuJU5X/rNzeyC2m32pI+BpKdFjdojuKofhXXl4mCQnWg6MMWtg
         hf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A7tDnV5yzam5walFJ6GPgR77QBtin67QCkPJTQuz4b0=;
        b=B/MCtgGtGL0jaJiJRBlpCUDdZWFjN+oN2Anzzg8B3MQg0ac2w/TFR8C7e+kPUBkRN0
         NW2orNHgFweF11Ta0Ct8h6x4AiEDsIc5PbiMGoSDMi+wTko5yWxovw2a9o5NT6Uqnnaj
         WuOXK+bQ1frlkF8Xa0EJqf5txGjT77Z9KkgRtz7Hg6orHzYhb/GeZTv+ddbeeu5EmImS
         q/lY37MrkPfI255UU5Gvha69ikoM8r+MywQe/OT75qt7XDrOtKI5cvAuBlKzvWnJGf+e
         hJPo7yfiDMW9s5mZhhKF51b7wOXmoro6fsSMDVZ24/GCCM012EDgA4XyzkslLwoRjF82
         9Z0w==
X-Gm-Message-State: AOAM532uPFiU3Vx+ow/WmkXogcIJ+F8tkEiA+RqnxDenvpXuXrtmfOFb
	Yx6K8JkDBmHf0jubrgj2rtO3LvFLPrq5pFMTR60=
X-Google-Smtp-Source: ABdhPJzgBByUoMVHiCK0jJDOkNDmzM335sd/n43XU4RRq7fpEMM78yl8XyZakOWXnEjzmvKivrGuMg3b57snXo2GcHo=
X-Received: by 2002:a05:6402:1601:: with SMTP id f1mr5372766edv.388.1627044858483;
 Fri, 23 Jul 2021 05:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <16946C428749E68B.14137@lists.yoctoproject.org>
In-Reply-To: <16946C428749E68B.14137@lists.yoctoproject.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 23 Jul 2021 14:54:07 +0200
Message-ID: <CA+chaQdgj7Ja6ykMOgzdFBJT_+ppE5jGB558bY_hYz-SQfTokw@mail.gmail.com>
Subject: Re: [meta-virtualization][dunfell][gatesgarth][hardknott][master][PATCH] uxen-guest-tools: inherit dos2unix to fix do_patch failure
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d2d8af05c7c9e605"

--000000000000d2d8af05c7c9e605
Content-Type: text/plain; charset="UTF-8"

Now with do_patch fixed it fails a bit later in do_compile with:

| make[1]: warning: jobserver unavailable: using -j1.  Add '+' to parent
make rule.
| make[1]: Entering directory
'/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
| make[2]: Entering directory
'/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-build-artifacts'
|   CC [M]
 /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.o
|
/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:
In function 'uxen_hypercall_init':
|
/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:127:24:
error: too many arguments to function '__vmalloc'
|   127 |         uxen_hcbase =  __vmalloc(PAGE_SIZE, GFP_KERNEL,
PAGE_KERNEL_EXEC);
|       |                        ^~~~~~~~~
| In file included from
/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:9:
|
/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/vmalloc.h:131:14:
note: declared here
|   131 | extern void *__vmalloc(unsigned long size, gfp_t gfp_mask);
|       |              ^~~~~~~~~
| In file included from
/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:21,
|                  from
/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:3:
|
/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:
At top level:
|
/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:182:43:
error: expected ',' or ';' before 'KBUILD_MODFILE'
|   182 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
|       |                                           ^~~~~~~~~~~~~~
|
/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/moduleparam.h:26:61:
note: in definition of macro '__MODULE_INFO'
|    26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
|       |                                                             ^~~~
|
/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:182:25:
note: in expansion of macro 'MODULE_INFO'
|   182 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
|       |                         ^~~~~~~~~~~
|
/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:229:34:
note: in expansion of macro 'MODULE_FILE'
|   229 | #define MODULE_LICENSE(_license) MODULE_FILE MODULE_INFO(license,
_license)
|       |                                  ^~~~~~~~~~~
|
/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:156:1:
note: in expansion of macro 'MODULE_LICENSE'
|   156 | MODULE_LICENSE("GPL");
|       | ^~~~~~~~~~~~~~

at least with oe-core/master, will check with older kernel in dunfell next.

On Fri, Jul 23, 2021 at 2:46 PM Martin Jansa via lists.yoctoproject.org
<Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:

> * fixes:
>   ERROR: uxen-guest-tools-4.1.7-r0 do_patch: Command Error: 'quilt
> --quiltrc
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/recipe-sysroot-native/etc/quiltrc
> push' exited with 0  Output:
>   stdout: Applying patch fix-Makefile-for-OE-kernel-build.patch
>   patching file Makefile
>   Hunk #1 FAILED at 1 (different line endings).
>   Hunk #2 FAILED at 19 (different line endings).
>   2 out of 2 hunks FAILED -- rejects in file Makefile
>   Patch fix-Makefile-for-OE-kernel-build.patch does not apply (enforce
> with -f)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/uxen/uxen-guest-tools_4.1.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> index 757f1e3..4dcfe51 100644
> --- a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> +++ b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> @@ -19,4 +19,4 @@ LIC_FILES_CHKSUM =
> "file://../Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df
>
>  S = "${WORKDIR}/uxen-vmsupport-linux-${PV}"
>
> -inherit module
> +inherit module dos2unix
> --
> 2.30.2
>
>
> 
>
>

--000000000000d2d8af05c7c9e605
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Now with do_patch fixed it fails a bit later in do_compile=
 with:<div><br></div><div>| make[1]: warning: jobserver unavailable: using =
-j1.=C2=A0 Add &#39;+&#39; to parent make rule.<br>| make[1]: Entering dire=
ctory &#39;/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source=
&#39;<br>| make[2]: Entering directory &#39;/OE/build/oe-core/tmp-glibc/wor=
k-shared/qemux86-64/kernel-build-artifacts&#39;<br>| =C2=A0 CC [M] =C2=A0/O=
E/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r=
0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.o<br>| /OE/build/oe-core/tmp-=
glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-lin=
ux-4.1.7/uxenhc/hypercall.c: In function &#39;uxen_hypercall_init&#39;:<br>=
| /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1=
.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:127:24: error: too many=
 arguments to function &#39;__vmalloc&#39;<br>| =C2=A0 127 | =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 uxen_hcbase =3D =C2=A0__vmalloc(PAGE_SIZE, GFP_KERNEL, PAGE_=
KERNEL_EXEC);<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~<br>| In file=
 included from /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-gu=
est-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:9:<br>| /O=
E/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linu=
x/vmalloc.h:131:14: note: declared here<br>| =C2=A0 131 | extern void *__vm=
alloc(unsigned long size, gfp_t gfp_mask);<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~<br>| In file includ=
ed from /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/in=
clude/linux/module.h:21,<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0from /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux=
/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:3:=
<br>| /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools=
/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c: At top level:<br>|=
 /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/l=
inux/module.h:182:43: error: expected &#39;,&#39; or &#39;;&#39; before &#3=
9;KBUILD_MODFILE&#39;<br>| =C2=A0 182 | #define MODULE_FILE =C2=A0 =C2=A0 M=
ODULE_INFO(file, KBUILD_MODFILE);<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~=
<br>| /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/incl=
ude/linux/moduleparam.h:26:61: note: in definition of macro &#39;__MODULE_I=
NFO&#39;<br>| =C2=A0 =C2=A026 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D __MODULE_INFO_PREFIX __stringify(tag) &quot;=3D&quot; in=
fo<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 ^~~~<br>| /OE/build/oe-core/tmp-glibc/work-shared/qem=
ux86-64/kernel-source/include/linux/module.h:182:25: note: in expansion of =
macro &#39;MODULE_INFO&#39;<br>| =C2=A0 182 | #define MODULE_FILE =C2=A0 =
=C2=A0 MODULE_INFO(file, KBUILD_MODFILE);<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 ^~~~~~~~~~~<br>| /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64=
/kernel-source/include/linux/module.h:229:34: note: in expansion of macro &=
#39;MODULE_FILE&#39;<br>| =C2=A0 229 | #define MODULE_LICENSE(_license) MOD=
ULE_FILE MODULE_INFO(license, _license)<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~<br>| /OE/build/oe-core/t=
mp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-=
linux-4.1.7/uxenhc/hypercall.c:156:1: note: in expansion of macro &#39;MODU=
LE_LICENSE&#39;<br>| =C2=A0 156 | MODULE_LICENSE(&quot;GPL&quot;);<br>| =C2=
=
=A0 =C2=A0 =C2=A0 | ^~~~~~~~~~~~~~<br></div><div><br></div><div>at least w=
ith oe-core/master, will check with older kernel in dunfell next.</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Jul 23, 2021 at 2:46 PM Martin Jansa via <a href=3D"http://lists.yoctop=
roject.org">lists.yoctoproject.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto=
:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* fixes:=
<br>
=C2=A0 ERROR: uxen-guest-tools-4.1.7-r0 do_patch: Command Error: &#39;quil=
t --quiltrc /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest=
-tools/4.1.7-r0/recipe-sysroot-native/etc/quiltrc push&#39; exited with 0=
=C2=A0 Output:<br>
=C2=A0 stdout: Applying patch fix-Makefile-for-OE-kernel-build.patch<br>
=C2=A0 patching file Makefile<br>
=C2=A0 Hunk #1 FAILED at 1 (different line endings).<br>
=C2=A0 Hunk #2 FAILED at 19 (different line endings).<br>
=C2=A0 2 out of 2 hunks FAILED -- rejects in file Makefile<br>
=C2=A0 Patch fix-Makefile-for-OE-kernel-build.patch does not apply (enforc=
e with -f)<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/uxen/<a href=3D"http://uxen-guest-tools_4.1.7.bb" r=
el=3D"noreferrer" target=3D"_blank">uxen-guest-tools_4.1.7.bb</a> | 2 +-<br=
>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/uxen/<a href=3D"http://uxen-guest-tools_4.1.=
7.bb" rel=3D"noreferrer" target=3D"_blank">uxen-guest-tools_4.1.7.bb</a> b/=
recipes-extended/uxen/<a href=3D"http://uxen-guest-tools_4.1.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">uxen-guest-tools_4.1.7.bb</a><br>
index 757f1e3..4dcfe51 100644<br>
--- a/recipes-extended/uxen/<a href=3D"http://uxen-guest-tools_4.1.7.bb" r=
el=3D"noreferrer" target=3D"_blank">uxen-guest-tools_4.1.7.bb</a><br>
+++ b/recipes-extended/uxen/<a href=3D"http://uxen-guest-tools_4.1.7.bb" r=
el=3D"noreferrer" target=3D"_blank">uxen-guest-tools_4.1.7.bb</a><br>
@@ -19,4 +19,4 @@ LIC_FILES_CHKSUM =3D &quot;file://../Bromium-4.1.8-Open-=
Source-Software.pdf;md5=3Dcf120df<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/uxen-vmsupport-linux-${PV}&quot;<br>
<br>
-inherit module<br>
+inherit module dos2unix<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d2d8af05c7c9e605--
