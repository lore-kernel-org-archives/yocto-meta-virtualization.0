Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDCDF34C58
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 14:16:51 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.272894.1776089802694741528
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 07:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SxHPLp1y;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d95017a68so2792584a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776089802; cv=none;
        d=google.com; s=arc-20240605;
        b=ZFuaAmKAAVUCzTgHa0BwE8Y3ToFvd4bRkOE+T12QnRyBROjAEK5C54JwLhWfE6qGh2
         yficydzELfzorxustZdBQ4EEcAFj9J93Bl4fLHUJeUS0ue+tcuDMPq6WxKB4Kwui4mv3
         xOXxaWz8A9CWa2wtF5z9NIiFVl2JHE9CdLu33cCTUjcF0ARSDP+7Z1UZv0aPbcS1IdiQ
         yDwMS52UBVBa/a1OHhuiZFvou1QXzpj3JW34TGkImWAeWqE6amZeRPOrPTVcqL4y1uMi
         +bhGg6OXQb4/GkRNsdqz4oTT1w9I5JQJIOfuS4ZnrTv1jamqyA7cAjHAwCQ8MRJ/DiiZ
         y84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VCJjfLN0cM+XOQRzEWY9PibOgi7MR+/eI6B7MQ+VBVc=;
        fh=T1fsFJFZd3expnPhH4HQBhUXgCpxpAql7h9peGDMJdM=;
        b=lwMjpgaPm81QNJDsbI3mBqwy6gZQIVQp1PcitVUJa9WBKKwFTpUIPBkSdFdlIdh0SS
         zl4yNsM4e8XhMHkViN8/Ht2nkfkYFHJ2etMw3/anSEKhfRT1doVXu0+T/uXA4O5z9lXW
         h3K5ytMgkvxKZAihnSneBYLBWmqit796+x1QVb2w34rE9a2nblFX29lJz5reF2PKzvAa
         7pBCiYfo75UAT+FoSMhkgmTa02wzQ8Bdo3ZnfjfVj5z0bvlDHwp0rSxMnfR/vX2Zf7Vv
         UITm6ACUWbciqBZtX8mfLnhM6WZHm8qXOg+tUKjMYw3n2VRg2zAINZj5+8P5Onf8cJP3
         AOlA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776089802; x=1776694602; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VCJjfLN0cM+XOQRzEWY9PibOgi7MR+/eI6B7MQ+VBVc=;
        b=SxHPLp1ynaN/rq6o3QBGI/fplGanFwYNGT3mb9SHZOhJXYnXUtvPivGjBpSmLThsVm
         AULA27pVrKIec3XWeyZrF7g1y46fHcp9wlDsoj5NiSayxO03O8SoDvvElCRH1AWLwW+m
         tGuz/VkAo9BimQnQkq/sARjuiVF3oPbml5HN4/jDqB7s1R4nLebuyXMEuosSScaM3v1N
         nnqp5BkgkhaDPkfkE/qmMfxPaIVW2T59Jzaq+PheazSrnqCVhayHXU/+8rqCyOXl3wxW
         xjDa0bx+edccva3ZRGLPLTEXBDPfcmuKbq2zmqEJMrHY97yESteoxOH82f+PCgi5Batd
         q59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089802; x=1776694602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCJjfLN0cM+XOQRzEWY9PibOgi7MR+/eI6B7MQ+VBVc=;
        b=RuFtDbvoG/XGd/KFO1I2o/W5i/YW+Pf4ZYJE7yCiqbbIU1T1F3XkHUS+DHQwyX8O6I
         vzJZ+QDOVr+MTgsV8IbA6UjlzXahpt94m/Da24bJu25F3M2RU1mtOT/PtmPUETxxPSnZ
         +YZXEKDOagMnHcFX2SmsMlhQstTseo2Gz/5ecr2mq+/eOWlpFMRUIhDdWBe+B4TP/xNq
         9gqYJ1Km8H7ktMD0KzL2hnsdVpeNk5qmDACQHDb9PK3O2shvj+Z1CtDbl3dBZsGJGhNs
         EMhqXZGLcaRKjlJoxKimm9z9Hze4tEkiSAc3sQiDab43zMF0BWau0twbhuArZ0fgbvtA
         VYgA==
X-Gm-Message-State: AOJu0YwGZNq4fcCzbkZ6PKOMrXwhINQn40SPRpwEcXXPE40CKu6RcUYE
	62puTs/jj/wKJudF8SrfchQMh1qLXaygCFLsIzeLrhoeddWcM991xLmzIJY+ubYDwmvOumzc+FK
	+vuLzcGtR35zrZ4xjExuZBE0HhHpnkgQ=
X-Gm-Gg: AeBDiesdS2hvhtU9jKFfo/6yHUTYLuE0tX4wNCe+87vfSzeElUJ0RhekjrqHlTb9ZaT
	r8BiQFHEfwCDL4l9IfIF+gE2j7ByZjW73jO1S18aKa27kHc/wna2lFtE14PDp3RkijR+167SfAL
	RLbEpDKqIgR2YLYfxcWZzEGR++O+oHWK797aEKFvu2JoG1IFPv438QZduvQpdrLN+w9wg0h1FWE
	6FVjTaeLFobEdwAthDZU6cQjQsYcsnCWLlsx6zBPqQJIdDp+Vu29zfSP83PHkLXucdWzUjqRQ3T
	C0JEBvCQEtnaOpUD9o71YDj8lWbSAG/ESKVpHbrH6RoPHuBlEnc=
X-Received: by 2002:a17:90b:4e85:b0:35d:93ff:2859 with SMTP id
 98e67ed59e1d1-35e42832228mr13406810a91.22.1776089801855; Mon, 13 Apr 2026
 07:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260411101842.3462555-1-zhixiong.chi@windriver.com> <20260411101842.3462555-2-zhixiong.chi@windriver.com>
In-Reply-To: <20260411101842.3462555-2-zhixiong.chi@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 13 Apr 2026 10:16:30 -0400
X-Gm-Features: AQROBzA102h0IdSPalVnVLYjd3BeLUCUjctSYyX1g-vBF_iZ-ntXVB_b_610iSA
Message-ID: <CADkTA4NqpgkTEFRbVb-8NcT+ZP2ahUSNM1i=3OAcFFtF+-EqmQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] libvirt: add secrets PACKAGECONFIG
To: zhixiong.chi@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ba9838064f5821e5"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2026 14:16:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9697

--000000000000ba9838064f5821e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 6:18=E2=80=AFAM Zhixiong Chi via lists.yoctoproject=
.org
<zhixiong.chi=3Dwindriver.com@lists.yoctoproject.org> wrote:

> After being upgraded to v12.1.0, the new
> virt-secret-init-encryption.service
> has been introduced, and it requires systemd to add openssl to
> PACKAGECONFIG.
> Because systemd-creds encrypt command will be executed in the service fil=
e.
>
> Meanwhile this service was added into the dependency chain of the main
> service
> libvirtd.service.
>
> In systemd recipe, the openssl PACKAGECONFIG is disabled at default.
> Finally
> the service file virt-secret-init-encryption.service and libvirtd will be
> failed.
>

Considering it didn't exist before, then yes, it is disabled by default.
But that
we can see from the patch.

If the new service was introduced by the uprev, is it enabled by default by
libvirt itself, or is it doing some sort of build time detection ? We need
to
document that in the commit message. That is what your commit message
already implies, I just want it to be clearly stated.

We should also be capturing what the user would see in the system logs,
on the console, or wherever if this service is enabled. Is it an error ? is
it functional ?



>
> So add secrets PACKAGECONFIG for libvirt and conditional removal the new
> virt-secret-init-encryption in the libvirt.service.
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_git.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_git.bb
> b/recipes-extended/libvirt/libvirt_git.bb
> index fbee9c5b..3075149b 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -177,6 +177,8 @@ PACKAGECONFIG[firewalld] =3D "-Dfirewalld=3Denabled,
> -Dfirewalld=3Ddisabled,"
>  PACKAGECONFIG[libpcap] =3D "-Dlibpcap=3Denabled,
> -Dlibpcap=3Ddisabled,libpcap,libpcap"
>  PACKAGECONFIG[numad] =3D "-Dnumad=3Denabled, -Dnumad=3Ddisabled,"
>  PACKAGECONFIG[nftables] =3D ""
> +# Require systemd to add openssl to PACKAGECONFIG, so disable it at
> default.
> +PACKAGECONFIG[secrets] =3D "-Ddriver_secrets=3Denabled,
> -Ddriver_secrets=3Ddisabled,"
>
>  # Enable the Python tool support
>  require libvirt-python.inc
> @@ -225,6 +227,15 @@ do_install:append() {
>                  mv ${D}${prefix}/lib/systemd/system/*
> ${D}${systemd_system_unitdir}
>                  rmdir ${D}${prefix}/lib/systemd/system
> ${D}${prefix}/lib/systemd
>              fi
> +
>

We need a comment above those sed expressions to indicate the final result.
i.e. service is completely removed.

But again, back to my first comments. If libvirt is enabling this by
default, and it
isn't doing some sort of runtime/buildtime detection, is this really the
only way that
libvirt has to disable it ?

Bruce



> +            if ! ${@bb.utils.contains('PACKAGECONFIG', 'secrets', 'true'=
,
> 'false', d)}; then
> +                sed -i \
> +                    -e '/^Requires=3Dvirt-secret-init-encryption.service=
/d'
> \
> +                    -e '/^After=3Dvirt-secret-init-encryption.service/d'=
 \
> +                    -e '/^Environment=3DSECRETS_ENCRYPTION_KEY=3D/d' \
> +                    -e '/^LoadCredentialEncrypted=3D/d' \
> +                    ${D}${systemd_system_unitdir}/libvirtd.service
> +            fi
>         fi
>
>         # The /run/libvirt directories created by the Makefile are
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9692):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9692
> Mute This Topic: https://lists.yoctoproject.org/mt/118773077/1050810
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

--000000000000ba9838064f5821e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 11, 2026 at 6:18=
=E2=80=AFAM Zhixiong Chi via <a href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;zhixiong.chi=3D<a href=3D"mailto:windriver.com@l=
ists.yoctoproject.org">windriver.com@lists.yoctoproject.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">After being upgr=
aded to v12.1.0, the new virt-secret-init-encryption.service<br>
has been introduced, and it requires systemd to add openssl to PACKAGECONFI=
G.<br>
Because systemd-creds encrypt command will be executed in the service file.=
<br>
<br>
Meanwhile this service was added into the dependency chain of the main serv=
ice<br>
libvirtd.service.<br>
<br>
In systemd recipe, the openssl PACKAGECONFIG is disabled at default. Finall=
y<br>
the service file virt-secret-init-encryption.service and libvirtd will be<b=
r>
failed.<br></blockquote><div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Considering it didn&#39;t exist before, then yes, i=
t is disabled by default.=C2=A0 But that</div><div class=3D"gmail_default" =
style=3D"font-size:small">we can see from the patch.<br><br>If the new serv=
ice was introduced by the uprev, is it enabled by default by</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">libvirt itself, or is it doin=
g some sort of build time detection ? We need to</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">document that in the commit message. That=
 is what your commit message</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">already implies, I just want it to be clearly stated.</div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">We shou=
ld also be capturing what the user would see in the system logs,</div><div =
class=3D"gmail_default" style=3D"font-size:small">on the console, or wherev=
er if this service is enabled. Is it an error ? is</div><div class=3D"gmail=
_default" style=3D"font-size:small">it functional ?</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
So add secrets PACKAGECONFIG for libvirt and conditional removal the new<br=
>
virt-secret-init-encryption in the libvirt.service.<br>
<br>
Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.co=
m" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvirt_git.bb</a> | 11 +++++++++++<br>
=C2=A01 file changed, 11 insertions(+)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt_git.bb</a> b/recipes-extended/lib=
virt/<a href=3D"http://libvirt_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>libvirt_git.bb</a><br>
index fbee9c5b..3075149b 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvirt_git.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvirt_git.bb</a><br>
@@ -177,6 +177,8 @@ PACKAGECONFIG[firewalld] =3D &quot;-Dfirewalld=3Denable=
d, -Dfirewalld=3Ddisabled,&quot;<br>
=C2=A0PACKAGECONFIG[libpcap] =3D &quot;-Dlibpcap=3Denabled, -Dlibpcap=3Ddis=
abled,libpcap,libpcap&quot;<br>
=C2=A0PACKAGECONFIG[numad] =3D &quot;-Dnumad=3Denabled, -Dnumad=3Ddisabled,=
&quot;<br>
=C2=A0PACKAGECONFIG[nftables] =3D &quot;&quot;<br>
+# Require systemd to add openssl to PACKAGECONFIG, so disable it at defaul=
t.<br>
+PACKAGECONFIG[secrets] =3D &quot;-Ddriver_secrets=3Denabled, -Ddriver_secr=
ets=3Ddisabled,&quot;<br>
<br>
=C2=A0# Enable the Python tool support<br>
=C2=A0require libvirt-python.inc<br>
@@ -225,6 +227,15 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}${pref=
ix}/lib/systemd/system/* ${D}${systemd_system_unitdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir ${D}${p=
refix}/lib/systemd/system ${D}${prefix}/lib/systemd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">We need a comment above those sed expressions to indicate=
 the final result.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">i.e. service is completely removed.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">But again, back to my first comments. If libvirt is enabling=
 this by default, and it</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">isn&#39;t doing some sort of runtime/buildtime detection, is this=
 really the only way that</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">libvirt has to disable it ?</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! ${@bb.utils.contains(&#39;P=
ACKAGECONFIG&#39;, &#39;secrets&#39;, &#39;true&#39;, &#39;false&#39;, d)};=
 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &=
#39;/^Requires=3Dvirt-secret-init-encryption.service/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &=
#39;/^After=3Dvirt-secret-init-encryption.service/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &=
#39;/^Environment=3DSECRETS_ENCRYPTION_KEY=3D/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &=
#39;/^LoadCredentialEncrypted=3D/d&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}=
${systemd_system_unitdir}/libvirtd.service<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The /run/libvirt directories created by the M=
akefile are <br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9692): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9692" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9692</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118773077/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/118773077/1050810</a><br>
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
rek II<br><br></div></div>

--000000000000ba9838064f5821e5--

