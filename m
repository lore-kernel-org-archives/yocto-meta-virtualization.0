Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.8216.1627046987505901864
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 23 Jul 2021 06:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k1j48x5g;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id h8so1776882ede.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 23 Jul 2021 06:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eezR4Q6OwMoPLndzDHuHgno+3qDxDZ0L5gIq6Nk4/qk=;
        b=k1j48x5g+OYaPrUXUjLpFY1IiKOxlDLprd1DhzMCoPyEiULYHykMnh0MYSfXDWWjmL
         r5+77vIH8y8eMH8iozVICNnI1WwXzuno1dRtQnkOtwPxd/iK2Rp7dauzfv/+FGCGmex9
         yiGItjbUKkVdG0HKiBm33PcyO9BLKwMPuGuqylDYO3NVfNakWUvm89wOvKRV00Npws6y
         YE2vGm7dgWzI2py1ntjOx0uE9Kcd24Ozz5dOSNmOPuvIPNT92mVPfOgKNTX9VMXmrKU7
         +oN3VgZM/v9J/t2bBAshW32izOBO12jSjXeq6sMq3q64Ad7n97mXGLvOTa+ltlx7xezh
         5Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eezR4Q6OwMoPLndzDHuHgno+3qDxDZ0L5gIq6Nk4/qk=;
        b=ngOet7w6jb+5ztVmbafgh9GZhaO2duAF2efcrvJk/sA4I1v+l32PMpgT5mTICjN8sx
         aKlj1xp/olZta4BRmGrey/N6mvqHQ4X3DvYxEfvW8YSJB9d6B93uNkSP1x1dgdCogerI
         e8OWqKqBNAwaI8d+ZvDnBMS1XJ9LF7YhCOtSuYhnSPvwwTsA2T5Ora7vi1xHioQqQaXL
         8ybSUZnjZ1gtSmizKuQgWOshAPkIN899Y3joz94377Luzxf2qjRP3rp130/S0UHUIPmN
         Px7Lk4kjX8jNGNOdS6kO2Zc7gy2qRiVA7n1Kt4SlsnWj9O0iEeBl8pnSsm7v5a6ilCQZ
         TF/w==
X-Gm-Message-State: AOAM531+LL473AFdBx4qJu2JzZOn23lGxECzUkI0DmamnShv0QNN7thM
	vTKfbS4CsYJYmC8dpC5Svr2xzqUGAzBH6gyyoI8=
X-Google-Smtp-Source: ABdhPJyCuntWhoQZzTDk+BCulg3U4+sSwBOLlnp0bflIPwxEhOejXmopT5gyaEyeM/HW03+XgYV/+OOYG/cHqLRg7Q0=
X-Received: by 2002:a05:6402:22a3:: with SMTP id cx3mr5725205edb.264.1627046985960;
 Fri, 23 Jul 2021 06:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <16946C428749E68B.14137@lists.yoctoproject.org> <16946CAE23AAF8C1.14473@lists.yoctoproject.org>
In-Reply-To: <16946CAE23AAF8C1.14473@lists.yoctoproject.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 23 Jul 2021 15:29:34 +0200
Message-ID: <CA+chaQeaaWZKxtghjxJc2+18zfQx7_NA-UhQgdktpCDqkkFfxQ@mail.gmail.com>
Subject: Re: [meta-virtualization][dunfell][gatesgarth][hardknott][master][PATCH] uxen-guest-tools: inherit dos2unix to fix do_patch failure
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a193a005c7ca6562"

--000000000000a193a005c7ca6562
Content-Type: text/plain; charset="UTF-8"

it builds ok with 5.4 in dunfell now, only gatesgarth with 5.8 and newer
with 5.10 kernel are broken

On Fri, Jul 23, 2021 at 2:54 PM Martin Jansa via lists.yoctoproject.org
<Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:

> Now with do_patch fixed it fails a bit later in do_compile with:
>
> | make[1]: warning: jobserver unavailable: using -j1.  Add '+' to parent
> make rule.
> | make[1]: Entering directory
> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> | make[2]: Entering directory
> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-build-artifacts'
> |   CC [M]
>  /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.o
> |
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:
> In function 'uxen_hypercall_init':
> |
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:127:24:
> error: too many arguments to function '__vmalloc'
> |   127 |         uxen_hcbase =  __vmalloc(PAGE_SIZE, GFP_KERNEL,
> PAGE_KERNEL_EXEC);
> |       |                        ^~~~~~~~~
> | In file included from
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:9:
> |
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/vmalloc.h:131:14:
> note: declared here
> |   131 | extern void *__vmalloc(unsigned long size, gfp_t gfp_mask);
> |       |              ^~~~~~~~~
> | In file included from
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:21,
> |                  from
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:3:
> |
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:
> At top level:
> |
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:182:43:
> error: expected ',' or ';' before 'KBUILD_MODFILE'
> |   182 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
> |       |                                           ^~~~~~~~~~~~~~
> |
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/moduleparam.h:26:61:
> note: in definition of macro '__MODULE_INFO'
> |    26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
> |       |                                                             ^~~~
> |
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:182:25:
> note: in expansion of macro 'MODULE_INFO'
> |   182 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
> |       |                         ^~~~~~~~~~~
> |
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:229:34:
> note: in expansion of macro 'MODULE_FILE'
> |   229 | #define MODULE_LICENSE(_license) MODULE_FILE
> MODULE_INFO(license, _license)
> |       |                                  ^~~~~~~~~~~
> |
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:156:1:
> note: in expansion of macro 'MODULE_LICENSE'
> |   156 | MODULE_LICENSE("GPL");
> |       | ^~~~~~~~~~~~~~
>
> at least with oe-core/master, will check with older kernel in dunfell next.
>
> On Fri, Jul 23, 2021 at 2:46 PM Martin Jansa via lists.yoctoproject.org
> <Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:
>
>> * fixes:
>>   ERROR: uxen-guest-tools-4.1.7-r0 do_patch: Command Error: 'quilt
>> --quiltrc
>> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/recipe-sysroot-native/etc/quiltrc
>> push' exited with 0  Output:
>>   stdout: Applying patch fix-Makefile-for-OE-kernel-build.patch
>>   patching file Makefile
>>   Hunk #1 FAILED at 1 (different line endings).
>>   Hunk #2 FAILED at 19 (different line endings).
>>   2 out of 2 hunks FAILED -- rejects in file Makefile
>>   Patch fix-Makefile-for-OE-kernel-build.patch does not apply (enforce
>> with -f)
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  recipes-extended/uxen/uxen-guest-tools_4.1.7.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
>> b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
>> index 757f1e3..4dcfe51 100644
>> --- a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
>> +++ b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
>> @@ -19,4 +19,4 @@ LIC_FILES_CHKSUM =
>> "file://../Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df
>>
>>  S = "${WORKDIR}/uxen-vmsupport-linux-${PV}"
>>
>> -inherit module
>> +inherit module dos2unix
>> --
>> 2.30.2
>>
>>
>>
>>
>>
> 
>
>

--000000000000a193a005c7ca6562
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">it builds ok with 5.4 in dunfell now, only gatesgarth with=
 5.8 and newer with 5.10 kernel are broken<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 23, 2021 at 2:54 =
PM Martin Jansa via <a href=3D"http://lists.yoctoproject.org">lists.yoctopr=
oject.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.yoctopro=
ject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Now with do_patc=
h fixed it fails a bit later in do_compile with:<div><br></div><div>| make[=
1]: warning: jobserver unavailable: using -j1.=C2=A0 Add &#39;+&#39; to par=
ent make rule.<br>| make[1]: Entering directory &#39;/OE/build/oe-core/tmp-=
glibc/work-shared/qemux86-64/kernel-source&#39;<br>| make[2]: Entering dire=
ctory &#39;/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-build-=
artifacts&#39;<br>| =C2=A0 CC [M] =C2=A0/OE/build/oe-core/tmp-glibc/work/qe=
mux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxen=
hc/hypercall.o<br>| /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/ux=
en-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c: In f=
unction &#39;uxen_hypercall_init&#39;:<br>| /OE/build/oe-core/tmp-glibc/wor=
k/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/=
uxenhc/hypercall.c:127:24: error: too many arguments to function &#39;__vma=
lloc&#39;<br>| =C2=A0 127 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 uxen_hcbase =3D =C2=
=
=A0__vmalloc(PAGE_SIZE, GFP_KERNEL, PAGE_KERNEL_EXEC);<br>| =C2=A0 =C2=A0 =
=
=C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^~~~~~~~~<br>| In file included from /OE/build/oe-core=
/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsuppor=
t-linux-4.1.7/uxenhc/hypercall.c:9:<br>| /OE/build/oe-core/tmp-glibc/work-s=
hared/qemux86-64/kernel-source/include/linux/vmalloc.h:131:14: note: declar=
ed here<br>| =C2=A0 131 | extern void *__vmalloc(unsigned long size, gfp_t =
gfp_mask);<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^~~~~~~~~<br>| In file included from /OE/build/oe-core/tmp-gl=
ibc/work-shared/qemux86-64/kernel-source/include/linux/module.h:21,<br>| =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /OE/bui=
ld/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxe=
n-vmsupport-linux-4.1.7/uxenhc/hypercall.c:3:<br>| /OE/build/oe-core/tmp-gl=
ibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/uxen-vmsupport-linux=
-4.1.7/uxenhc/hypercall.c: At top level:<br>| /OE/build/oe-core/tmp-glibc/w=
ork-shared/qemux86-64/kernel-source/include/linux/module.h:182:43: error: e=
xpected &#39;,&#39; or &#39;;&#39; before &#39;KBUILD_MODFILE&#39;<br>| =C2=
=
=A0 182 | #define MODULE_FILE =C2=A0 =C2=A0 MODULE_INFO(file, KBUILD_MODFI=
LE);<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~<br>| /OE/build/oe-core/tmp-=
glibc/work-shared/qemux86-64/kernel-source/include/linux/moduleparam.h:26:6=
1: note: in definition of macro &#39;__MODULE_INFO&#39;<br>| =C2=A0 =C2=A02=
6 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __MODULE_IN=
FO_PREFIX __stringify(tag) &quot;=3D&quot; info<br>| =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~<br>| /=
OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/lin=
ux/module.h:182:25: note: in expansion of macro &#39;MODULE_INFO&#39;<br>| =
=
=C2=A0 182 | #define MODULE_FILE =C2=A0 =C2=A0 MODULE_INFO(file, KBUILD_MO=
DFILE);<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~<br>| /OE/build/o=
e-core/tmp-glibc/work-shared/qemux86-64/kernel-source/include/linux/module.=
h:229:34: note: in expansion of macro &#39;MODULE_FILE&#39;<br>| =C2=A0 229=
 | #define MODULE_LICENSE(_license) MODULE_FILE MODULE_INFO(license, _licen=
se)<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~~~~~~~~<br>| /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/u=
xen-guest-tools/4.1.7-r0/uxen-vmsupport-linux-4.1.7/uxenhc/hypercall.c:156:=
1: note: in expansion of macro &#39;MODULE_LICENSE&#39;<br>| =C2=A0 156 | M=
ODULE_LICENSE(&quot;GPL&quot;);<br>| =C2=A0 =C2=A0 =C2=A0 | ^~~~~~~~~~~~~~<=
br></div><div><br></div><div>at least with oe-core/master, will check with =
older kernel in dunfell next.</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 23, 2021 at 2:46 PM Martin J=
ansa via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.=
yoctoproject.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.y=
octoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt;=
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
<br>
<br>
<br>
</blockquote></div>

--000000000000a193a005c7ca6562--
