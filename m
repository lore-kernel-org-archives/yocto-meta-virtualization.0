Return-Path: <simonkbaby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA491C05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 15:29:54 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.9204.1676647788102364197
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 07:29:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B/p+YkuB;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: simonkbaby@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id ay25so755041pfb.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MDNCvNN+26k91GB5rWAN8apSKyjPzxEQff03+rIXaWA=;
        b=B/p+YkuBTh/qhV53AL0C/5w5y6czHHivF6ewxIB+JMR9Dz0naPQmlNYL1/bbA9wWDj
         ZZZe0eJtpTv89ZWG82qlYL9bvmBoujmplr1fblI71xHQLbPyX8A13U/WjWCOAkftwE04
         KmoNrsscDP4mQ8yTQRxmHEBVr0lBajvdrvqaDzStTel1WzhXb8YmPlE78Na/II3rXlBL
         4lkPVkmJzKMVodsvs+JufyWUoHuZ3mO9fisH4vnLltw/6Set3O1Kk1mS8ipP1hV1UhXu
         Y6faVzCGazbc1LUyx+OuPL3ZUm/ARPlVamJeE42iKFvVKjl8pJAYmW0zW6fxHbyXUYuM
         ctxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDNCvNN+26k91GB5rWAN8apSKyjPzxEQff03+rIXaWA=;
        b=CQDJb13ShsXCf+VIxIW+BzKyBtbKcSLlm1F4G9O9FuAXteOpKHhr8Fwg9cqXtSBDfy
         ibf4nCjlJUD7EqMVoJUwCPkadv9/NIhUwP+ARvn/BpVmBPjR/IJhoGW4eUguKhT4UB9S
         YQbOrFxSgYa+CUelvtURv4XISGV0WHraH9u++nUHHezgp3rFtX5FmJS/He07/ewi2B7W
         KMWCDrLe9ndcEVylOIX0zC/efoYkWCSxYfinPURQCoCNIg9LZqgCRPYrX0XuwoTRhG3W
         uSHz9U123BqgHHCXzshOc9VqgB15qRqH0PXs753qsqavR/CVaE5V6CMNPuyXnXofqvQD
         KN4Q==
X-Gm-Message-State: AO0yUKU7EBq45PAnFBYdU89PJF9Wg50+D/9Y49JXKkCWvPoJWjymOtld
	gcWd53gsK8w6embcHdrSmgBdX5mfSemTB9bVS/w=
X-Google-Smtp-Source: AK7set+cV43BYdYWLRUSQXeetLCbhUs6L3z0Tmz8umtYlU/1r5BczMBsEU21TQ2tbqzcJtcIKxg2B6EtKvN3ad9vISw=
X-Received: by 2002:a63:b253:0:b0:4fb:8a44:e2d8 with SMTP id
 t19-20020a63b253000000b004fb8a44e2d8mr198028pgo.8.1676647787446; Fri, 17 Feb
 2023 07:29:47 -0800 (PST)
MIME-Version: 1.0
References: <21754.1676335870049801294@lists.yoctoproject.org>
 <20503.1676484482559550816@lists.yoctoproject.org> <CADkTA4OyU+WYmL0X3rb5o_g-=9kRz5FExvLYJXUwOhpZhHyLAQ@mail.gmail.com>
In-Reply-To: <CADkTA4OyU+WYmL0X3rb5o_g-=9kRz5FExvLYJXUwOhpZhHyLAQ@mail.gmail.com>
From: SIMON BABY <simonkbaby@gmail.com>
Date: Fri, 17 Feb 2023 07:29:36 -0800
Message-ID: <CAEFUPH3T7XexnGrnTr6hA4B3Z_aV11wxRmVoGMqnPw_KQor8tg@mail.gmail.com>
Subject: Re: [meta-virtualization] query on container demo
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c8c6f905f4e6fbc2"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 15:29:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7876

--000000000000c8c6f905f4e6fbc2
Content-Type: text/plain; charset="UTF-8"

Hello Bruce,

Thank you so much.The target I am using is NXP IMX8 (MACHINE=imx8mpevk
DISTRO=fsl-imx-wayland)
docker pull, docker run from docker hub is working fine.
Also if I generate the image with Dockerfile, docker save and then doker
run on the target, it works fine.
The issue I am getting is when I try with IMAGE_FSTYPES = "container".
Below is my bitbake recipe. Please let me know if I am missing anything.



DESCRIPTION = "Demo container application"
HOMEPAGE = "https://yoctoproject.org"
LICENSE = "CLOSED"

do_fetch[deptask] = "do_image_complete"
PACKAGE_INSTALL += "apptest"

IMAGE_FSTYPES = "container oci"
inherit image
inherit image-oci

CONTAINER_SHELL ?= "${@bb.utils.contains('PACKAGE_EXTRA_ARCHS',
'container-dummy-provides', 'container-dummy-provides', 'busybox', d)}"
IMAGE_CONTAINER_NO_DUMMY = "1"

inherit core-image
OCI_IMAGE_ENTRYPOINT = "/usr/bin/testapp"


IMAGE_ROOTFS_SIZE = "8192"
IMAGE_ROOTS_EXTRA_SPACE = "0"


Regards
Simon


On Fri, Feb 17, 2023 at 6:14 AM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> I'd suggest trying something we know is better tested before trying to
> load and run the OCI images directly.
>
> That error message normally means something is missing in your target
> image, a kernel configuration, or a support utility that docker
> requires.
>
> What is your MACHINE configuration ? I assume you are using master ?
> or is this an older release ?
>
> Can you try a simpler docker pull, docker run, test to confirm that
> official registry images work ?
>
> Bruce
>
> On Wed, Feb 15, 2023 at 1:08 PM SIMON BABY <simonkbaby@gmail.com> wrote:
> >
> > On Mon, Feb 13, 2023 at 04:51 PM, SIMON BABY wrote:
> >
> > docker: Error response from daemon: failed to create shim task: OCI
> runtime create failed: runc create failed: unable to start container
> process: can't get final child's PID from pipe: EOF: unknown.
> >
> > ERRO[0000] error waiting for container: context canceled
> >
> > Hello team,
> >  May i know the reason for the below error while trying to run the oci
> image from docker command.
> >
> > docker: Error response from daemon: failed to create shim task: OCI
> runtime create failed: runc create failed: unable to start container
> process: can't get final child's PID from pipe: EOF: unknown.
> >
> > ERRO[0000] error waiting for container: context canceled
> >
> > Regards
> > Simon
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7855):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7855
> > Mute This Topic: https://lists.yoctoproject.org/mt/96860300/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000c8c6f905f4e6fbc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Bruce,<div><br></div><div>Thank you so much.The targ=
et I am using is NXP IMX8 (MACHINE=3Dimx8mpevk DISTRO=3Dfsl-imx-wayland)</d=
iv><div>docker pull, docker run from docker hub is working fine.=C2=A0</div=
><div>Also if I generate the image with Dockerfile, docker save and then do=
ker run on the target, it works fine.</div><div>The=C2=A0issue I am getting=
=C2=A0is when I try with=C2=A0IMAGE_FSTYPES =3D &quot;container&quot;.=C2=
=A0</div><div>Below is my bitbake recipe. Please let me know=C2=A0if I am m=
issing anything.=C2=A0</div><div><br></div><div><br></div><div><br></div><d=
iv>DESCRIPTION =3D &quot;Demo container application&quot;<br>HOMEPAGE =3D &=
quot;<a href=3D"https://yoctoproject.org">https://yoctoproject.org</a>&quot=
;<br>LICENSE =3D &quot;CLOSED&quot;<br><br>do_fetch[deptask] =3D &quot;do_i=
mage_complete&quot;<br>PACKAGE_INSTALL +=3D &quot;apptest&quot;<br><br>IMAG=
E_FSTYPES =3D &quot;container oci&quot;<br>inherit image<br>inherit image-o=
ci<br><br>CONTAINER_SHELL ?=3D &quot;${@bb.utils.contains(&#39;PACKAGE_EXTR=
A_ARCHS&#39;, &#39;container-dummy-provides&#39;, &#39;container-dummy-prov=
ides&#39;, &#39;busybox&#39;, d)}&quot;<br>IMAGE_CONTAINER_NO_DUMMY =3D &qu=
ot;1&quot;<br><br>inherit core-image<br>OCI_IMAGE_ENTRYPOINT =3D &quot;/usr=
/bin/testapp&quot;<br><br><br>IMAGE_ROOTFS_SIZE =3D &quot;8192&quot;<br>IMA=
GE_ROOTS_EXTRA_SPACE =3D &quot;0&quot;<br></div><div><br></div><div><br></d=
iv><div>Regards</div><div>Simon</div><div><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 17, 2023 at=
 6:14 AM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bru=
ce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">I&#39;d suggest trying something we know is better tes=
ted before trying to<br>
load and run the OCI images directly.<br>
<br>
That error message normally means something is missing in your target<br>
image, a kernel configuration, or a support utility that docker<br>
requires.<br>
<br>
What is your MACHINE configuration ? I assume you are using master ?<br>
or is this an older release ?<br>
<br>
Can you try a simpler docker pull, docker run, test to confirm that<br>
official registry images work ?<br>
<br>
Bruce<br>
<br>
On Wed, Feb 15, 2023 at 1:08 PM SIMON BABY &lt;<a href=3D"mailto:simonkbaby=
@gmail.com" target=3D"_blank">simonkbaby@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Feb 13, 2023 at 04:51 PM, SIMON BABY wrote:<br>
&gt;<br>
&gt; docker: Error response from daemon: failed to create shim task: OCI ru=
ntime create failed: runc create failed: unable to start container process:=
 can&#39;t get final child&#39;s PID from pipe: EOF: unknown.<br>
&gt;<br>
&gt; ERRO[0000] error waiting for container: context canceled<br>
&gt;<br>
&gt; Hello team,<br>
&gt;=C2=A0 May i know the reason for the below error while trying to run th=
e oci image from docker command.<br>
&gt;<br>
&gt; docker: Error response from daemon: failed to create shim task: OCI ru=
ntime create failed: runc create failed: unable to start container process:=
 can&#39;t get final child&#39;s PID from pipe: EOF: unknown.<br>
&gt;<br>
&gt; ERRO[0000] error waiting for container: context canceled<br>
&gt;<br>
&gt; Regards<br>
&gt; Simon<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7855): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7855" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/7855</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/96860300=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/96860300/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000c8c6f905f4e6fbc2--

