Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.7618.1605619679203967799
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 05:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dOCnZ9x9;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	by mail.yoctoproject.org (Postfix) with ESMTPS id DB1B338C04BB
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 13:27:57 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id q16so7230169edv.10
        for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 05:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0HufG/RHnnFWq2RbLUNWObitTYoKgJgsJUWa7K40suM=;
        b=dOCnZ9x9nESeej/t+UQgr9DtAmV3+Nq6FpsUkoywysj0FuJ4tBIzwZ8DvMaHE+vFfV
         wuci077ph4dpyEfLsVrRha3jl/KjTiSYUaeDQHDauu47eRXksgUHZ6uHZdwcJq9mtUTc
         vUloLBDMI1Bt6fXNYPymAJet0j8bNuBnMHeHUeR+v42yCi0w9fKOSgKArpnTauw/axzn
         jzKNnoV6l2DuJQ9RZ2wbkBE+T4sHOwfPEGjqdStRpKhs4PxNKzUgpPMmvdn/bGjeMHHo
         4GnB8oHkE2wzmU+RWDvG+9810q67xWO/s2XkraQR/STSYw5YD6TlOMBELhUrZFjJqqBO
         dJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0HufG/RHnnFWq2RbLUNWObitTYoKgJgsJUWa7K40suM=;
        b=IqbgCPVZd4JCplJ3TzXS2/8/Oc4U+25+NfpQ4bRKy3ABYZyQZL8Z2sA8jZoi82KTqb
         sJAoc0SVtVES/WtYfB6zkKPipV4PyFu5ASdjyj3WhvTH/43lRS0Lzyo6/qkub3V6dMSj
         PjGxRc6q8CHKgHYLqBhZ9AvbckCOEiSaVFQN2ao/W7lG6neKpa268mr41vEsog1uPNb4
         p7/0M7gB4ox6xW1cw9Zk/fhguVGnZjqEPLpWpyQiRCx9aqfDg1MurQ4mj0VnkLE4exNv
         44JbIacGP/QCUN5a0KoEK7NWhfUNgWSTNHrOiP3fO08FlbGJ4OCNpUnNq+dhIyQHYls4
         AtAQ==
X-Gm-Message-State: AOAM532uQ55XiKR0s/9DRcqSspSR1MNUSlhH9GEEgr5g+6eiuEfnaYph
	ANxAI2pE9nkPPcZD2l5kTV3dyy5GfTLTBOTTeGE=
X-Google-Smtp-Source: ABdhPJzCG2LrTyUNTSroARI0M4e0F2Vb+F9m4vmoWLQHhqI37Q/Pk+CKrg3cQ1Z+SbQDAeKKaBvhdVkZ3gkY5aXH7qc=
X-Received: by 2002:a05:6402:1ca6:: with SMTP id cz6mr20186467edb.129.1605619675856;
 Tue, 17 Nov 2020 05:27:55 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com>
In-Reply-To: <20201117123957.12607-1-joakimr@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 17 Nov 2020 08:27:44 -0500
Message-ID: <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, Joakim Roubert <joakimr@axis.com>
Content-Type: multipart/alternative; boundary="0000000000006c82c205b44d76dd"

--0000000000006c82c205b44d76dd
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2020 at 7:40 AM Joakim Roubert <joakim.roubert@axis.com>
wrote:

> The current stable release installed when running the regular k3s
> install script is now v1.19.3+k3s3. Using that version in our recipe
> also mitigates the fixes for
>

I already have this queued in my WIP branch.

But without being able to assemble a single node working "cluster", this is
still stuck in my staging branch.

Bruce



>
> https://github.com/rancher/kine/issues/61
>
> Change-Id: I4c53d777d4d837628a6c7f8a9234da9d71eb45ae
> Signed-off-by: Joakim Roubert <joakimr@axis.com>
> ---
>  recipes-containers/k3s/k3s_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/
> k3s_git.bb
> index ea5ed75..28ce66b 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "https://k3s.io/"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM =
> "file://${S}/src/import/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>
> -SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.18;name=k3s
> \
> +SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.19;name=k3s
> \
>             file://k3s.service \
>             file://k3s-agent.service \
>             file://k3s-agent \
> @@ -13,9 +13,9 @@ SRC_URI = "git://
> github.com/rancher/k3s.git;branch=release-1.18;name=k3s \
>
> file://0001-Finding-host-local-in-usr-libexec.patch;patchdir=src/import \
>            "
>  SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
> -SRCREV_k3s = "630bebf94b9dce6b8cd3d402644ed023b3af8f90"
> +SRCREV_k3s = "0e4fbfefe1dd8734756dfa4f9ab4fc89665cece4"
>
> -PV = "v1.18.9+git${SRCPV}"
> +PV = "v1.19.3+git${SRCPV}"
>
>  CNI_NETWORKING_FILES ?= "${WORKDIR}/cni-containerd-net.conf"
>
> --
> 2.20.1
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000006c82c205b44d76dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 7:40 AM Joakim Roubert &lt;=
<a href=3D"mailto:joakim.roubert@axis.com">joakim.roubert@axis.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The curre=
nt stable release installed when running the regular k3s<br>
install script is now v1.19.3+k3s3. Using that version in our recipe<br>
also mitigates the fixes for<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">I already have this queued in=
 my WIP branch.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">But witho=
ut being able to assemble a single node working &quot;cluster&quot;, this i=
s still stuck in my staging branch.</div><div class=3D"gmail_default" style=
=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
<a href=3D"https://github.com/rancher/kine/issues/61" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/rancher/kine/issues/61</a><br>
<br>
Change-Id: I4c53d777d4d837628a6c7f8a9234da9d71eb45ae<br>
Signed-off-by: Joakim Roubert &lt;<a href=3D"mailto:joakimr@axis.com" targ=
et=3D"_blank">joakimr@axis.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"noreferr=
er" target=3D"_blank">k3s_git.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">k3s_git.bb</a> b/recipes-containers/k3s/<a hre=
f=3D"http://k3s_git.bb" rel=3D"noreferrer" target=3D"_blank">k3s_git.bb</a>=
<br>
index ea5ed75..28ce66b 100644<br>
--- a/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"noreferr=
er" target=3D"_blank">k3s_git.bb</a><br>
+++ b/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"noreferr=
er" target=3D"_blank">k3s_git.bb</a><br>
@@ -4,7 +4,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://k3s.io/" rel=3D"nore=
ferrer" target=3D"_blank">https://k3s.io/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${S}/src/import/LICENSE;md5=3D2ee4=
1112a44fe7014dce33e26468ba93&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/rancher/k3s.git;bran=
ch=3Drelease-1.18;name=3Dk3s" rel=3D"noreferrer" target=3D"_blank">github.c=
om/rancher/k3s.git;branch=3Drelease-1.18;name=3Dk3s</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/rancher/k3s.git;bran=
ch=3Drelease-1.19;name=3Dk3s" rel=3D"noreferrer" target=3D"_blank">github.c=
om/rancher/k3s.git;branch=3Drelease-1.19;name=3Dk3s</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://k3s.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://k3s-agent.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://k3s-agent \<br>
@@ -13,9 +13,9 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/ran=
cher/k3s.git;branch=3Drelease-1.18;name=3Dk3s" rel=3D"noreferrer" target=3D=
"_blank">github.com/rancher/k3s.git;branch=3Drelease-1.18;name=3Dk3s</a> \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Finding-host-local-i=
n-usr-libexec.patch;patchdir=3Dsrc/import \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[k3s.md5sum] =3D &quot;363d3a08dc0b72ba6e6577964f6e94a5&quot;=
<br>
-SRCREV_k3s =3D &quot;630bebf94b9dce6b8cd3d402644ed023b3af8f90&quot;<br>
+SRCREV_k3s =3D &quot;0e4fbfefe1dd8734756dfa4f9ab4fc89665cece4&quot;<br>
<br>
-PV =3D &quot;v1.18.9+git${SRCPV}&quot;<br>
+PV =3D &quot;v1.19.3+git${SRCPV}&quot;<br>
<br>
=C2=A0CNI_NETWORKING_FILES ?=3D &quot;${WORKDIR}/cni-containerd-net.conf&q=
uot;<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--0000000000006c82c205b44d76dd--
