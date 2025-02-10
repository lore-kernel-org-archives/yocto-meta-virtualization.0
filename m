Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E86C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 04:20:34 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.43558.1739161230628362330
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 20:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FpSv7Zql;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f464b9a27so60349385ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Feb 2025 20:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739161230; x=1739766030; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TZycWqe06taznIGy2o0ZFwRXOlrv8hIwtiMxlVlOxrA=;
        b=FpSv7ZqlBvEnQl0kYvqqBIpRMH0Wz4GRmhkVbyhMlPwpKSRTBhrWpx1pdheOUD8myu
         TDYS3ARMCU+F2UQo1l52m8isikNzD07m2ywfxgnPnkPDJTkcw+PmbUDOC/atKQXlr0va
         v4MdWTDAL0Yz3btQb0kxpP23rBUqqB/jK4MOH6wIgj9xJvcP0aPz6tfSClNHzcnjOmL2
         euVHmDgMpohHstpZl1DxaLxgBnhcRlIZHKWhzEKTM2WnuGYa8o6uy8F8+JG2D+cW+77Z
         eceg7zHJvBQCe9zH/WDc9EgKavbq4qNDY8KRMJIP2Npy0eEpYdZKb3aILBrUt797aRkM
         VDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739161230; x=1739766030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZycWqe06taznIGy2o0ZFwRXOlrv8hIwtiMxlVlOxrA=;
        b=bfcHl956qkNVZJ0nioA4DD1yonu8Udo5SD9Du1Ttv14w+GmMP3fEDGVG11f3MTnIta
         1DQl3/hiqr5d3+1DeexJeWiFeG0VcbsCXrGoUMaq9+5DSgXkZROki3nolLwxaoeCkDNa
         OyGAeZ9hlEDtgb7ovYiLJ8hl7HNoJ2yoyMQuKZVsrSEW+MxpXCxLlzb0VV7OH5+rMvO9
         jjZ3rZZMTNrj79pIdMOSJUD1fdpeNt07C+/kn4ehXrUvWIFv05GpIJG9uhlPrwWTmQmN
         fPzGw4tuZj3SQPv/PYqz5XV9KrNuzQJswhLI79F4dPU3MvobBgOTwjGZo779YPqLR0xX
         /nHQ==
X-Gm-Message-State: AOJu0YxIB72ySNXGYqWtlQ1M80s5Kp1Y2UwVJnvkKyDTVF5ZbppCUeby
	GoI9i+16/iqVnwecSILaLcWprgg9/Dh6gV6MzKXN9P8eU60q5q9U3XfzD69A7BXEVi4s8WNQI3g
	KMXHMhYdk3MNqLQMpJt2MaG/tjG0=
X-Gm-Gg: ASbGnctwmapyanwi9UUqWdz8C3z87EbSTPllI02qnDiEgk0Dk6AsVakZuw8KSLp50G8
	e8U1gaYqq2/9WQrjPPPtIWpiql7KtBedBb/vnxbSXJa5ecVB7n3kiyy/jdUWxOze74K2DndnaNQ
	==
X-Google-Smtp-Source: AGHT+IF0lyjsUCBKkjO3SBSeLxOSTD9sfrdv5uoXymkPsJeksTmSTQyTGoTQAgkm+tCAgFvkGGQm8U8SfqSU7+FCIR8=
X-Received: by 2002:a17:902:d481:b0:206:9a3f:15e5 with SMTP id
 d9443c01a7336-21f4e7260a7mr187805475ad.32.1739161229774; Sun, 09 Feb 2025
 20:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20250210024557.670568-1-hongxu.jia@windriver.com> <20250210024557.670568-2-hongxu.jia@windriver.com>
In-Reply-To: <20250210024557.670568-2-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 9 Feb 2025 23:20:18 -0500
X-Gm-Features: AWEUYZkrWKCcfmsEzuprBFKCbW0w1KdIPBTSaC3bPD62k5Njs-AtWCDrLPhmTys
Message-ID: <CADkTA4PAu0w_xMZv6_jwhHBX9Wm-Gp3bsgCtPaiVutiUOsk61Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] libvirt: add json-c for driver_qemu
To: hongxu.jia@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004ed9cf062dc2072a"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2025 04:20:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9128

--0000000000004ed9cf062dc2072a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 9:46=E2=80=AFPM hongxu via lists.yoctoproject.org
<hongxu.jia=3Deng.windriver.com@lists.yoctoproject.org> wrote:

> After upstreamm applied commit [meson: switch checks to depend on json-c
> as well
> as yajl][1], json-c is required to build QEMU driver. Otherwise build
> libvirt
> failed at do_configure
>
> $ bitbake libvirt
>

Again, you have something different in your environment.

I can build the qemu driver just fine in my configuration.

% bitbake-getvar -r libvirt PACKAGECONFIG
PACKAGECONFIG=3D"gnutls qemu openvz vmware vbox esx lxc test remote
         libvirtd netcf udev python fuse firewalld libpcap
                       libxl                                       "

% bitbake libvirt

.. works. Since qemu is in the default PACAKGECONFIG, you can be assured
that it was built before the updates were pushed. So we need to understand
what is different.

Bruce



> ...
> ../git/meson.build:1672:6: ERROR: Problem encountered: json-c is required
> to build QEMU driver
> ...
>
> [1]
> https://github.com/libvirt/libvirt/commit/28c987263980afc5b606a36a8d264b6=
8cb01e9b9
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_git.bb
> b/recipes-extended/libvirt/libvirt_git.bb
> index 432b5da8..6a524977 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -149,7 +149,7 @@ PACKAGECONFIG:remove:armeb =3D "numactl"
>  # enable,disable,depends,rdepends
>  #
>  PACKAGECONFIG[gnutls] =3D ",,,gnutls-bin"
> -PACKAGECONFIG[qemu] =3D "-Ddriver_qemu=3Denabled -Dqemu_user=3Dqemu
> -Dqemu_group=3Dqemu,-Ddriver_qemu=3Ddisabled,qemu,"
> +PACKAGECONFIG[qemu] =3D "-Ddriver_qemu=3Denabled -Dqemu_user=3Dqemu
> -Dqemu_group=3Dqemu,-Ddriver_qemu=3Ddisabled,qemu json-c,"
>  PACKAGECONFIG[libxl] =3D
> "-Ddriver_libxl=3Denabled,-Ddriver_libxl=3Ddisabled,xen,"
>  PACKAGECONFIG[openvz] =3D
> "-Ddriver_openvz=3Denabled,-Ddriver_openvz=3Ddisabled,,"
>  PACKAGECONFIG[vmware] =3D
> "-Ddriver_vmware=3Denabled,-Ddriver_vmware=3Ddisabled,,"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9126):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9126
> Mute This Topic: https://lists.yoctoproject.org/mt/111096111/1050810
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

--0000000000004ed9cf062dc2072a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 9, 2025 at 9:46=E2=80=
=AFPM hongxu via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank=
">lists.yoctoproject.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windriv=
er.com@lists.yoctoproject.org" target=3D"_blank">eng.windriver.com@lists.yo=
ctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">After upstreamm applied commit [meson: switch checks to depen=
d on json-c as well<br>
as yajl][1], json-c is required to build QEMU driver. Otherwise build libvi=
rt<br>
failed at do_configure<br>
<br>
$ bitbake libvirt<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">Again, you have something different in yo=
ur environment.</div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">I can build the qemu driver just fine in my configuration.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><span=
 class=3D"gmail_default" style=3D"font-size:small">%</span>=C2=A0bitbake-ge=
tvar -r libvirt PACKAGECONFIG<br><div class=3D"gmail_default" style=3D"font=
-size:small">PACKAGECONFIG=3D&quot;gnutls qemu openvz vmware vbox esx lxc t=
est remote =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0libvirtd netcf udev python fuse firewalld libpcap =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxl =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;</div></div><div><br></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small">% bitbake libvirt<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">.. works. Since qemu is i=
n the default PACAKGECONFIG, you can be assured that it was built before th=
e updates were pushed. So we need to understand what is different.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
...<br>
../git/meson.build:1672:6: ERROR: Problem encountered: json-c is required t=
o build QEMU driver<br>
...<br>
<br>
[1] <a href=3D"https://github.com/libvirt/libvirt/commit/28c987263980afc5b6=
06a36a8d264b68cb01e9b9" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/libvirt/libvirt/commit/28c987263980afc5b606a36a8d264b68cb01e9b9</a><br=
>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvirt_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt_git.bb</a> b/recipes-extended/lib=
virt/<a href=3D"http://libvirt_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>libvirt_git.bb</a><br>
index 432b5da8..6a524977 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvirt_git.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvirt_git.bb</a><br>
@@ -149,7 +149,7 @@ PACKAGECONFIG:remove:armeb =3D &quot;numactl&quot;<br>
=C2=A0# enable,disable,depends,rdepends<br>
=C2=A0#<br>
=C2=A0PACKAGECONFIG[gnutls] =3D &quot;,,,gnutls-bin&quot;<br>
-PACKAGECONFIG[qemu] =3D &quot;-Ddriver_qemu=3Denabled -Dqemu_user=3Dqemu -=
Dqemu_group=3Dqemu,-Ddriver_qemu=3Ddisabled,qemu,&quot;<br>
+PACKAGECONFIG[qemu] =3D &quot;-Ddriver_qemu=3Denabled -Dqemu_user=3Dqemu -=
Dqemu_group=3Dqemu,-Ddriver_qemu=3Ddisabled,qemu json-c,&quot;<br>
=C2=A0PACKAGECONFIG[libxl] =3D &quot;-Ddriver_libxl=3Denabled,-Ddriver_libx=
l=3Ddisabled,xen,&quot;<br>
=C2=A0PACKAGECONFIG[openvz] =3D &quot;-Ddriver_openvz=3Denabled,-Ddriver_op=
envz=3Ddisabled,,&quot;<br>
=C2=A0PACKAGECONFIG[vmware] =3D &quot;-Ddriver_vmware=3Denabled,-Ddriver_vm=
ware=3Ddisabled,,&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9126): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9126" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9126</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111096111/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111096111/1050810</a><br>
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
</div>

--0000000000004ed9cf062dc2072a--

