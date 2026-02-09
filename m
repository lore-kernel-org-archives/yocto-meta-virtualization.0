Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358A1EF0708
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 04:38:04 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40760.1770611874967136261
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Feb 2026 20:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f2cUTcqT;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aaf43014d0so2770465ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Feb 2026 20:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770611874; cv=none;
        d=google.com; s=arc-20240605;
        b=g2T/ZBa5RV2Wy6m2nPLlZiWWLBy6r92lN+lIqlbQmtHp9B53BLLBtvEXeWo3GqQpJd
         ambnffhZC+cWSP8vbyMMYT/mNyN/EesY6jjYT8SSetRmaeU0UUI2tFW73qch7RebtjK5
         i9B4C7Dyw/g0HjdqzoyHzTLqZVO/chZ1f/prRmZglCa46IFtJ627cEpRt5EXmzy9nIFv
         Sfi/pXU3iD9kOAi84Pw0qMK2easrnq1+BWNOQP5Vmbul2ZAO4IN02VZjWfpQSpeQrOx1
         V836eUDvZZLhFls1FVSk+B6AHqAi8XNN1Q74LJrVjl+lLIY1RrjJoBx72VHkOY6udOZL
         Xyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=euJs0/1WXAm9ho3SKqu4lcht1sRUtHVhHCL98OanK/s=;
        fh=WIamkgigRrPuRrTCmqWdiyvD1x24b7/l9PiPt/U3Ap0=;
        b=TxqhQ6MYzv5wnGECs+ITXdV84jaqXBTc+9Ao6NrU3QMN5RNSQCosYlW9nK52IcXX3T
         VCuP8xxLRWyu2hlD/KMxJ1esn8eiwauTP6wzJt9bw5V8mNBs8ozYZwODTQLXzRipft1U
         +BQe7U9tOL8Rwcxh+He/nrrC7dPKktV2BN6WaQ57FSdQCYcv4VNtnEuWLutPVyaxvH9F
         zafJH803xxoHF6++GvT+W2g7Dtc/F7b0jGqIy03ehmmKdx/Qf46HEO4MFxS0njBakkI+
         THiPTwSdj48eTvrOjgchA2869M2ZLryeiHh4GdWAsOXbKNiqmhKPijzRl6Qr2rxUHEq6
         4rHw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770611874; x=1771216674; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=euJs0/1WXAm9ho3SKqu4lcht1sRUtHVhHCL98OanK/s=;
        b=f2cUTcqTZPtrmadk3T0hWwweNI+9uzZcUxJP+AzJ1G6nmLcTK48UChqtyGBwsil1Jr
         rPkghNvynk6Lkh8998BPNRJ94Br8VZ3+Vj0/80IRUJAKc9xFp39hORweFPDXdw6NIvE6
         2ivDchu7FhXFntzHhvR05JF/dlqjT51KmJ4JdI1LhiGMgB9qIYFmTzen8R81hkNanYPp
         FfXEr8KDHSF3vlIMbFtrgmuILHkMvwkdQ6ovg3mted20bESEaVpNK59jTHzMGR+qk09C
         PLO5LMPMN24wg5zZmwxw0ljamOeGnIlfIK++vk0ABCH4u/t5VYP8bDYx2nCnNoH3mPDC
         t6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770611874; x=1771216674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euJs0/1WXAm9ho3SKqu4lcht1sRUtHVhHCL98OanK/s=;
        b=OOCiUo8dNGPLa4L/PGMqYKyMZopNV/O4bI/10Ep+c3T0CECYAOe8gSzy8vviyaGV6g
         dbUKmGJB2b3FQ6c42sX4vW2BKA5+4DmWt0jMrvkAzMCGBtLIEAhxYTeBC1THnNfMZORe
         OZ2kgx6CV0nU+aamAn3goU95r+R+QTHNz5bXvk1y4rbUd/uwKj1M8f8771VmShqLoefW
         siSrNt5tg/TPDOMbLgL9+tHZE0fooc8CqjLuI8DlX1zsv7iRiYUTQqkb/xXqnB7XO2VP
         U8/VIOJFcFvUkiGO2y6/izCSsOMhglISkoj18103tGjmmu9N0Ngi9641hBihYk+WP++b
         3c9A==
X-Forwarded-Encrypted: i=1; AJvYcCVLunm0+re7tB9VnPleMDm1zFYgpvjbS1XNhzpFYivwgHOz1vDDyE8DDvvDQGWekahMgzBwfgeqR6aH/ft8jXs1ITxV@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxi5O31NunrGLWHMHfDh3MFSBFNqvY8GUFycJJpYSbMbStG7yJK
	Za+NMRvbdKS/5NoljlezUemoo+fMIyZWyuVIuDvLwjJYwpIpkwmrFrC6DaVjRkGgcykxCEGJ6cl
	A/yRg6SUYRnDLghNVWpztNAdSnbgudXU=
X-Gm-Gg: AZuq6aI3Rb0gf/Occe0d1BZu/POdir556f+0Qfu1O4nusSf0eups45S3zQSYD/xJ4Dl
	imH4pYMNWCU+UzgOMq56YgEYIk+AnSbIIqHeLt7jOAEpQziM+FoLCryORtNz3NF2GO5xK1h3JBh
	lFRtMJAyfw5bnsgcZzR0zcz0X9Rcwsbb7NygvmCxBAM9I/V0aZAV4RgVxx38F/BmRbFmUUsrBf/
	Wge6WizcliHfGr95J2CIgW6gHHLJgZz4HMkL83PHzMrYisaC7ftoZZ28e/XTPbMt955WpNt5czL
	pqSU/CuxfvYkz+X/VR4NIn/US7k5
X-Received: by 2002:a17:903:41d1:b0:2aa:d67b:ef96 with SMTP id
 d9443c01a7336-2aad67bf3b6mr52284835ad.31.1770611874086; Sun, 08 Feb 2026
 20:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20260129224041.2242384-1-ricardo.salveti@oss.qualcomm.com> <1891361AB6B1D695.3765343@lists.yoctoproject.org>
In-Reply-To: <1891361AB6B1D695.3765343@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 8 Feb 2026 23:37:42 -0500
X-Gm-Features: AZwV_Qj3zgj1VQPgx076jJG7SO9iEx8sjPziu7rsj3WPnje3FYbP6tboP9WQKzc
Message-ID: <CADkTA4MsCcW6htU6ViLUYidVmR_EmsGZK0pa85YOC24sqNauPg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] lxc: restore DEBUG_PREFIX_MAP in
 TARGET_LDFLAGS for LTO reproducibility
To: bruce.ashfield@gmail.com
Cc: ricardo.salveti@oss.qualcomm.com, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ca42e4064a5cb32e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 04:38:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9566

--000000000000ca42e4064a5cb32e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is now merged, along with the LTS feature work I was doing.

Anyone else reading this, package upgrades and pending patches will land
shortly as well.

Bruce

On Wed, Feb 4, 2026 at 8:40=E2=80=AFPM Bruce Ashfield via lists.yoctoprojec=
t.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

> Thanks Ricardo,
>
> I've been following the OECore discussions on LTO and the prefix maps.
>
> If I'm following correctly, we still need this.
>
> I'm just about to push my container-cross-install baseline, but will get
> to this
> in the next few days.
>
> Bruce
>
> On Thu, Jan 29, 2026 at 5:40=E2=80=AFPM Ricardo Salveti via lists.yoctopr=
oject.org
> <ricardo.salveti=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:
>
>> oe-core [1] removed DEBUG_PREFIX_MAP from TARGET_LDFLAGS to avoid passin=
g
>> prefix-map options via the linker flags. This is fine for most projects
>> since DEBUG_PREFIX_MAP is also provided via CFLAGS at configure time.
>>
>> However, lxc enables LTO by default, which causes link-time code
>> generation
>> to (re)emit debug information during the link step. Without
>> DEBUG_PREFIX_MAP
>> on the link command line, TMPDIR/WORKDIR paths can leak into DWARF,
>> triggering the buildpaths QA check and breaking reproducibility.
>>
>> Append DEBUG_PREFIX_MAP back to TARGET_LDFLAGS for lxc to ensure
>> prefix-map
>> options are visible during LTO link-time compilation.
>>
>> [1]
>>
>> https://git.openembedded.org/openembedded-core/commit/?id=3D1797741aad02=
b8bf429fac4b81e30cdda64b5448
>>
>> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
>> ---
>>  recipes-containers/lxc/lxc_git.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/
>> lxc_git.bb
>> index 542134db..04db2ac0 100644
>> --- a/recipes-containers/lxc/lxc_git.bb
>> +++ b/recipes-containers/lxc/lxc_git.bb
>> @@ -63,6 +63,9 @@ EXTRA_OEMESON +=3D "${PTEST_CONF}
>> -Ddistrosysconfdir=3D${sysconfdir}/default"
>>  # No meson equivalent for these yet
>>  # EXTRA_OECONF +=3D "--enable-log-src-basename --disable-werror"
>>
>> +# LTO is enabled by default, expose prefix-map options to the linker fo=
r
>> reproducibility
>> +TARGET_LDFLAGS:append =3D " ${DEBUG_PREFIX_MAP}"
>> +
>>  PACKAGECONFIG ??=3D "templates \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '',
>> d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '',
>> d)} \
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9558):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9558
> Mute This Topic: https://lists.yoctoproject.org/mt/117535700/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ca42e4064a5cb32e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Thi=
s is now merged, along with the LTS feature work I was doing.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Anyone else reading this, package upgr=
ades and pending patches=C2=A0will land shortly as well.</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Fe=
b 4, 2026 at 8:40=E2=80=AFPM Bruce Ashfield via <a href=3D"http://lists.yoc=
toproject.org">lists.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"m=
ailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Thanks=
 Ricardo,</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ve been f=
ollowing the OECore discussions on LTO and the prefix maps.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">If I&#39;m following correctly, we still=
 need this.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m just =
about to push my container-cross-install baseline, but will get to this</di=
v><div class=3D"gmail_default" style=3D"font-size:small">in the next few da=
ys.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Ja=
n 29, 2026 at 5:40=E2=80=AFPM Ricardo Salveti via <a href=3D"http://lists.y=
octoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;ricardo.s=
alveti=3D<a href=3D"mailto:oss.qualcomm.com@lists.yoctoproject.org" target=
=3D"_blank">oss.qualcomm.com@lists.yoctoproject.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">oe-core [1] removed DEBU=
G_PREFIX_MAP from TARGET_LDFLAGS to avoid passing<br>
prefix-map options via the linker flags. This is fine for most projects<br>
since DEBUG_PREFIX_MAP is also provided via CFLAGS at configure time.<br>
<br>
However, lxc enables LTO by default, which causes link-time code generation=
<br>
to (re)emit debug information during the link step. Without DEBUG_PREFIX_MA=
P<br>
on the link command line, TMPDIR/WORKDIR paths can leak into DWARF,<br>
triggering the buildpaths QA check and breaking reproducibility.<br>
<br>
Append DEBUG_PREFIX_MAP back to TARGET_LDFLAGS for lxc to ensure prefix-map=
<br>
options are visible during LTO link-time compilation.<br>
<br>
[1]<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D1797=
741aad02b8bf429fac4b81e30cdda64b5448" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?id=3D1797741aad02b8b=
f429fac4b81e30cdda64b5448</a><br>
<br>
Signed-off-by: Ricardo Salveti &lt;<a href=3D"mailto:ricardo.salveti@oss.qu=
alcomm.com" target=3D"_blank">ricardo.salveti@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"no=
referrer" target=3D"_blank">lxc_git.bb</a> b/recipes-containers/lxc/<a href=
=3D"http://lxc_git.bb" rel=3D"noreferrer" target=3D"_blank">lxc_git.bb</a><=
br>
index 542134db..04db2ac0 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a><br>
@@ -63,6 +63,9 @@ EXTRA_OEMESON +=3D &quot;${PTEST_CONF} -Ddistrosysconfdir=
=3D${sysconfdir}/default&quot;<br>
=C2=A0# No meson equivalent for these yet<br>
=C2=A0# EXTRA_OECONF +=3D &quot;--enable-log-src-basename --disable-werror&=
quot;<br>
<br>
+# LTO is enabled by default, expose prefix-map options to the linker for r=
eproducibility<br>
+TARGET_LDFLAGS:append =3D &quot; ${DEBUG_PREFIX_MAP}&quot;<br>
+<br>
=C2=A0PACKAGECONFIG ??=3D &quot;templates \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
stemd&#39;, &#39;systemd&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;se=
linux&#39;, &#39;selinux&#39;, &#39;&#39;, d)} \<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9558): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9558" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9558</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117535700/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117535700/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--000000000000ca42e4064a5cb32e--

